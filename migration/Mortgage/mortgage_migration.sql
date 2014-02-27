-- Script run time: 80 seconds approx.

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

-- Create the banks for that can be registered for Mortgages
INSERT INTO party.party (id, type_code, name, change_user)
SELECT 'ANZ', 'nonNaturalPerson', 'ANZ Bank (Tonga) Limited', 'migration'
WHERE NOT EXISTS (SELECT id FROM party.party WHERE id = 'ANZ');
INSERT INTO party.party_role (party_id, type_code, change_user)
SELECT 'ANZ', 'bank', 'migration'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role WHERE party_id = 'ANZ' AND type_code = 'bank');  

INSERT INTO party.party (id, type_code, name, change_user)
SELECT 'GOV', 'nonNaturalPerson', 'Government of Tonga', 'migration'
WHERE NOT EXISTS (SELECT id FROM party.party WHERE id = 'GOV');
INSERT INTO party.party_role (party_id, type_code, change_user)
SELECT 'GOV', 'bank', 'migration'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role WHERE party_id = 'GOV' AND type_code = 'bank');

INSERT INTO party.party (id, type_code, name, change_user)
SELECT 'MBF', 'nonNaturalPerson', 'MBf Bank Limited', 'migration'
WHERE NOT EXISTS (SELECT id FROM party.party WHERE id = 'MBF');
INSERT INTO party.party_role (party_id, type_code, change_user)
SELECT 'MBF', 'bank', 'migration'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role WHERE party_id = 'MBF' AND type_code = 'bank');

INSERT INTO party.party (id, type_code, name, change_user)
SELECT 'NRB', 'nonNaturalPerson', 'National Reserve Bank of Tonga', 'migration'
WHERE NOT EXISTS (SELECT id FROM party.party WHERE id = 'NRB');
INSERT INTO party.party_role (party_id, type_code, change_user)
SELECT 'NRB', 'bank', 'migration'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role WHERE party_id = 'NRB' AND type_code = 'bank');

INSERT INTO party.party (id, type_code, name, change_user)
SELECT 'TDB', 'nonNaturalPerson', 'Tonga Development Bank', 'migration'
WHERE NOT EXISTS (SELECT id FROM party.party WHERE id = 'TDB');
INSERT INTO party.party_role (party_id, type_code, change_user)
SELECT 'TDB', 'bank', 'migration'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role WHERE party_id = 'TDB' AND type_code = 'bank');

INSERT INTO party.party (id, type_code, name, change_user)
SELECT 'WBOT', 'nonNaturalPerson', 'Westpac Bank of Tonga', 'migration'
WHERE NOT EXISTS (SELECT id FROM party.party WHERE id = 'WBOT');
INSERT INTO party.party_role (party_id, type_code, change_user)
SELECT 'WBOT', 'bank', 'migration'
WHERE NOT EXISTS (SELECT party_id FROM party.party_role WHERE party_id = 'WBOT' AND type_code = 'bank');



-- Clean the mortgage term, mortgage amount and interest rate
UPDATE mortgage.mortgage 
SET term = safe_cast(mortgage_period, 0::NUMERIC(29,2)), 
    mort_amount = safe_cast(mortgage_amt, NULL::NUMERIC(29,2)),
    int_rate = CASE WHEN mortgage_interest_percent > 50 THEN NULL ELSE mortgage_interest_percent::NUMERIC(5,2) END,
	mortgagee_bank = CASE WHEN TRIM(UPPER(mortgagee_bank)) = 'NULL' THEN NULL
	                      WHEN TRIM(UPPER(mortgagee_bank)) = 'WPOT' THEN 'WBOT' ELSE mortgagee_bank END,
    mortgage_rec_num = CASE WHEN TRIM(UPPER(mortgage_rec_num)) = 'NULL' THEN NULL ELSE mortgage_rec_num END,
	mortgage_disch_rec_num = CASE WHEN TRIM(UPPER(mortgage_disch_rec_num)) = 'NULL' THEN NULL ELSE mortgage_disch_rec_num END;

-- Flag mortgages with duplicate mortgage and deed_numbers	
UPDATE mortgage.mortgage SET dup = TRUE
FROM mortgage.mortgage m
WHERE m.mortgage_number = mortgage.mortgage.mortgage_number
AND m.deed_number = mortgage.mortgage.deed_number
AND m.mortgage_id != mortgage.mortgage_id;

-- Determine the status of the mortgages
UPDATE mortgage.mortgage 
SET status = CASE WHEN mortgage_dateof_discharge > '01 JAN 1900' THEN 'h'
                  WHEN (SELECT count(*) FROM  mortgage.mortgage_variation mv
				        WHERE mv.mortgage_number = mortgage.mortgage.mortgage_number) > 0 THEN 'p'
				  ELSE 'c' END; 

