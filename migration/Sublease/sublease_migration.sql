-- Script run time: 10 seconds approx. 

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


-- Fix some town names
UPDATE administrative.ba_unit
SET name = 'Nukunamo',
    name_firstpart = 'Nukunamo'
WHERE name = 'Nukunamo Ha''apai'
AND type_code = 'townUnit'; 

-- Create Nuku'alofa if it doesn't already exist
INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, type_code, status_code, change_user)
SELECT uuid_generate_v1(), 'Nuku''alofa', 'Nuku''alofa', 'Tongatapu', 'townUnit', 'current', 'migration'
WHERE NOT EXISTS (SELECT b.id FROM administrative.ba_unit b
                  WHERE b.name = 'Nuku''alofa'
                  AND b.type_code = 'townUnit');

INSERT INTO administrative.required_relationship_baunit(from_ba_unit_id, to_ba_unit_id, relation_code, change_user)
SELECT DISTINCT 'tongatapu', b.id, 'island', 'migration' FROM administrative.ba_unit b
WHERE b.name = 'Nuku''alofa'
AND   b.type_code = 'townUnit'
AND NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit
				  WHERE from_ba_unit_id = 'tongatapu' 
				  AND to_ba_unit_id = b.id
				  AND relation_code = 'island');

-- Set the Town Ids				 
UPDATE lease.sl_clean SET sola_town_id = b.id
FROM administrative.ba_unit b
WHERE LOWER(b.name_firstpart) = LOWER(lease.sl_clean.town)
AND LOWER(b.name_lastpart) = LOWER(lease.sl_clean.island)
AND b.type_code = 'townUnit'
AND lease.sl_clean.town IS NOT NULL; 


-- Set the Head Lease/Allotment Ids				 
UPDATE lease.sl_clean SET sola_head_ba_unit_id = b.id
FROM administrative.ba_unit b
WHERE LOWER(b.name) = LOWER(lease.sl_clean.lease_or_deed)
AND b.type_code IN ('leasedUnit', 'taxUnit', 'townAllotmentUnit')
AND lease.sl_clean.lease_or_deed IS NOT NULL; 


--- *** Create the sublease Ba Units
-- Compare dates to determine current and expire lease.
INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, type_code, status_code, creation_date, change_user)
SELECT sl.sola_ba_unit_id, sl.sublease_number, (regexp_split_to_array(sl.sublease_number, '/'))[1], (regexp_split_to_array(sl.sublease_number, '/'))[2], 'subleaseUnit', CASE WHEN sl.expire_date IS NULL OR now() > sl.expire_date THEN 'historic' ELSE 'current' END, sl.reg_date, 'migration'
FROM lease.sl_clean sl
WHERE sl.cleaned = TRUE;

-- Create relationship between towns and lease
INSERT INTO administrative.required_relationship_baunit(from_ba_unit_id, to_ba_unit_id, relation_code, change_user)
SELECT sl.sola_town_id, sl.sola_ba_unit_id, 'town', 'migration' FROM lease.sl_clean sl
WHERE EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sl.sola_ba_unit_id)
AND sl.sola_town_id IS NOT NULL
AND sl.cleaned = TRUE;

-- Create relationship between sublease and head lease / allotment
INSERT INTO administrative.required_relationship_baunit(from_ba_unit_id, to_ba_unit_id, relation_code, change_user)
SELECT sl.sola_head_ba_unit_id, sl.sola_ba_unit_id, 'sublease', 'migration' FROM lease.sl_clean sl
WHERE sola_head_ba_unit_id IS NOT NULL
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sl.sola_ba_unit_id)
AND sl.cleaned = TRUE;


-- *** Create lessee parties

-- Split out the second party name from the sublessees
UPDATE lease.sl_clean 
SET sublessee_name = TRIM((regexp_split_to_array(sublessee_name, '\|'))[1]),
    sublessee_name2 = TRIM((regexp_split_to_array(sublessee_name, '\|'))[2]),
    sola_sublessee_id2 = uuid_generate_v1()
WHERE sublessee_name IS NOT NULL 
AND   sublessee_name LIKE '%|%'; 

-- Load the first and second party for the sublease
INSERT INTO party.party (id, type_code, name)
SELECT sl.sola_sublessee_id, 
       CASE WHEN sl.is_company THEN 'nonNaturalPerson' ELSE 'naturalPerson' END,
       sl.sublessee_name 
FROM lease.sl_clean sl
WHERE sl.sublessee_name IS NOT NULL
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sl.sola_ba_unit_id)
AND NOT EXISTS (SELECT id FROM party.party WHERE id = sl.sola_sublessee_id)
AND sl.cleaned = TRUE
UNION
SELECT sl.sola_sublessee_id2, 
       CASE WHEN sl.is_company THEN 'nonNaturalPerson' ELSE 'naturalPerson' END,
       sl.sublessee_name2 
