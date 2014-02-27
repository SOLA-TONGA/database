-- Run time 1 seconds

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

ALTER TABLE lands.nobles
DROP COLUMN IF EXISTS sola_party_id; 

ALTER TABLE lands.nobles
ADD sola_party_id VARCHAR(40) DEFAULT uuid_generate_v1(); 


ALTER TABLE lands.island_township 
DROP COLUMN IF EXISTS sola_town,
DROP COLUMN IF EXISTS sola_town_id, 
DROP COLUMN IF EXISTS sola_island_id; 

ALTER TABLE lands.island_township 
ADD sola_town VARCHAR(255),
ADD sola_town_id VARCHAR(40) DEFAULT uuid_generate_v1(), 
ADD sola_island_id VARCHAR(40);


DROP TABLE IF EXISTS lands.deed; 

CREATE TABLE lands.deed (
sola_ba_unit_id VARCHAR(40) DEFAULT uuid_generate_v1(),
id INTEGER, 
deed_num VARCHAR(40),
part1 VARCHAR(50),
part2 VARCHAR(50), 
plan_type VARCHAR(40),
plan_num VARCHAR(40),
lot_num VARCHAR(40),
town VARCHAR(255), 
reg_date DATE, 
area_orig VARCHAR(255), 
sola_area NUMERIC(19,2),
acre INT,
rood INT,
perch NUMERIC(19,2),
tax_lot BOOLEAN DEFAULT FALSE,
parcel_name VARCHAR(255),
registry_book_ref VARCHAR(50)); 

CREATE INDEX lands_deed_deed_num
  ON lands.deed
  USING btree
  (deed_num);

DROP TABLE IF EXISTS lands.holder;

CREATE TABLE lands.holder (
sola_party_id VARCHAR(40) DEFAULT uuid_generate_v1(),
id INTEGER, 
deed_num VARCHAR(40),
fname VARCHAR(255),
lname VARCHAR(50), 
holder_type VARCHAR(20),
reg_date DATE, 
dup BOOLEAN DEFAULT FALSE, 
status VARCHAR(1) DEFAULT 'c',
sola_rrr_id VARCHAR(40) DEFAULT uuid_generate_v1()); 

CREATE INDEX lands_holder_deed_num
  ON lands.holder
  USING btree
  (deed_num);
 
 
DROP TABLE IF EXISTS lands.plan;

CREATE TABLE lands.plan (
sola_co_id VARCHAR(40) DEFAULT uuid_generate_v1(), 
plan_type VARCHAR(40),
plan_num VARCHAR(40),
lot_num VARCHAR(40),
tax_lot BOOLEAN); 


ALTER TABLE lands.reg_deed_grant
DROP COLUMN IF EXISTS dup;

ALTER TABLE lands.reg_deed_grant
ADD dup BOOLEAN DEFAULT FALSE;
