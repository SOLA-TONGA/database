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

SELECT type_code, COUNT(*) 
FROM administrative.ba_unit
GROUP BY type_code;

-- Counts from 4th Nov migration
--"townUnit";349
--"townAllotmentUnit";13171
--"estateUnit";141
--"islandUnit";6
--"taxUnit";4260
--"leasedUnit";4025
--"subleaseUnit";169

SELECT type_code, COUNT(*)
FROM administrative.rrr
GROUP BY type_code; 

-- Counts from 4th Nov migration
--"lifeEstate";1644
--"ownership";24285
--"lease";4025
--"mortgage";10269
--"sublease";169

SELECT type_code, COUNT(*)
FROM cadastre.cadastre_object
GROUP BY type_code; 

-- Counts from 4th Nov migration
--"parcel";9122

SELECT type_code, COUNT(*)
FROM party.party
GROUP BY type_code; 

-- Counts from 4th Nov migration
--"nonNaturalPerson";63
--"naturalPerson";29984

SELECT type_code, COUNT(*)
FROM administrative.ba_unit_area
GROUP BY type_code; 

-- Counts from 4th Nov migration
--"officialArea";17499

SELECT COUNT(*)
FROM administrative.ba_unit_contains_spatial_unit

-- Counts from 4th Nov migration
--10278

SELECT relation_code, COUNT(*)
FROM administrative.required_relationship_baunit
GROUP BY relation_code; 

--"town";20960
--"island";495
--"sublease";79