FROM lease.sl_clean sl
WHERE sl.sublessee_name2 IS NOT NULL
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sl.sola_ba_unit_id)
AND NOT EXISTS (SELECT id FROM party.party WHERE id = sl.sola_sublessee_id2)
AND sl.cleaned = TRUE;



-- *** Create the RRR for the sublease and link this RRR to the lessee
INSERT INTO administrative.rrr (id, ba_unit_id, nr, type_code, status_code, is_primary,
transaction_id, registration_date, registry_book_ref, start_date, expiration_date, term, amount, 
 other_rightholder_name, change_user)
SELECT sola_rrr_id, sola_ba_unit_id, sublease_number, 'sublease', 
CASE WHEN expire_date IS NULL OR now() > expire_date THEN 'historic' ELSE 'current' END, TRUE, 
'migration', COALESCE(transfer_date, reg_date), sublease_number, start_date, expire_date, duration, 
safe_cast(rental_per_year, null::numeric(29,2)), sublessor_name, 'migration'
FROM lease.sl_clean
WHERE EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_ba_unit_id)
AND NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = sola_rrr_id)
AND cleaned = TRUE;

-- Link the Lessee to the lease RRR
INSERT INTO administrative.party_for_rrr(rrr_id, party_id)
SELECT sola_rrr_id, sola_sublessee_id
FROM lease.sl_clean
WHERE cleaned = TRUE
AND   sola_sublessee_id IS NOT NULL
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_ba_unit_id)
AND NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr 
                WHERE rrr_id = sola_rrr_id
				AND party_id = sola_sublessee_id)
UNION
SELECT sola_rrr_id, sola_sublessee_id2
FROM lease.sl_clean
WHERE cleaned = TRUE
AND   sola_sublessee_id2 IS NOT NULL
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_ba_unit_id)
AND NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr 
                WHERE rrr_id = sola_rrr_id
				AND party_id = sola_sublessee_id2);

-- Create the notations for the lease rrrs
INSERT INTO administrative.notation (id, rrr_id, transaction_id, reference_nr, notation_text, status_code)
SELECT uuid_generate_v1(), sola_rrr_id, 'migration', TRIM(SUBSTRING(sublease_number FROM 1 FOR 15)), remarks,  'current'
FROM lease.sl_clean
WHERE cleaned = TRUE
AND NOT EXISTS  (SELECT id FROM administrative.notation 
                WHERE rrr_id = sola_rrr_id)
AND EXISTS (SELECT id FROM administrative.rrr r
            WHERE r.id = sola_rrr_id);	
						
				
-- *** Create official areas

-- Upload the areas for each BA Unit 
INSERT INTO administrative.ba_unit_area (id, ba_unit_id, type_code, size, change_user)
SELECT uuid_generate_v1(), sola_ba_unit_id, 'officialArea', safe_cast(total_area, null::numeric(19,2)), 'migration'
FROM lease.sl_clean
WHERE cleaned = TRUE
AND safe_cast(total_area, null::numeric(19,2)) IS NOT NULL
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_ba_unit_id)
AND NOT EXISTS (SELECT id FROM administrative.ba_unit_area WHERE ba_unit_id = sola_ba_unit_id);


-- *** Create Cadastre Objects based on lease location survey details

-- Check if the parcel has already been created for an allotment or lease and update
-- the co_id accordingly. 
UPDATE lease.sl_clean
SET sola_co_id = co.id 
FROM cadastre.cadastre_object co                
WHERE LOWER(co.name_firstpart) = LOWER(lot_number)
AND LOWER(co.name_lastpart) = LOWER(plan_number)
AND cleaned = TRUE
AND lot_number IS NOT NULL
AND plan_number IS NOT NULL;

UPDATE lease.sl_clean
SET sola_co_id =  uuid_generate_v1()               
WHERE cleaned = TRUE
AND lot_number IS NOT NULL
AND plan_number IS NOT NULL
AND sola_co_id IS NULL;

-- Lot number appears to be incorrect on this sublease. 
UPDATE lease.sl_clean
SET lot_number = '11'
WHERE sublease_number = '1/95';

INSERT INTO cadastre.spatial_unit (id, level_id)
SELECT sola_co_id, 'sublease' FROM lease.sl_clean
WHERE cleaned = TRUE AND sola_co_id IS NOT NULL
AND NOT EXISTS (SELECT id FROM cadastre.spatial_unit WHERE id = sola_co_id);  

INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, status_code, transaction_id)
SELECT DISTINCT sola_co_id, lot_number, plan_number, 'current', 'migration' 
FROM lease.sl_clean
WHERE cleaned = TRUE AND sola_co_id IS NOT NULL
AND NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE id = sola_co_id);

INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id)
SELECT sola_ba_unit_id, sola_co_id
FROM lease.sl_clean 
WHERE cleaned = TRUE AND sola_co_id IS NOT NULL
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_ba_unit_id)
AND NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit 
                WHERE ba_unit_id = sola_ba_unit_id
				AND spatial_unit_id = sola_co_id);


