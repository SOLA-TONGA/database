-- Script run time: 60 seconds approx. 


-- Run the migration scripts in the following order...
-- 1) lands_prep_migration_tables.sql
-- 2) lands_migration.sql
-- 3) lands_validate_migration.sql
-- 4) nobel_estates.sql
-- 5) lease_prep_migration_tables.sql
-- 6) lease_migration.sql
-- 7) lease_validate_migration.sql
-- 8) sublease_backup.sql
-- 9) sublease_prep_migration_tables.sql
-- 10) sublease_migration.sql
-- 11) mortgage_prep_migration_tables.sql
-- 12) mortgage_migration.sql
-- 13) mortgage_validate_migration.sql
-- 14) migration_counts


-- Function that can be used to return a default value (e.g. null) if it cannot
-- be cast to the anyelement type.
-- Example Usage; safe_cast (<column>, null::date)
create or replace function safe_cast(text,anyelement) 
returns anyelement 
language plpgsql as $$ 
begin 
    $0 := $1; 
    return $0; 
    exception when others then 
        return $2; 
end; $$;


-- *** Islands
UPDATE lease.lease_detail SET sola_island = TRIM(lease_island); 
UPDATE lease.lease_detail SET sola_island = 'Tongatapu' WHERE lease_island = 'tongatapu'; 
UPDATE lease.lease_detail SET sola_island = 'Niuafo''ou' WHERE lease_island = 'NiuaFo''ou'; 