-- Clean term, mortgage amount and interest rate
UPDATE mortgage.mortgage_variation 
SET term = period::NUMERIC(29,2),  
    mort_amount = safe_cast(mortgage_total_amt, NULL::NUMERIC(29,2)),
    int_rate = CASE WHEN interest > 50 THEN NULL ELSE interest::NUMERIC(5,2) END,
    mortgage_bank = CASE WHEN TRIM(UPPER(mortgage_bank)) = 'NULL' THEN NULL
	                     WHEN TRIM(UPPER(mortgage_bank)) = 'WPOT' THEN 'WBOT' ELSE mortgage_bank END,						 
    receipt_num = CASE WHEN TRIM(UPPER(receipt_num)) = 'NULL' THEN NULL ELSE receipt_num END,
	stamp_rec = CASE WHEN TRIM(UPPER(stamp_rec)) = 'NULL' THEN NULL ELSE stamp_rec END;

-- *** Clean the sublease number
-- Remove the folio text from the deed_number for subleases. 
UPDATE mortgage.mortgage 
SET sublease_num = TRIM(RIGHT(deed_number, 3))
WHERE deed_type = 'sublease'
and deed_number ~* 'folio'; 

-- Copy the last part of any existing numbers
UPDATE mortgage.mortgage 
SET sublease_num = TRIM((regexp_split_to_array(deed_number, '/'))[2])
WHERE deed_type = 'sublease'
and deed_number ~* '/'; 

-- Remove any non digit characters from the sublease deed_number
UPDATE mortgage.mortgage 
SET sublease_num = TRIM(regexp_replace(deed_number, '\D', '', 'g'))
WHERE deed_type = 'sublease'
AND sublease_num IS NULL;

-- Set the correct sublease number. 
UPDATE mortgage.mortgage 
SET sublease_num = '1/' || sublease_num
WHERE deed_type = 'sublease'
AND sublease_num IS NOT NULL;

-- Set the correct sublease number for specific mortgages. 
UPDATE mortgage.mortgage 
SET sublease_num = '1/102(1)'
WHERE deed_type = 'sublease'
AND mortgage_number = '5624';

UPDATE mortgage.mortgage 
SET sublease_num = '1/105(1)'
WHERE deed_type = 'sublease'
AND mortgage_number = '2664';

	
-- Flag duplicate mortgage_variation records
UPDATE mortgage.mortgage_variation SET dup = TRUE
FROM mortgage.mortgage_variation mv
WHERE mv.mortgage_number = mortgage.mortgage_variation.mortgage_number
AND mv.mortgage_variation_num = mortgage.mortgage_variation.mortgage_variation_num
AND mv.mort_variation_id != mortgage.mortgage_variation.mort_variation_id;

-- Determine the status of the mortgage variations. The latest mortgage variation indicates whether the
-- mortgage is current or discharged. Previous versions of the mortgage are marked with the previous status. 
UPDATE mortgage.mortgage_variation 
SET status = CASE WHEN dateof_discharge > '01 JAN 1900' THEN 'h'
                  WHEN (SELECT MAX(mv.mortgage_variation_num) 
				        FROM  mortgage.mortgage_variation mv
				        WHERE mv.mortgage_number = mortgage.mortgage_variation.mortgage_number)
						          = mortgage_variation_num THEN 'c'
				  ELSE 'p' END; 


-- *** Create the Mortgage RRRs for the leases
INSERT INTO administrative.rrr (id, ba_unit_id, nr, type_code, status_code,
transaction_id, registration_date, amount, receipt_reference, receipt_date,
mortgage_interest_rate, term, registry_book_ref, change_user, expiration_date)
SELECT m.sola_rrr_id, l.sola_ba_unit_id, m.mortgage_number, 'mortgage', 
CASE WHEN status = 'h' THEN 'historic' WHEN status = 'p' THEN 'previous' ELSE 'current' END, 
'migration', m.mortgage_reg_date, mort_amount, 
COALESCE(m.mortgage_rec_num || ', ' || m.mortgage_disch_rec_num, m.mortgage_rec_num),
CASE WHEN status = 'h' THEN m.mortgage_dateof_discharge 
     WHEN m.mortgage_dateof_rec > '01 JAN 1900' THEN  m.mortgage_dateof_rec
	 ELSE NULL END,
	 int_rate, CASE WHEN m.term > 0 AND m.term <= 100 THEN m.term ELSE NULL END , 
	 m.mortgage_book || '/' || m.mortgage_page || ' ' || m.mortgage_number, 'migration',
