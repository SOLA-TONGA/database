-- Fix the issue with the cadastre_object delete trigger by making it execute
-- AFTER delete rather than BEFORE delete
DROP TRIGGER trg_remove ON cadastre.cadastre_object;

CREATE TRIGGER trg_remove
  AFTER DELETE
  ON cadastre.cadastre_object
  FOR EACH ROW
  EXECUTE PROCEDURE cadastre.f_for_tbl_cadastre_object_trg_remove();

-- Fix the spatial search query so it only shows parcels that have a spatial defintion.   
UPDATE system.query SET sql = 
'select id, name_firstpart || ''/'' || name_lastpart as label, st_asewkb(st_transform(geom_polygon, #{srid})) as the_geom  from cadastre.cadastre_object  where status_code= ''current'' and geom_polygon IS NOT NULL and compare_strings(#{search_string}, name_firstpart || '' '' || name_lastpart) ORDER BY lpad(regexp_replace(name_firstpart, ''\\D*'', '''', ''g''), 5, ''0'') || name_firstpart || name_lastpart limit 30'
WHERE name = 'map_search.cadastre_object_by_number';


-- When SOLA Tonga was first deployed, an official EPSG SRID for Tonga
-- Map Grid was not available, so SRID 999 was setup to represet TMG
-- This script migrates the database to use SRID 5887 (TMG) instead of 999.

-- Add defn for 5887 into the spatial_ref_sys table if it isn't already there
INSERT INTO public.spatial_ref_sys (srid, auth_name, auth_srid, proj4text, srtext)
SELECT 5887, 'EPSG', 5887, '+proj=tmerc +lat_0=0 +lon_0=-177 +k=0.9996 +x_0=1500000 +y_0=5000000 +ellps=GRS80 +units=m +no_defs ','PROJCS["TGD2005 / Tonga Map Grid",GEOGCS["TGD2005",DATUM["Tonga_Geodetic_Datum_2005",SPHEROID["GRS 1980",6378137,298.257222101,AUTHORITY["EPSG","7019"]],AUTHORITY["EPSG","1095"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","5886"]],PROJECTION["Transverse_Mercator"],PARAMETER["latitude_of_origin",0],PARAMETER["central_meridian",-177],PARAMETER["scale_factor",0.9996],PARAMETER["false_easting",1500000],PARAMETER["false_northing",5000000],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AXIS["Easting",EAST],AXIS["Northing",NORTH],AUTHORITY["EPSG","5887"]]'
FROM public.spatial_ref_sys WHERE NOT EXISTS (SELECT 1 FROM public.spatial_ref_sys WHERE srid = 5887);

-- Update the SOLA CRS table
UPDATE system.crs SET srid = 5887
WHERE srid = 999; 

-- Remove all SRID table constraints

ALTER TABLE cadastre.cadastre_object DROP CONSTRAINT IF EXISTS enforce_srid_geom_polygon;
ALTER TABLE cadastre.cadastre_object_historic DROP CONSTRAINT IF EXISTS enforce_srid_geom_polygon;
ALTER TABLE cadastre.cadastre_object_node_target DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.cadastre_object_node_target_historic DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.cadastre_object_target DROP CONSTRAINT IF EXISTS enforce_srid_geom_polygon;
ALTER TABLE cadastre.cadastre_object_target_historic DROP CONSTRAINT IF EXISTS enforce_srid_geom_polygon;
ALTER TABLE cadastre.legal_space_utility_network DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.legal_space_utility_network_historic DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.spatial_unit DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.spatial_unit DROP CONSTRAINT IF EXISTS enforce_srid_reference_point;
ALTER TABLE cadastre.spatial_unit_historic DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.spatial_unit_historic DROP CONSTRAINT IF EXISTS enforce_srid_reference_point;
ALTER TABLE cadastre.spatial_unit_group DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.spatial_unit_group DROP CONSTRAINT IF EXISTS enforce_srid_reference_point;
ALTER TABLE cadastre.spatial_unit_group_historic DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.spatial_unit_group_historic DROP CONSTRAINT IF EXISTS enforce_srid_reference_point;
ALTER TABLE cadastre.survey_point DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.survey_point DROP CONSTRAINT IF EXISTS enforce_srid_original_geom;
ALTER TABLE cadastre.survey_point_historic DROP CONSTRAINT IF EXISTS enforce_srid_geom;
ALTER TABLE cadastre.survey_point_historic DROP CONSTRAINT IF EXISTS enforce_srid_original_geom;
ALTER TABLE application.application DROP CONSTRAINT IF EXISTS enforce_srid_location;
ALTER TABLE application.application_historic DROP CONSTRAINT IF EXISTS enforce_srid_location;

UPDATE cadastre.cadastre_object SET geom_polygon = ST_SetSRID(geom_polygon, 5887) WHERE geom_polygon IS NOT NULL; 
UPDATE cadastre.cadastre_object_historic SET geom_polygon = ST_SetSRID(geom_polygon, 5887) WHERE geom_polygon IS NOT NULL;   
UPDATE cadastre.cadastre_object_node_target SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL; 
UPDATE cadastre.cadastre_object_node_target_historic SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
UPDATE cadastre.cadastre_object_target SET geom_polygon = ST_SetSRID(geom_polygon, 5887) WHERE geom_polygon IS NOT NULL; 
UPDATE cadastre.cadastre_object_target_historic SET geom_polygon = ST_SetSRID(geom_polygon, 5887) WHERE geom_polygon IS NOT NULL;
UPDATE cadastre.legal_space_utility_network SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
UPDATE cadastre.legal_space_utility_network_historic SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
UPDATE cadastre.spatial_unit SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
UPDATE cadastre.spatial_unit SET reference_point = ST_SetSRID(reference_point, 5887) WHERE reference_point IS NOT NULL;
UPDATE cadastre.spatial_unit_historic SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
UPDATE cadastre.spatial_unit_historic SET reference_point = ST_SetSRID(reference_point, 5887) WHERE reference_point IS NOT NULL;
UPDATE cadastre.spatial_unit_group SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
UPDATE cadastre.spatial_unit_group SET reference_point = ST_SetSRID(reference_point, 5887) WHERE reference_point IS NOT NULL;
UPDATE cadastre.spatial_unit_group_historic SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
UPDATE cadastre.spatial_unit_group_historic SET reference_point = ST_SetSRID(reference_point, 5887) WHERE reference_point IS NOT NULL;
UPDATE cadastre.survey_point SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
UPDATE cadastre.survey_point SET original_geom = ST_SetSRID(original_geom, 5887) WHERE original_geom IS NOT NULL;
UPDATE cadastre.survey_point_historic SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
UPDATE cadastre.survey_point_historic SET original_geom = ST_SetSRID(original_geom, 5887) WHERE original_geom IS NOT NULL;
UPDATE application.application SET location = ST_SetSRID(location, 5887) WHERE location IS NOT NULL; 
UPDATE application.application_historic SET location = ST_SetSRID(location, 5887) WHERE location IS NOT NULL;

-- Readd check constraints
ALTER TABLE cadastre.cadastre_object ADD CONSTRAINT enforce_srid_geom_polygon CHECK (st_srid(geom_polygon) = 5887);
ALTER TABLE cadastre.cadastre_object_node_target ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 5887);
ALTER TABLE cadastre.cadastre_object_target ADD CONSTRAINT enforce_srid_geom_polygon CHECK (st_srid(geom_polygon) = 5887);
ALTER TABLE cadastre.legal_space_utility_network ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 5887);
ALTER TABLE cadastre.spatial_unit ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 5887);
ALTER TABLE cadastre.spatial_unit ADD CONSTRAINT enforce_srid_reference_point CHECK (st_srid(reference_point) = 5887);
ALTER TABLE cadastre.spatial_unit_group ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 5887);
ALTER TABLE cadastre.spatial_unit_group ADD CONSTRAINT enforce_srid_reference_point CHECK (st_srid(reference_point) = 5887);
ALTER TABLE cadastre.survey_point ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 5887);
ALTER TABLE cadastre.survey_point ADD CONSTRAINT enforce_srid_original_geom CHECK (st_srid(original_geom) = 5887);
ALTER TABLE application.application ADD CONSTRAINT enforce_srid_location CHECK (st_srid(location) = 5887);