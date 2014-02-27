-- Script run time <5s

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
DROP TABLE IF EXISTS lease.validation;
CREATE TABLE lease.validation
(
	code character varying(40),
	message character varying(500),
	item_num character varying(1000),
	id character varying(1000)
);


-- 2. Identifies duplicate leases
INSERT INTO lease.validation (code, message, item_num, id)
SELECT 'DUPLICATE LEASE', 'The lease number is duplicated', l.lease_number, string_agg(l."ID"::VARCHAR(40), ', ')
FROM lease.lease_detail l
WHERE dup = true
GROUP BY l.lease_number;

-- 3. Check for towns that are not correctly specified
INSERT INTO lease.validation (code, message, item_num, id)
SELECT 'INVALID TOWN', 'Town name (' || sola_town || ') is not valid', lease_number, "ID"
FROM lease.lease_detail WHERE sola_town in ('Expire', 'Invalid', 'Residential', 'Resort', 'Valid', '');

-- 4. Check of leases with invalid or missing lease registration dates
INSERT INTO lease.validation (code, message, item_num, id)
SELECT 'INVALID LEASE REGISTRATION DATE', 'Invalid or missing lease registration date of ' || COALESCE(l.lease_reg_date, '-'), l.lease_number, l."ID"
FROM lease.lease_detail l, administrative.rrr r
WHERE l.sola_rrr_id = r.id AND r.registration_date IS NULL;

-- 5. Check of leases with invalid or missing lease expiry dates
INSERT INTO lease.validation (code, message, item_num, id)
SELECT 'INVALID LEASE EXPIRE DATE', 'Invalid or missing lease expiry date of ' || COALESCE(l.lease_exp_date, '-'), l.lease_number, l."ID"
FROM lease.lease_detail l, administrative.rrr r
WHERE l.sola_rrr_id = r.id AND r.expiration_date IS NULL;


-- 6. Verify the next payment date for rental is valid and not significantly in the past
INSERT INTO lease.validation (code, message, item_num, id)
SELECT 'INVALID DUE DATE', 'Invalid or missing lease payment date of "' || COALESCE(l.payment_upto_date, '-'), l.lease_number, l."ID"
FROM lease.lease_detail l, administrative.rrr r
WHERE l.sola_rrr_id = r.id AND (r.due_date IS NULL OR r.due_date < '1960-01-01');

-- 7. Checks if the area for the lot is valid
INSERT INTO lease.validation (code, message, item_num, id)
SELECT 'INVALID LEASE AREA', 'Invalid or missing area of ' || COALESCE(l.lease_area, '-'), l.lease_number, l.lease_id
FROM lease.lease_location l
WHERE sola_area IS NULL;

-- 8. Identifies the duplicate lot/plans for the leases
INSERT INTO lease.validation (code, message, item_num, id)
SELECT 'DUPLICATE LOT/PLAN LEASE', 'The location ' || COALESCE(l.lease_lot, '-') || ' ' || COALESCE(l.lease_plan, '-') || ' has been used for multiple leases and/or allotments',  l.lease_number, l.lease_id
FROM lease.lease_location l
WHERE (SELECT count(bas.ba_unit_id)
       FROM administrative.ba_unit_contains_spatial_unit bas
	   WHERE bas.spatial_unit_id = l.sola_co_id) > 1;


	   
-- Check the number of islands is valid
INSERT INTO lease.validation (code, message)
SELECT 'INVALID ISLAND COUNT', 'Should be 6 islands - check all islands are valid and none are missing.'
WHERE (SELECT COUNT(*) FROM lease.island) != 6;

-- Verify the rental amounts are valid numbers
INSERT INTO lease.validation (code, message, item_num, id)
SELECT 'INVALID LEASE RENTAL AMOUNT', 'Invalid or missing rental amount of ' || COALESCE(l.lease_rental, '-'), l.lease_number, l."ID"
FROM lease.lease_detail l, administrative.rrr r
WHERE l.sola_rrr_id = r.id AND r.amount IS NULL;


