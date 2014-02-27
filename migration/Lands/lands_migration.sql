-- Script run time: 400 seconds (6 mins, 40s) approx.

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

-- *** Create migration support records
INSERT INTO transaction.transaction(id, status_code, approval_datetime, change_user) 
SELECT 'migration', 'approved', now(), 'migration' WHERE NOT EXISTS 
(SELECT id FROM transaction.transaction WHERE id = 'migration');

UPDATE lands.nobles SET sola_party_id = LOWER(noble_name); 

-- *** Process Nobles and the King *** 
/*INSERT INTO party.party (id, type_code, name, change_user)
SELECT sola_party_id, 'naturalPerson', noble_name, 'migration'
FROM lands.nobles
WHERE NOT EXISTS (SELECT id FROM party.party WHERE sola_party_id = id); 

INSERT INTO party.party_role (party_id, type_code, change_user)
SELECT sola_party_id, 'noble', 'migration'
FROM lands.nobles
WHERE NOT EXISTS (SELECT id FROM party.party_role WHERE sola_party_id = party_id AND type_code = 'noble'); */

INSERT INTO party.party (id, type_code, name, change_user)
SELECT 'king', 'naturalPerson', 'King', 'migration'
WHERE NOT EXISTS (SELECT id FROM party.party WHERE id = 'king');
INSERT INTO party.party_role (party_id, type_code, change_user)
SELECT 'king', 'king', 'migration'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role WHERE party_id = 'king' AND type_code = 'king');


-- *** Create Islands ***
UPDATE lands.island_township SET sola_island_id = LOWER(TRIM(regexp_replace(island_name, '''', '', 'g'))); 

INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, type_code, status_code, change_user)
SELECT DISTINCT sola_island_id, island_name, island_name , 'Island', 'islandUnit', 'current', 'migration'
FROM lands.island_township
WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_island_id); 

INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, type_code, status_code, change_user)
SELECT 'niuatoputapu', 'Niuatoputapu', 'Niuatoputapu' , 'Island', 'islandUnit', 'current', 'migration'
WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE id = 'niuatoputapu');

INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, type_code, status_code, change_user)
SELECT 'niuafoou', 'Niuafo''ou', 'Niuafo''ou' , 'Island', 'islandUnit', 'current', 'migration'
WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE id = 'niuafoou');


-- *** Standardise/clean towns and create ***
UPDATE lands.island_township SET sola_town = township_name; 

UPDATE lands.island_township SET sola_town = SUBSTRING(UPPER(township_name), 1, 1) || SUBSTRING(LOWER(township_name),2, LENGTH(township_name))   
WHERE (UPPER(township_name) = township_name OR  township_name = LOWER(township_name));

UPDATE lands.island_township SET sola_town = SUBSTRING(UPPER(township_name), 1, 2) || SUBSTRING(LOWER(township_name),3, LENGTH(township_name))   
WHERE SUBSTRING(township_name, 1, 1) = '''';

UPDATE lands.island_township SET sola_town = 'Matahau Ha''atoa'
WHERE township_name = 'MATAHAU HA''ATOA';

UPDATE lands.island_township SET sola_town_id = b.id
FROM administrative.ba_unit b
WHERE b.name_firstpart = sola_town
AND b.type_code = 'townUnit'; 

INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, type_code, status_code, change_user)
SELECT sola_town_id, sola_town, sola_town, island_name, 'townUnit', 'current', 'migration'
FROM lands.island_township 
WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_town_id);


-- *** Link islands and towns
INSERT INTO administrative.required_relationship_baunit(from_ba_unit_id, to_ba_unit_id, relation_code, change_user)
SELECT sola_island_id, sola_town_id, 'island', 'migration' FROM lands.island_township
WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit
				  WHERE from_ba_unit_id = sola_island_id 
				  AND to_ba_unit_id = sola_town_id
				  AND relation_code = 'island'); 



-- *** Create BA Units for Tax and Town allotments
-- Attempt to de-duplicate the deed grants as much as possible
INSERT INTO lands.deed (id, deed_num, town, tax_lot, area_orig, plan_type, plan_num, lot_num, parcel_name)
SELECT MIN(id), d_num, TRIM(LOWER(dg_type)), CASE WHEN dg_apname ~* 'TAX' THEN TRUE ELSE FALSE END, TRIM(LOWER(dg_mpref)),
CASE WHEN TRIM(dg_pref) = '' THEN NULL ELSE TRIM(UPPER(dg_pref)) END, TRIM(UPPER(dg_mplot)), TRIM(UPPER(dg_island)), TRIM(dg_area)
FROM lands.reg_deed_grant
GROUP BY 2, 3, 4, 5, 6, 7, 8, 9;

