-- #10 Add sublessee name to application_property
ALTER TABLE application.application_property
DROP COLUMN IF EXISTS sublessee_name,
DROP COLUMN IF EXISTS registered_name,
DROP COLUMN IF EXISTS type_code, 
DROP COLUMN IF EXISTS lease_area,
DROP COLUMN IF EXISTS sublease_linked,
DROP COLUMN IF EXISTS lease_linked, 
DROP CONSTRAINT IF EXISTS application_property_property_once; 

ALTER TABLE application.application_property_historic
DROP COLUMN IF EXISTS sublessee_name,
DROP COLUMN IF EXISTS registered_name,
DROP COLUMN IF EXISTS type_code, 
DROP COLUMN IF EXISTS lease_area,
DROP COLUMN IF EXISTS sublease_linked,
DROP COLUMN IF EXISTS lease_linked;

ALTER TABLE application.application_property
ADD sublessee_name VARCHAR(255),
ADD registered_name VARCHAR(255),
ADD type_code VARCHAR(20);  

ALTER TABLE application.application_property_historic
ADD sublessee_name VARCHAR(255),
ADD registered_name VARCHAR(255),
ADD type_code VARCHAR(20); 

COMMENT ON COLUMN application.application_property.sublessee_name IS 'SOLA Tonga Extension. The name of the sublessee for the sublease.';
COMMENT ON COLUMN application.application_property.lessee_name IS 'SOLA Tonga Extension. The name of the lessee for the lease.';
COMMENT ON COLUMN application.application_property.registered_name IS '	SOLA Tonga Extension: Name provided for the parcel by the allotment holder when they register their new allotment (a.k.a. parcel name).';
COMMENT ON COLUMN application.application_property.type_code IS 'SOLA Tonga Extension: Indicates the type of property. One of taxUnit, townAllotmentUnit, leasedUnit, subleaseUnit, estateUnit';
COMMENT ON COLUMN application.application_property.verified_exists IS 'Flag to indicate if the property details provided for the application match an existing property record in the BA Unit table.';
COMMENT ON COLUMN application.application_property.verified_location IS 'Flag to indicate if the property details provided for the application reference an existing parcel record in the Cadastre Object table. Not currently used by SOLA Tonga.';

-- Update document to service mappings
INSERT INTO application.request_type_requires_source_type (source_type_code, request_type_code)
SELECT 'permit', 'permit' WHERE NOT EXISTS 
(SELECT source_type_code FROM  application.request_type_requires_source_type
 WHERE source_type_code = 'permit' AND request_type_code = 'permit');
 
INSERT INTO application.request_type_requires_source_type (source_type_code, request_type_code)
SELECT 'powerOfAttorney', 'regnPowerOfAttorney' WHERE NOT EXISTS 
(SELECT source_type_code FROM  application.request_type_requires_source_type
 WHERE source_type_code = 'powerOfAttorney' AND request_type_code = 'regnPowerOfAttorney');
 
INSERT INTO application.request_type_requires_source_type (source_type_code, request_type_code)
SELECT 'surrenderDocs', 'apiSurrender' WHERE NOT EXISTS 
(SELECT source_type_code FROM  application.request_type_requires_source_type
 WHERE source_type_code = 'surrenderDocs' AND request_type_code = 'apiSurrender');
 
INSERT INTO application.request_type_requires_source_type (source_type_code, request_type_code)
SELECT 'mortgageDoc', 'mortgageDocument' WHERE NOT EXISTS 
(SELECT source_type_code FROM  application.request_type_requires_source_type
 WHERE source_type_code = 'mortgageDoc' AND request_type_code = 'mortgageDocument');
 
-- Extend the size of the alias field on the party table
ALTER TABLE party.party ALTER COLUMN alias TYPE VARCHAR(250);

UPDATE party.communication_type
SET status = 'x' WHERE code in ('courier', 'fax'); 

-- Fix estate names
UPDATE administrative.ba_unit SET name = name_firstpart WHERE type_code = 'estateUnit';

 