-- Load Islands as BA Units
INSERT INTO lease.island (id, name) 
SELECT DISTINCT LOWER(TRIM(regexp_replace(sola_island, '''', '', 'g'))), sola_island FROM lease.lease_detail;

INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, type_code, status_code, change_user)
SELECT i.id, i.name, i.name , 'Island', 'islandUnit', 'current', 'migration'
FROM lease.island i
WHERE NOT EXISTS (SELECT b.id FROM administrative.ba_unit b
                  WHERE b.id = i.id
                  AND b.type_code = 'islandUnit');

				  
-- *** Towns
-- Initialize town staging area from lease_town and remove any extra spaces 
UPDATE lease.lease_detail SET sola_town = TRIM(lease_town);
-- Remove any double qoutes and replace with single qoutes
UPDATE lease.lease_detail SET sola_town = TRIM(regexp_replace(sola_town, '"', '''', 'g'))
WHERE TRIM(regexp_replace(sola_town, '"', '''', 'g')) != sola_town;
-- Standardize Island text
UPDATE lease.lease_detail SET sola_town = TRIM(regexp_replace(sola_town, 'Is|Is.', 'Island', 'g'))
WHERE TRIM(regexp_replace(sola_town, 'Is|Is.', 'Island', 'g')) != sola_town;
-- Remove common island prefixes
UPDATE lease.lease_detail SET sola_town = TRIM(regexp_replace(sola_town, ',.*|Vv|/.*|\(.*', '', 'g'))
WHERE TRIM(regexp_replace(sola_town, ',.*|Vv|/.*|\(.*', '', 'g')) != sola_town;
-- Reset case on town name
UPDATE lease.lease_detail SET sola_town = SUBSTRING(UPPER(sola_town), 1, 1) || SUBSTRING(LOWER(sola_town),2, LENGTH(sola_town))   
WHERE (UPPER(sola_town) = sola_town OR  sola_town = LOWER(sola_town));
-- Fix invalid names
UPDATE lease.lease_detail SET sola_town = '''Utulau' WHERE sola_town = '''utulau';
UPDATE lease.lease_detail SET sola_town = 'Haveluloto' WHERE sola_town = 'Havelulloto';
UPDATE lease.lease_detail SET sola_town = 'Neiafu' WHERE sola_town = 'Neiafu tt';
UPDATE lease.lease_detail SET sola_town = 'Nga''unoho' WHERE sola_town = 'NGa''unoho';
UPDATE lease.lease_detail SET sola_town = 'Nualei Kolofo''ou' WHERE sola_town = 'Nualei - Kolofo''ou';
 
-- Load Towns as BA Units
INSERT INTO lease.town (name, island) 
SELECT DISTINCT sola_town, sola_island 
FROM lease.lease_detail;

UPDATE lease.town SET id = b.id
FROM administrative.ba_unit b
WHERE b.name_firstpart = lease.town.name
AND b.name_lastpart = lease.town.island
AND b.type_code = 'townUnit'; 

INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, type_code, status_code, change_user)
SELECT t.id, t.name, t.name, t.island, 'townUnit', 'current', 'migration'
FROM lease.town t
WHERE t.name IS NOT NULL
AND NOT EXISTS (SELECT b.id FROM administrative.ba_unit b
                  WHERE b.id = t.id
                  AND b.type_code = 'townUnit');

INSERT INTO administrative.required_relationship_baunit(from_ba_unit_id, to_ba_unit_id, relation_code, change_user)
SELECT DISTINCT i.id, t.id, 'island', 'migration' FROM lease.island i, lease.town t
WHERE i.name = t.island
AND t.name IS NOT NULL
AND NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit
				  WHERE from_ba_unit_id = i.id 
				  AND to_ba_unit_id = t.id
				  AND relation_code = 'island');



-- *** Create Lease BA Units
-- Mark all duplicate lease numbers
UPDATE lease.lease_detail SET dup = TRUE
WHERE lease_number in (
SELECT lease_number from lease.lease_detail GROUP BY lease_number having count(*) > 1);

-- Compare dates to determine current and expire lease.
INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, type_code, creation_date, status_code, change_user, registered_name)
SELECT sola_ba_unit_id, lease_number, lease_number, 'Lease', 'leasedUnit', safe_cast(lease_reg_date, null::date),
	(SELECT (CASE WHEN safe_cast(lease_exp_date, null::date) IS NULL OR now() > safe_cast(lease_exp_date, null::date) THEN 'historic' ELSE 'current' END)), 'migration', NULL
FROM lease.lease_detail
WHERE dup = FALSE;


-- Create relationship between towns and lease
INSERT INTO administrative.required_relationship_baunit(from_ba_unit_id, to_ba_unit_id, relation_code, change_user)
SELECT t.id, d.sola_ba_unit_id, 'town', 'migration' FROM lease.town t, lease.lease_detail d
WHERE t.name = d.sola_town AND t.island = d.sola_island
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = d.sola_ba_unit_id);


-- ** TODO ** Create relationship between lease and allotment
-- 

-- *** Create lessee and lessor parties

UPDATE lease.lease_detail SET lessor_estate = 'Other' WHERE lessor_estate = 'other';
UPDATE lease.lease_detail SET lessor_estate = 'Noble' WHERE lessor_estate = 'Nobles';

INSERT INTO party.party (id, type_code, name)
SELECT sola_lessee_id, 'naturalPerson',lessee_name FROM lease.lease_detail
WHERE EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_ba_unit_id)
AND NOT EXISTS (SELECT id FROM party.party WHERE id = sola_lessee_id);

/* AM 2 Oct - Rather than create party records for the lessor, set them as the 
   other_rightholder_name on the lease rrr
   
UPDATE lease.lease_detail
SET sola_lessor_id = p.id
FROM party.party p
WHERE lessor_estate IN ('Noble', 'King')
AND TRIM(LOWER(p.name)) = TRIM(LOWER(lessor_name));

INSERT INTO party.party (id, type_code, name)
SELECT d.sola_lessor_id, 
(CASE d.lessor_estate WHEN 'Government' THEN 'nonNaturalPerson' ELSE 'naturalPerson' END), 
d.lessor_name FROM lease.lease_detail d
WHERE EXISTS (SELECT id FROM administrative.ba_unit WHERE id = d.sola_ba_unit_id)
AND NOT EXISTS (SELECT id FROM party.party WHERE id = d.sola_lessor_id); */


