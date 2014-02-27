-- Script run time <1s

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

-- Create table to hold validation messages
DROP TABLE IF EXISTS lands.validation;
CREATE TABLE lands.validation
(
	code character varying(40),
	message character varying(4000),
	item_num character varying(1000),
	id character varying(1000)
);



-- Deed duplicated
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'DUPLICATE DEED', 'Deed has duplicate deed number', d.d_num,  string_agg(d.id::VARCHAR(40), ', ')
FROM lands.reg_deed_grant d
WHERE d.dup = true
GROUP BY d.d_num;


-- Allotments with an invalid deed number
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'INVALID DEED NUM', 'Deed number is not of the form <deed>/<folio> ' || COALESCE(d.d_num, '-')::VARCHAR(20), d.d_num, d.id
FROM lands.reg_deed_grant d
WHERE array_length(regexp_split_to_array (d.d_num, '/'), 1) != 2
AND NOT d.dup;


-- Allotments with no registration date
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'NO REG DATE', 'No registration date for deed', deed_num, id
FROM lands.deed
WHERE reg_date IS NULL;

-- Allotments with no town
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'NO TOWN', 'Town for deed could not be determined', deed_num, id
FROM lands.deed d
WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit
				  WHERE to_ba_unit_id = d.sola_ba_unit_id
				  AND relation_code = 'town');
				  

				  
-- Deed with more than one registered land holder
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'MULTIPLE REG LANDHOLDER', 'Deed with multiple registered landholders', h.deed_num, string_agg(h.id::VARCHAR(40), ', ')
FROM lands.holder h
WHERE h.dup AND h.holder_type = 'REG'
GROUP BY h.deed_num;

-- Deed with more than one widower
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'MULTIPLE WIDOWERS', 'Deed with multiple Widowers', h.deed_num, string_agg(h.id::VARCHAR(40), ', ')
FROM lands.holder h
WHERE h.dup AND h.holder_type = 'WIDOWER'
GROUP BY h.deed_num;


-- No date for when the land holder was registered. 
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'NO REG DATE FOR HOLDER', 'There is no date to indicate when the land holder was registered ', h.deed_num, h.id
FROM lands.holder h
WHERE h.dup = FALSE AND h.reg_date IS NULL
GROUP BY h.deed_num, h.id;

-- Checks if the deed area is valid
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'NO DEED AREA', 'Area for deed is not vaild ' || COALESCE(d.area_orig, '-'), d.deed_num, d.id
FROM lands.deed d
WHERE d.sola_area IS NULL;

-- Deeds with no survey plan details
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'NO SURVEY DETAILS', 'Deed does not have any survey plan and/or lot information', d.deed_num, d.id
FROM lands.deed d
WHERE d.plan_type IS NULL;

-- Deed with survey plan details that appear invalid. All Township plans are reported as it is not clear what should be used
-- as the township name. 
INSERT INTO lands.validation (code, message, item_num, id)
SELECT 'INVALID SURVEY DETAILS', 'Deed does not have valid survey plan and/or lot information' , d.deed_num, d.id
FROM lands.deed d
WHERE d.plan_type IN ('-', 'TOWNSHIP');



-- Identifies duplicate lot/plans for the allotments
INSERT INTO lands.validation (code, message, item_num)
SELECT 'DUPLICATE LOT/PLAN DEED', 'The same lot and plan is used for multiple leases and/or allotments. Check the allotments to ensure the lot and plan reference is correct. "' || 
co.name_firstpart || ' ' || co.name_lastpart || '" duplicated on allotments "' || string_agg(b.name, ', ') || '"', null
FROM administrative.ba_unit_contains_spatial_unit bas, 
     administrative.ba_unit b, 
	 cadastre.cadastre_object co
WHERE bas.spatial_unit_id = co.id
AND   b.id = bas.ba_unit_id
AND   b.type_code != 'leasedUnit'
AND   (SELECT count(bas2.ba_unit_id)
       FROM administrative.ba_unit_contains_spatial_unit bas2
	   WHERE bas2.spatial_unit_id = co.id) > 1
GROUP BY co.name_firstpart, co.name_lastpart;