-- Get the reference number from the registration book
UPDATE lands.deed
SET registry_book_ref = (SELECT MAX(bk.bkv_regnum || ' ' || bk.bkv_index)
                         FROM lands.reg_bookvol bk
						 WHERE bk.d_num = lands.deed.deed_num)
WHERE EXISTS (SELECT d_num FROM lands.reg_bookvol
              WHERE d_num = lands.deed.deed_num);

-- Some records have an area while others don't so remove the duplicates that do not have an area
DELETE FROM lands.deed WHERE area_orig = '' 
AND EXISTS (SELECT id FROM lands.reg_deed_grant WHERE d_num = deed_num AND dg_mpref != '' ); 

-- The remaining duplicates will need to be manually validated. Remove them from the staging table
DELETE FROM lands.deed WHERE deed_num in (SELECT deed_num FROM  lands.deed
GROUP BY deed_num HAVING COUNT(*) > 1); 

-- Mark the duplicate records in the deed_grant table so they can be reported later
UPDATE lands.reg_deed_grant SET dup = TRUE
WHERE d_num IN (SELECT d_num FROM  lands.reg_deed_grant
                GROUP BY d_num HAVING COUNT(*) > 1)
AND d_num NOT IN (SELECT deed_num FROM lands.deed);

-- Clean up the deed numbers. Remove any that do not have 1 / character. 
DELETE FROM lands.deed WHERE array_length(regexp_split_to_array (deed_num, '/'), 1) != 2; 

-- Split the deed number into first and last part
UPDATE lands.deed 
SET part1 = TRIM((regexp_split_to_array (deed_num, '/'))[1]),
    part2 = TRIM((regexp_split_to_array (deed_num, '/'))[2]); 
	
-- Set the registration date for the deeds based on the date in the reg_qury table
UPDATE lands.deed
SET    reg_date = (SELECT MIN(safe_cast(TRIM(q.date), NULL::DATE))
                   FROM  lands.reg_qury q
                   WHERE deed_num = q.d_num);
				   
-- Fix any issues with the town names in the deed table
UPDATE lands.deed SET town = '''atata'
WHERE town = 'atata'; 
	
-- Create the tax and town allotment BA Units. 
INSERT INTO administrative.ba_unit (id, name, name_firstpart, name_lastpart, registered_name, type_code, creation_date, status_code, change_user)
SELECT sola_ba_unit_id, deed_num, part1, part2, parcel_name,
CASE WHEN tax_lot THEN 'taxUnit' ELSE 'townAllotmentUnit' END, reg_date, 'current', 'migation' 
FROM lands.deed
WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE id = sola_ba_unit_id);


-- *** Link the new BA Units to the appropriate town
INSERT INTO administrative.required_relationship_baunit(from_ba_unit_id, to_ba_unit_id, relation_code, change_user)
SELECT town.id, d.sola_ba_unit_id, 'town', 'migration' 
FROM lands.deed d, administrative.ba_unit town
WHERE town.type_code = 'townUnit'
AND   d.town = LOWER(town.name_firstpart)
AND   d.town NOT IN ('''ahau', 'houma', 'holonga', 'pangai') -- Exclude towns where the name of the town is used over multiple islands
AND NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit
				  WHERE from_ba_unit_id = town.id 
				  AND to_ba_unit_id = d.sola_ba_unit_id
				  AND relation_code = 'town');

				  