-- *** Create the RRR for the lease and link this RRR to the lessor
INSERT INTO administrative.rrr (id, ba_unit_id, nr, type_code, status_code, is_primary,
transaction_id, registration_date, registry_book_ref, start_date, expiration_date, amount, receipt_reference, 
receipt_date, due_date, receipt_amount, other_rightholder_name, change_user)
SELECT sola_rrr_id, sola_ba_unit_id, lease_number, 'lease', 
CASE WHEN safe_cast(lease_exp_date, null::date) IS NULL OR now() > safe_cast(lease_exp_date, null::date) THEN 'historic' ELSE 'current' END, 
't', 'migration', safe_cast(lease_reg_date, null::date), lease_number, safe_cast(lease_reg_date, null::date), safe_cast(lease_exp_date, null::date),  
safe_cast(lease_rental, null::numeric(29,2)), payment_receipt_number, safe_cast(lease_payment_date, null::date), 
safe_cast(payment_upto_date, null::date), safe_cast(lease_rental, null::numeric(29,2)),lessor_name, 'migration'
FROM lease.lease_detail
WHERE EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_ba_unit_id)
AND NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = sola_rrr_id);

-- Calculate the term of the lease in years
UPDATE administrative.rrr 
SET term = EXTRACT('year' FROM expiration_date) - EXTRACT('year' FROM start_date) 
WHERE start_date IS NOT NULL
AND expiration_date IS NOT NULL
AND type_code = 'lease';

-- Link the Lessee to the lease RRR
INSERT INTO administrative.party_for_rrr(rrr_id, party_id)
SELECT sola_rrr_id, sola_lessee_id
FROM lease.lease_detail 
WHERE EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_ba_unit_id)
AND NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr 
                WHERE rrr_id = sola_rrr_id
				AND party_id = sola_lessee_id);

-- Create the notations for the lease rrrs
INSERT INTO administrative.notation (id, rrr_id, transaction_id, reference_nr, notation_text, status_code)
SELECT uuid_generate_v1(), l.sola_rrr_id, 'migration', TRIM(SUBSTRING(l.lease_number FROM 1 FOR 15)), l.lease_for,  'current'
FROM lease.lease_detail l
WHERE NOT EXISTS  (SELECT id FROM administrative.notation 
                WHERE rrr_id = l.sola_rrr_id)
AND EXISTS (SELECT id FROM administrative.rrr r
            WHERE r.id = l.sola_rrr_id);	
			
			
				
-- *** Create official areas
-- Cast the msq to metres
UPDATE lease.lease_location 
SET sola_area = safe_cast(TRIM(regexp_replace(lease_area, 'msq', '', 'g')), null::NUMERIC(19,2))
WHERE lease_area LIKE '%msq'; 

-- Cast ha to metres
UPDATE lease.lease_location 
SET sola_area = safe_cast(TRIM(regexp_replace(lease_area, 'ha', '', 'g')), null::NUMERIC(19,2))*10000
WHERE lease_area LIKE '%ha'; 


-- *** Cast Imperial Area to metres
UPDATE lease.lease_location
SET imperial = lower(lease_area)
WHERE lease_area NOT LIKE '%msq' AND lease_area NOT LIKE '%ha';

-- Replace all pa and pp with p to indicate perches
UPDATE lease.lease_location SET imperial = TRIM(regexp_replace(imperial, 'pa|pp', 'p', 'g'))
WHERE TRIM(regexp_replace(imperial, 'pa|pp', 'p', 'g')) != imperial;

-- Extract the acreage - make those fields with invalid imperial measure with -1
UPDATE lease.lease_location
SET acre = safe_cast(TRIM(substring(imperial from '#"%#"a%' for '#')), -1::INT)
WHERE imperial IS NOT NULL AND imperial LIKE '%a%'; 

-- Extract the roods where an acre measure is given
UPDATE lease.lease_location
SET rood = safe_cast(TRIM(substring(imperial from '%a ?#"%#"r%' for '#')), -1::INT)
WHERE imperial IS NOT NULL AND imperial LIKE '%a%r%'; 

-- Extract the roods where no acre measure is given
UPDATE lease.lease_location
SET rood = safe_cast(TRIM(substring(imperial from '#"%#"r%' for '#')), -1::INT)
WHERE imperial IS NOT NULL AND imperial LIKE '%r%' AND imperial NOT LIKE '%a%'; 

-- Extract the perches where roods is specified
UPDATE lease.lease_location
SET perch = safe_cast(TRIM(substring(imperial from '%r ?#"%#"p' for '#')), -1::NUMERIC(19,2))
WHERE imperial IS NOT NULL AND imperial LIKE '%r%p%';