CASE WHEN status = 'h' THEN m.mortgage_dateof_discharge ELSE NULL END
FROM mortgage.mortgage m, lease.lease_detail l
WHERE m.deed_number = l.lease_number
AND l.dup = FALSE
AND m.dup = FALSE
AND m.deed_type = 'lease'
AND COALESCE(mortgagee_bank, 'TDB') IN ('TDB', 'ANZ', 'GOV', 'WBOT', 'MBF', 'NRB')
AND NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = m.sola_rrr_id);  

-- *** Create the Mortgage RRRs for the subleases
INSERT INTO administrative.rrr (id, ba_unit_id, nr, type_code, status_code,
transaction_id, registration_date, amount, receipt_reference, receipt_date,
mortgage_interest_rate, term, registry_book_ref, change_user, expiration_date)
SELECT m.sola_rrr_id, s.sola_ba_unit_id, m.mortgage_number, 'mortgage', 
CASE WHEN status = 'h' THEN 'historic' WHEN status = 'p' THEN 'previous' ELSE 'current' END, 
'migration', m.mortgage_reg_date, mort_amount, 
COALESCE(m.mortgage_rec_num || ', ' || m.mortgage_disch_rec_num, m.mortgage_rec_num),
CASE WHEN status = 'h' THEN m.mortgage_dateof_discharge 
     WHEN m.mortgage_dateof_rec > '01 JAN 1900' THEN  m.mortgage_dateof_rec
	 ELSE NULL END,
	 int_rate, CASE WHEN m.term > 0 AND m.term <= 100 THEN m.term ELSE NULL END , 
	 m.mortgage_book || '/' || m.mortgage_page || ' ' || m.mortgage_number, 'migration',
CASE WHEN status = 'h' THEN m.mortgage_dateof_discharge ELSE NULL END
FROM mortgage.mortgage m, lease.sl_clean s
WHERE m.sublease_num = s.sublease_number
AND m.dup = FALSE
AND m.deed_type = 'sublease'
AND COALESCE(mortgagee_bank, 'TDB') IN ('TDB', 'ANZ', 'GOV', 'WBOT', 'MBF', 'NRB')
AND NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = m.sola_rrr_id); 


-- *** Create the Mortgage RRRs for the deeds
INSERT INTO administrative.rrr (id, ba_unit_id, nr, type_code, status_code,
transaction_id, registration_date, amount, receipt_reference, receipt_date, 
mortgage_interest_rate, term, registry_book_ref, change_user, expiration_date)
SELECT m.sola_rrr_id, d.sola_ba_unit_id, m.mortgage_number, 'mortgage', 
CASE WHEN m.status = 'h' THEN 'historic' WHEN m.status = 'p' THEN 'previous' ELSE 'current' END,  
'migration', m.mortgage_reg_date, m.mort_amount, 
COALESCE(m.mortgage_rec_num || ', ' || m.mortgage_disch_rec_num, m.mortgage_rec_num),
CASE WHEN status = 'h' THEN m.mortgage_dateof_discharge 
     WHEN m.mortgage_dateof_rec > '01 JAN 1900' THEN  m.mortgage_dateof_rec
	 ELSE NULL END,
int_rate, CASE WHEN m.term > 0 AND m.term <= 100 THEN m.term ELSE NULL END , 
m.mortgage_book || '/' || m.mortgage_page || ' ' || m.mortgage_number, 'migration',
CASE WHEN m.status = 'h' THEN m.mortgage_dateof_discharge ELSE NULL END
FROM mortgage.mortgage m, lands.deed d
WHERE m.deed_number = d.deed_num
AND m.dup = FALSE
AND m.deed_type = 'deed'
AND COALESCE(mortgagee_bank, 'TDB') IN ('TDB', 'ANZ', 'GOV', 'WBOT', 'MBF', 'NRB')
AND NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = m.sola_rrr_id); 


-- Create notations to record the purpose of the mortgage
INSERT INTO administrative.notation (id, rrr_id, transaction_id, reference_nr, notation_text, notation_date, 
status_code, change_user)
SELECT m.sola_notation_id, m.sola_rrr_id, 'migration', 
      -- Add mortgage book and mortgage page to the start of the mortgage number
      m.mortgage_number, 
	  m.mortgage_purpose, m.mortgage_reg_date, 'current', 'migration'
FROM mortgage.mortgage m, administrative.rrr r
WHERE m.sola_rrr_id = r.id; 

-- Link the mortgages to the appropriate bank
INSERT INTO administrative.party_for_rrr(rrr_id, party_id)
SELECT m.sola_rrr_id, mortgagee_bank
FROM mortgage.mortgage m, administrative.rrr r
WHERE m.sola_rrr_id = r.id
AND mortgagee_bank IS NOT NULL; 