-- Try to determine the correct town using the island name
INSERT INTO administrative.required_relationship_baunit(from_ba_unit_id, to_ba_unit_id, relation_code, change_user)
SELECT town.id, d.sola_ba_unit_id, 'town', 'migration' 
FROM lands.deed d, administrative.ba_unit town, lands.reg_deed_grant g
WHERE town.type_code = 'townUnit'
AND   d.town = LOWER(town.name_firstpart)
AND   d.id = g.id
AND   LOWER(g.dg_island) = LOWER(town.name_lastpart)
AND   d.town IN ('''ahau', 'houma', 'holonga', 'pangai')
AND NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit
				  WHERE from_ba_unit_id = town.id 
				  AND to_ba_unit_id = d.sola_ba_unit_id
				  AND relation_code = 'town');
				  


-- *** Create allotment holders as parties	
-- Create a summary of the land holders based on the cleaned up deeds			  
INSERT INTO lands.holder (id, deed_num, fname, lname, holder_type)
SELECT MIN(l.id), l.d_num, l.reg_first_name, l.reg_last_name, 
CASE WHEN reg_island IS NULL THEN reg_township ELSE reg_island END as holder_type
FROM lands.reg_landholder l, lands.deed d
WHERE d.deed_num = l.d_num
GROUP BY d_num, reg_first_name, reg_last_name, 5; 

-- Update the holder_type
UPDATE lands.holder SET holder_type = 'WIDOWER' WHERE holder_type = 'WIDOW';
UPDATE lands.holder SET holder_type = 'REG' WHERE holder_type = '';

-- Mark recods with duplicate Registered holders for later reporting
UPDATE lands.holder
SET dup = TRUE
WHERE (SELECT count(*)
       FROM lands.holder h
       WHERE h.holder_type = 'REG'
       AND h.deed_num = lands.holder.deed_num) > 1
AND holder_type = 'REG';

-- Mark records with duplicate Widowers for later reporting
UPDATE lands.holder
SET dup = TRUE
WHERE (SELECT count(*)
       FROM lands.holder h
       WHERE h.holder_type = 'WIDOWER'
       AND h.deed_num = lands.holder.deed_num) > 1
AND holder_type = 'WIDOWER';

-- Copy the registration date from the deed onto the Register Land Holders.
-- Its not currently possible to determine when Hiers and Widows were registered. 
UPDATE lands.holder
SET reg_date = d.reg_date
FROM lands.deed d
WHERE d.deed_num = lands.holder.deed_num 
AND lands.holder.holder_type = 'REG'
AND lands.holder.dup = FALSE
AND d.reg_date IS NOT NULL;

-- Mark the registered land holders that are now deceased as there is a
-- Widow or Heir
UPDATE lands.holder
SET status = 'h'
WHERE lands.holder.holder_type = 'REG'
AND lands.holder.dup = FALSE
AND EXISTS (SELECT id FROM lands.holder h
            WHERE h.holder_type NOT IN ('REG', 'WIDOWER')
			AND dup = FALSE
			AND h.deed_num = lands.holder.deed_num);

-- Create the various land holders
INSERT INTO party.party (id, type_code, name, last_name)
SELECT sola_party_id, 'naturalPerson', fname, lname
FROM lands.holder
WHERE dup = FALSE; 
 
			  
-- Create the RRRs representing the registered allotment holders, the heirs and the widows  
INSERT INTO administrative.rrr (id, ba_unit_id, nr, type_code, status_code, is_primary, registration_date, registry_book_ref, transaction_id, change_user)
SELECT h.sola_rrr_id, d.sola_ba_unit_id, 
 CASE WHEN h.holder_type = 'REG' THEN d.deed_num WHEN h.holder_type = 'WIDOWER' THEN d.deed_num || '-wid' ELSE d.deed_num || '-heir' END, 
 CASE WHEN h.holder_type = 'WIDOWER' THEN 'lifeEstate' ELSE 'ownership' END, 
 CASE WHEN h.status = 'c' THEN 'current' ELSE 'historic' END, 
 CASE WHEN h.holder_type = 'WIDOWER' THEN FALSE ELSE TRUE END, h.reg_date, d.registry_book_ref, 'migration', 'migration'
FROM lands.deed d, lands.holder h
WHERE d.deed_num = h.deed_num
AND h.dup = FALSE
AND NOT EXISTS (SELECT r.id FROM administrative.rrr r WHERE r.id = h.sola_rrr_id);



-- *** Create the Shares for the ownership RRRs
-- Create the shares for the ownership RRRs (REG and HEIRs). Assume all shares are 1/1 
INSERT INTO administrative.rrr_share (rrr_id, id, nominator, denominator)
SELECT h.sola_rrr_id, uuid_generate_v1(), 1, 1
FROM lands.holder h
WHERE NOT EXISTS (SELECT r.id FROM administrative.rrr_share r WHERE r.rrr_id = h.sola_rrr_id)
AND h.holder_type != 'WIDOWER'
AND h.dup = FALSE;


-- *** Create the party for rrr records
INSERT INTO administrative.party_for_rrr(rrr_id, party_id, share_id)
SELECT h.sola_rrr_id, h.sola_party_id, s.id
FROM lands.holder h, administrative.rrr_share s
WHERE s.rrr_id = h.sola_rrr_id
AND h.holder_type != 'WIDOWER'
AND h.dup = FALSE
AND NOT EXISTS  (SELECT rrr_id FROM administrative.party_for_rrr 
                WHERE rrr_id = h.sola_rrr_id
				AND   party_id = h.sola_party_id );

-- Create the life estate parties.				
INSERT INTO administrative.party_for_rrr(rrr_id, party_id, share_id)
SELECT h.sola_rrr_id, h.sola_party_id, null
FROM lands.holder h
WHERE h.holder_type = 'WIDOWER'
AND h.dup = FALSE
AND NOT EXISTS  (SELECT rrr_id FROM administrative.party_for_rrr 
                WHERE rrr_id = h.sola_rrr_id
				AND   party_id = h.sola_party_id );
	
	
	
-- *** Create the Notation records for each RRR
INSERT INTO administrative.notation (id, rrr_id, transaction_id, reference_nr, notation_text, status_code)
SELECT uuid_generate_v1(), h.sola_rrr_id, 'migration', 
CASE WHEN h.holder_type = 'REG' THEN h.deed_num WHEN h.holder_type = 'WIDOWER' THEN SUBSTRING(h.deed_num FROM 1 FOR 10) || '-wid'
     ELSE SUBSTRING(h.deed_num FROM 1 FOR 10)|| '-heir' END, 
CASE WHEN h.holder_type = 'REG' THEN 'Registered Landholder' WHEN h.holder_type = 'WIDOWER' THEN 'Widower'
     ELSE h.holder_type END, 'current'
FROM lands.holder h
WHERE h.dup = FALSE
AND NOT EXISTS  (SELECT id FROM administrative.notation 
                WHERE rrr_id = h.sola_rrr_id);
				

-- *** Obtain official area for allotments
-- Cast the msq to metres
UPDATE lands.deed 
SET sola_area = safe_cast(TRIM(regexp_replace(area_orig, 'm2', '', 'g')), null::NUMERIC(19,2))
WHERE TRIM(area_orig) LIKE '%m2'
AND sola_area IS NULL; 

UPDATE lands.deed 
SET sola_area = safe_cast(TRIM(regexp_replace(area_orig, 'm square', '', 'g')), null::NUMERIC(19,2))
WHERE TRIM(area_orig) LIKE '%m square'
AND sola_area IS NULL; 

-- Cast ha to m2
UPDATE lands.deed 
SET sola_area = safe_cast(TRIM(regexp_replace(area_orig, 'ha', '', 'g')), null::NUMERIC(19,2))*10000
WHERE TRIM(area_orig) LIKE '%ha'
AND sola_area IS NULL; 
 


-- *** Cast Imperial Area to metres
-- Replace all pa and pp with p to indicate perches
--UPDATE lands.deed SET sola_area = TRIM(regexp_replace(sola_area, 'pa|pp', 'p', 'g'))
--WHERE sola_area IS NULL 
--AND TTRIM(regexp_replace(imperial, 'pa|pp', 'p', 'g')) != imperial;

-- Extract the acreage - make those fields with invalid imperial measure with -1
UPDATE lands.deed
SET acre = safe_cast(TRIM(substring(area_orig from '#"%#"a%' for '#')), -1::INT)
WHERE sola_area IS NULL AND acre IS NULL AND area_orig LIKE '%a%'; 

-- Extract the roods where an acre measure is given
UPDATE lands.deed
SET rood = safe_cast(TRIM(substring(area_orig from '%a ?#"%#"r%' for '#')), -1::INT)
WHERE sola_area IS NULL AND rood IS NULL AND area_orig LIKE '%a%r%'; 

-- Extract the roods where no acre measure is given
UPDATE lands.deed
SET rood = safe_cast(TRIM(substring(area_orig from '#"%#"r%' for '#')), -1::INT)
WHERE sola_area IS NULL AND rood IS NULL AND area_orig LIKE '%r%' AND area_orig NOT LIKE '%a%'; 

-- Extract the perches where roods is specified
UPDATE lands.deed
SET perch = safe_cast(TRIM(substring(area_orig from '%r ?#"%#"p' for '#')), -1::NUMERIC(19,2))
WHERE sola_area IS NULL AND perch IS NULL AND area_orig LIKE '%r%p%';

-- Extract the perches where acres are specified
UPDATE lands.deed
SET perch = safe_cast(TRIM(substring(area_orig from '%a ?#"%#"p' for '#')), -1::NUMERIC(19,2))
WHERE sola_area IS NULL AND perch IS NULL AND area_orig LIKE '%a%p%' AND area_orig NOT LIKE '%r%';

-- Extract the perches where no roods or acres are specified
UPDATE lands.deed
SET perch = safe_cast(TRIM(substring(area_orig from '#"%#"p' for '#')), -1::NUMERIC(19,2))
WHERE sola_area IS NULL AND perch IS NULL AND area_orig LIKE '%p%' 
AND area_orig NOT LIKE '%r%' AND area_orig NOT LIKE '%a%';

-- Blank out any invalid imperial areas
UPDATE lands.deed
SET acre = NULL, 
rood = NULL,
perch = NULL
WHERE acre = -1 OR rood = -1 OR perch = -1
OR rood >= 4 OR perch >= 40;  

-- Set the new lease area
-- Set the new lease area
UPDATE lands.deed
SET sola_area = ROUND((COALESCE(acre, 0) * 4046.8564) -- 1 arce = 4046.8564 square metres
                   + (COALESCE(rood, 0) * 1011.7141) -- 4 roods in an acre
				   + (COALESCE(perch, 0) * 25.2929), 2) -- 40 perches in a rood
WHERE sola_area IS NULL 
AND (acre IS NOT NULL OR rood IS NOT NULL OR perch IS NOT NULL); 

-- Remove any 0 areas
UPDATE lands.deed
SET sola_area = NULL
WHERE sola_area = 0; 

-- Some areas have no units - assume they are m2
UPDATE lands.deed 
SET sola_area = safe_cast(TRIM(area_orig), null::NUMERIC(19,2))
WHERE sola_area IS NULL; 


-- Upload the areas for each BA Unit
INSERT INTO administrative.ba_unit_area (id, ba_unit_id, type_code, size, change_user)
SELECT uuid_generate_v1(), sola_ba_unit_id, 'officialArea', sola_area, 'migration'
FROM lands.deed
WHERE sola_area IS NOT NULL
AND NOT EXISTS (SELECT id FROM administrative.ba_unit_area WHERE ba_unit_id = sola_ba_unit_id);


-- *** Clean the plan and lot numbers.
-- Plan Type 
UPDATE lands.deed 
SET plan_type = NULL, 
    plan_num = NULL,
    lot_num = NULL
WHERE plan_type IS NULL
OR plan_type IN ('P/14', '16');
				
UPDATE lands.deed SET plan_type = 'BLK'
WHERE TRIM(plan_type) IN ('OLD BLOCK', 'BLOCK SHEET');

UPDATE lands.deed SET plan_type = 'SP'
WHERE plan_type IN ('S/PL', 'SURVEY PLAN');

UPDATE lands.deed SET plan_type = 'ROLL MAP'
WHERE plan_type IN ('ROLL PLAN');

-- Plan Number
UPDATE lands.deed 
SET plan_type = '-', 
    plan_num = NULL,
    lot_num = NULL
WHERE plan_type IN ('SP', 'BLK', 'ROLL MAP')
AND TRIM(plan_num) = ''; 

-- Lot Number
UPDATE lands.deed 
SET lot_num = ''
WHERE plan_type IN ('SP', 'BLK', 'ROLL MAP')
AND lot_num = 'TONGATAPU'; 


-- *** Create the Cadastre Objects for the Allotments
INSERT INTO lands.plan (plan_type, plan_num, lot_num, tax_lot)
SELECT  plan_type, plan_num, lot_num, MIN(tax_lot::VARCHAR)::BOOLEAN 
FROM lands.deed
WHERE plan_type IN ('SP', 'BLK', 'ROLL MAP')
GROUP BY plan_type, plan_num, lot_num;

INSERT INTO cadastre.spatial_unit (id, level_id)
SELECT sola_co_id, CASE WHEN tax_lot THEN 'taxAllotment' ELSE 'townAllotment' END FROM lands.plan
WHERE NOT EXISTS (SELECT id FROM cadastre.spatial_unit WHERE id = sola_co_id);  

INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, status_code, transaction_id)
SELECT sola_co_id, CASE WHEN lot_num = '' THEN lot_num ELSE 'Lot ' || lot_num END, 
      TRIM(plan_type || ' ' || plan_num), 'current', 'migration' 
FROM lands.plan
WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE id = sola_co_id); 

INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id)
SELECT d.sola_ba_unit_id, p.sola_co_id
FROM lands.deed d, lands.plan p
WHERE d.plan_type = p.plan_type
AND d.plan_num = p.plan_num
AND d.lot_num = p.lot_num
AND EXISTS (SELECT id FROM administrative.ba_unit WHERE id = d.sola_ba_unit_id)
AND NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit 
                WHERE ba_unit_id = d.sola_ba_unit_id
				AND spatial_unit_id = p.sola_co_id); 