-- Extract the perches where acres are specified
UPDATE lease.lease_location
SET perch = safe_cast(TRIM(substring(imperial from '%a ?#"%#"p' for '#')), -1::NUMERIC(19,2))
WHERE imperial IS NOT NULL AND imperial LIKE '%a%p%' AND imperial NOT LIKE '%r%';

-- Extract the perches where no roods or acres are specified
UPDATE lease.lease_location
SET perch = safe_cast(TRIM(substring(imperial from '#"%#"p' for '#')), -1::NUMERIC(19,2))
WHERE imperial IS NOT NULL AND imperial LIKE '%p%' 
AND imperial NOT LIKE '%r%' AND imperial NOT LIKE '%a%'; 

-- Blank out any invalid imperial areas
UPDATE lease.lease_location
SET acre = NULL, 
rood = NULL,
perch = NULL
WHERE acre = -1 OR rood = -1 OR perch = -1
OR rood >= 4 OR perch >= 40;  

-- Set the new lease area
-- Set the new lease area
UPDATE lease.lease_location
SET sola_area = ROUND((COALESCE(acre, 0) * 4046.8564) -- 1 arce = 4046.8564 square metres
                   + (COALESCE(rood, 0) * 1011.7141) -- 4 roods in an acre
				   + (COALESCE(perch, 0) * 25.2929), 2) -- 40 perches in a rood
WHERE imperial IS NOT NULL; 

-- Remove any 0 areas
UPDATE lease.lease_location
SET sola_area = NULL
WHERE sola_area = 0; 


-- Upload the areas for each BA Unit 
INSERT INTO administrative.ba_unit_area (id, ba_unit_id, type_code, size, change_user)
SELECT uuid_generate_v1(), d.sola_ba_unit_id, 'officialArea', l.sola_area, 'migration'
FROM lease.lease_detail d, lease.lease_location l
WHERE d.lease_number = l.lease_number
AND sola_area IS NOT NULL
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = d.sola_ba_unit_id)
AND NOT EXISTS (SELECT id FROM administrative.ba_unit_area WHERE ba_unit_id = d.sola_ba_unit_id);



-- *** Create Cadastre Objects based on lease location survey details

-- Mark the duplicate plan locations. 
UPDATE lease.lease_location 
SET dup = true
WHERE EXISTS (SELECT l.lease_id
FROM lease.lease_location l
WHERE l.lease_lot = lease.lease_location.lease_lot
AND l.lease_plan = lease.lease_location.lease_plan
AND l.lease_id != lease.lease_location.lease_id);


-- Reset the co_ids for all of the leases that have duplicate plan details. 
UPDATE lease.lease_location
SET sola_co_id = (SELECT MIN(l.sola_co_id) FROM lease.lease_location l
                  WHERE l.lease_lot = lease.lease_location.lease_lot
		  AND l.lease_plan = lease.lease_location.lease_plan)
WHERE dup = true;

-- Check if the parcel has already been created for an allotment and update
-- the co_id accordingly. 
UPDATE lease.lease_location 
SET sola_co_id = co.id 
FROM cadastre.cadastre_object co                
WHERE co.name_firstpart = lease.lease_location.lease_lot
AND co.name_lastpart = lease.lease_location.lease_plan;

INSERT INTO cadastre.spatial_unit (id, level_id)
SELECT DISTINCT sola_co_id, 'lease' FROM lease.lease_location
WHERE NOT EXISTS (SELECT id FROM cadastre.spatial_unit WHERE id = sola_co_id);  

INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, status_code, transaction_id)
SELECT DISTINCT sola_co_id, lease_lot, lease_plan, 'current', 'migration' 
FROM lease.lease_location
WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE id = sola_co_id);

INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id)
SELECT DISTINCT d.sola_ba_unit_id, l.sola_co_id
FROM lease.lease_detail d, lease.lease_location l
WHERE d.lease_number = l.lease_number
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = d.sola_ba_unit_id)
AND NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit 
                WHERE ba_unit_id = d.sola_ba_unit_id
				AND spatial_unit_id = l.sola_co_id);


