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
DROP TABLE IF EXISTS mortgage.validation;
CREATE TABLE mortgage.validation
(
	code character varying(40),
	message character varying(500),
	item_num character varying(1000),
	id character varying(1000)
);


-- 1. Check if there is a lease for this mortgage. 
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'NO LEASE FOR MORTGAGE', 'Lease ' || COALESCE(m.deed_number, '-') || ' is missing for mortgage', m.mortgage_number, m.mortgage_id
FROM mortgage.mortgage m
WHERE m.dup = FALSE
AND m.deed_type = 'lease'
AND NOT EXISTS (SELECT lease_number FROM lease.lease_detail WHERE lease_number = m.deed_number); 

-- 2. Check if there is a Deed for this mortgage
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'NO DEED FOR MORTGAGE', 'Deed ' || COALESCE(m.deed_number, '-') || ' is missing for mortgage', m.mortgage_number, m.mortgage_id
FROM mortgage.mortgage m
WHERE m.dup = FALSE
AND m.deed_type = 'deed'
AND NOT EXISTS (SELECT d_num FROM lands.reg_deed_grant WHERE d_num = m.deed_number); 

-- 2a. Check if there is a Sublease for this mortgage
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'NO SUBLEASE FOR MORTGAGE', 'Sublease ' || COALESCE(m.sublease_num, '-') || ' is missing for mortgage', m.mortgage_number, m.mortgage_id
FROM mortgage.mortgage m
WHERE m.dup = FALSE
AND m.deed_type = 'sublease'
AND NOT EXISTS (SELECT sublease_number FROM lease.sl_clean WHERE sublease_number = m.sublease_num); 

-- 3. Check the variation has a matching mortgage record
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'NO MORTGAGE FOR VARIATION', 'Mortgage variation references a mortgage number that does not exist ' || COALESCE(mv.mortgage_number, '-'), mv.mortgage_variation_num, mv.mort_variation_id
FROM mortgage.mortgage_variation mv
WHERE mv.dup = FALSE
AND NOT EXISTS (SELECT  m.mortgage_id FROM mortgage.mortgage m  WHERE m.mortgage_number = mv.mortgage_number);

-- 4. Mortgage duplicated
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'DUPLICATE MORTGAGE', 'Mortgage number is duplicated', m.mortgage_number, string_agg(m.mortgage_id::VARCHAR(40), ', ')
FROM mortgage.mortgage m
WHERE m.dup = true
GROUP BY m.mortgage_number;

-- 5. Mortgage Variation duplicated 
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'DUPLICATE MORTGAGE VARIATION', 'Mortgage variation number is duplicated', mv.mortgage_variation_num, string_agg(mv.mort_variation_id::VARCHAR(40), ', ')
FROM mortgage.mortgage_variation mv
WHERE mv.dup = true
GROUP BY mv.mortgage_variation_num;

-- 6. Check if the mortgage term is < 0 or > 100
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'INVALID MORTGAGE TERM', 'Mortgage term is missing or invalid. Term: ' || COALESCE(m.term, -1)::VARCHAR(20), m.mortgage_number, m.mortgage_id
FROM mortgage.mortgage m
WHERE m.dup = FALSE
AND (m.term IS NULL OR m.term <=0 OR m.term > 100);

-- 7. Check if the mortgage term is < 0 or > 100 for Mortgage Variation
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'INVALID MORTGAGE VAR TERM', 'Mortgage Variation term is missing or invalid. Term: ' || COALESCE(mv.term, -1)::VARCHAR(20), mv.mortgage_variation_num, mv.mort_variation_id
FROM mortgage.mortgage_variation mv
WHERE mv.dup = FALSE
AND (mv.term IS NULL OR mv.term <=0 OR mv.term > 100);

-- 8. Check the bank for the mortgage is valid
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'INVALID BANK FOR MORTGAGE', 'Invalid or missing bank ' || COALESCE(m.mortgagee_bank, '-'), m.mortgage_number, m.mortgage_id
FROM mortgage.mortgage m
WHERE m.dup = FALSE
AND COALESCE(m.mortgagee_bank, 'XXX') NOT IN ('TDB', 'ANZ', 'GOV', 'WBOT', 'MBF', 'NRB');

-- 9. Check the bank for the mortgage variation is valid
INSERT INTO mortgage.validation (code, message, item_num, id)
SELECT 'INVALID BANK FOR MORTGAGE VARIATION', 'Invalid or missing bank ' || COALESCE(mv.mortgage_bank, '-'), mv.mortgage_variation_num, mv.mort_variation_id
FROM mortgage.mortgage_variation mv
WHERE mv.dup = FALSE
AND COALESCE(mv.mortgage_bank, 'XXX') NOT IN ('TDB', 'ANZ', 'GOV', 'WBOT', 'MBF', 'NRB');