-- Create a table to map from the mortgage variations to the lease or deed ba unit. This 
-- is required as some variations may reference mortgages on more than one lease/deed.
DELETE FROM mortgage.rrr_variation; 
INSERT INTO mortgage.rrr_variation(mv_id, sola_ba_unit_id)
SELECT  mv.mort_variation_id, l.sola_ba_unit_id
FROM mortgage.mortgage_variation mv, mortgage.mortgage m, lease.lease_detail l
WHERE m.deed_number = l.lease_number
AND mv.mortgage_number = m.mortgage_number
AND l.dup = FALSE
AND m.dup = FALSE
AND mv.dup = FALSE
AND m.deed_type = 'lease'
AND COALESCE(mortgage_bank, 'TDB') IN ('TDB', 'ANZ', 'GOV', 'WBOT', 'MBF', 'NRB');

INSERT INTO mortgage.rrr_variation(mv_id, sola_ba_unit_id)
SELECT  mv.mort_variation_id, s.sola_ba_unit_id
FROM mortgage.mortgage_variation mv, mortgage.mortgage m, lease.sl_clean s
WHERE m.sublease_num = s.sublease_number
AND mv.mortgage_number = m.mortgage_number
AND m.dup = FALSE
AND mv.dup = FALSE
AND m.deed_type = 'sublease'
AND COALESCE(mortgage_bank, 'TDB') IN ('TDB', 'ANZ', 'GOV', 'WBOT', 'MBF', 'NRB');

INSERT INTO mortgage.rrr_variation(mv_id, sola_ba_unit_id)
SELECT mv.mort_variation_id, d.sola_ba_unit_id
FROM mortgage.mortgage_variation mv, mortgage.mortgage m, lands.deed d
WHERE m.deed_number = d.deed_num
AND mv.mortgage_number = m.mortgage_number
AND m.dup = FALSE
AND mv.dup = FALSE
AND m.deed_type = 'deed'
AND COALESCE(mortgage_bank, 'TDB') IN ('TDB', 'ANZ', 'GOV', 'WBOT', 'MBF', 'NRB');


-- *** Create Mortgage Variation Records
INSERT INTO administrative.rrr (id, ba_unit_id, nr, type_code, status_code,
transaction_id, registration_date, amount, receipt_reference, receipt_date, 
mortgage_interest_rate, term, registry_book_ref, change_user, expiration_date)
SELECT rmv.sola_rrr_id, rmv.sola_ba_unit_id, mv.mortgage_variation_num, 'mortgage', 
CASE WHEN mv.status = 'h' THEN 'historic' WHEN mv.status = 'p' THEN 'previous' ELSE 'current' END,  
'migration', mv.mortgage_variation_date, mv.mort_amount, 
COALESCE(mv.stamp_rec || ', ' || mv.receipt_num, mv.stamp_rec),
CASE WHEN mv.status = 'h' THEN mv.dateof_discharge 
     WHEN mv.stamp_duty IS NOT NULL AND mv.stamp_duty > '01 JAN 1900' THEN  mv.stamp_duty
	 ELSE NULL END,
mv.int_rate, CASE WHEN mv.term > 0 AND mv.term <= 100 THEN mv.term ELSE NULL END , mv.bk_num || '/' || mv.bk_page, 'migration',
CASE WHEN mv.status = 'h' THEN mv.dateof_discharge ELSE NULL END
FROM mortgage.mortgage_variation mv, mortgage.rrr_variation rmv
WHERE mv.mort_variation_id = rmv.mv_id;


-- Create notations to record the purpose of the mortgage variations
INSERT INTO administrative.notation (id, rrr_id, transaction_id, reference_nr, notation_text, notation_date, 
status_code, change_user)
SELECT rmv.sola_notation_id, rmv.sola_rrr_id, 'migration', 
      mv.mortgage_variation_num, 
      mv.mortgage_remarks,  mv.mortgage_variation_date, 'current', 'migration'
FROM mortgage.mortgage_variation mv,  mortgage.rrr_variation rmv
WHERE mv.mort_variation_id = rmv.mv_id;

-- Link the mortgage variations  to the appropriate bank
INSERT INTO administrative.party_for_rrr(rrr_id, party_id)
SELECT rmv.sola_rrr_id, mv.mortgage_bank
FROM mortgage.mortgage_variation mv,  mortgage.rrr_variation rmv
WHERE mv.mort_variation_id = rmv.mv_id 
AND mv.mortgage_bank IS NOT NULL; 












