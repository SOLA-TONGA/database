-- Run time 20 seconds

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

-- Remove columns if already exist on the lrs.title estate table. 
ALTER TABLE lease.lease_detail 
DROP COLUMN IF EXISTS sola_rrr_id,
DROP COLUMN IF EXISTS sola_town,
DROP COLUMN IF EXISTS sola_island,
DROP COLUMN IF EXISTS sola_ba_unit_id,
DROP COLUMN IF EXISTS sola_lessee_id,
DROP COLUMN IF EXISTS sola_lessor_id,
DROP COLUMN IF EXISTS sola_owner_rrr_id,
DROP COLUMN IF EXISTS dup;

ALTER TABLE lease.lease_location 
DROP COLUMN IF EXISTS sola_area,
DROP COLUMN IF EXISTS dup,
DROP COLUMN IF EXISTS sola_co_id,
DROP COLUMN IF EXISTS acre,
DROP COLUMN IF EXISTS rood,
DROP COLUMN IF EXISTS perch,
DROP COLUMN IF EXISTS imperial;


-- Add the sequence number on the title estate table to use for the primary rrrs
ALTER TABLE lease.lease_detail
ADD sola_rrr_id VARCHAR(40) DEFAULT uuid_generate_v1(),
ADD sola_ba_unit_id VARCHAR(40) DEFAULT  uuid_generate_v1(),
ADD sola_town VARCHAR(255),
ADD sola_island VARCHAR(255),
ADD sola_lessee_id VARCHAR (40) DEFAULT uuid_generate_v1(),
ADD sola_lessor_id VARCHAR(40) DEFAULT uuid_generate_v1(),
ADD sola_owner_rrr_id VARCHAR(40) DEFAULT uuid_generate_v1(),
ADD dup BOOLEAN DEFAULT FALSE;

ALTER TABLE lease.lease_location
ADD sola_area NUMERIC(19,2),
ADD dup BOOLEAN DEFAULT FALSE, 
ADD sola_co_id VARCHAR(40) DEFAULT uuid_generate_v1(),
ADD acre INT,
ADD rood INT,
ADD perch NUMERIC(19,2),
ADD imperial character varying(255); 


DROP TABLE IF EXISTS lease.island;
CREATE TABLE lease.island
(
  id character varying(40),
  name character varying(255)
 );
 
 
DROP TABLE IF EXISTS lease.town;
CREATE TABLE lease.town
(
	id character varying(40) DEFAULT uuid_generate_v1(),
	name character varying(255),
	island character varying(255)
);
