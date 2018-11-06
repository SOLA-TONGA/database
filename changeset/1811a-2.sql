-- Enable the cadastral services
-- Cadastre Change service to capture a new survey - requires new parcels to be created
-- Redefine Cadastre to modify existing parcels.
UPDATE application.request_type
SET    status = 'c',
       display_group_name = 'Cadastral',
	   display_order = 700
WHERE  code IN ('cadastreChange', 'redefineCadastre');

-- Update the display order for Redefine Cadastre
UPDATE application.request_type
SET    display_order = 705
WHERE  code = 'redefineCadastre';

-- Create new group for managing cadastral services
INSERT INTO system.appgroup (id, name, description) VALUES ('cadastre-id', 'Cadastral', 'This is a group of users that have the right to process Cadstral Change and Redefined Cadastre services.');

-- Create the security role for the Change to Cadastre Service
INSERT INTO system.approle (code, display_value, status, description)
VALUES ('cadastreChange',  'Service - Change to Cadastre', 'c', 
'Registration Service - Capture new cadastral surveys');

-- Create the security role for the Redefine Cadastre Service
INSERT INTO system.approle (code, display_value, status, description)
VALUES ('redefineCadastre',  'Service - Redefine Cadastre', 'c', 
'Registration Service - Modify existing cadastral parcels');

-- Link the new security roles to the Cadastral Security Group
INSERT INTO system.approle_appgroup (appgroup_id, approle_code)
VALUES ('cadastre-id', 'cadastreChange');

INSERT INTO system.approle_appgroup (appgroup_id, approle_code)
VALUES ('cadastre-id', 'redefineCadastre');

-- Allow Cadastral group to start and stop services
INSERT INTO system.approle_appgroup (appgroup_id, approle_code)
VALUES ('cadastre-id', 'StartService');

INSERT INTO system.approle_appgroup (appgroup_id, approle_code)
VALUES ('cadastre-id', 'CompleteService');

INSERT INTO system.approle_appgroup (appgroup_id, approle_code)
VALUES ('cadastre-id', 'CancelService');

INSERT INTO system.approle_appgroup (appgroup_id, approle_code)
VALUES ('cadastre-id', 'RevertService');

-- Add the new Cadastre Group to all users that are currently listed as admin users
INSERT INTO system.appuser_appgroup (appgroup_id, appuser_id)
SELECT 'cadastre-id', appuser_id
FROM system.appuser_appgroup
WHERE appgroup_id = 'admin-id';



-- Change the severity of parcel check business rule so that it doesn't prevent a 
-- Tonga cadastral service from being approved.
UPDATE system.br_validation
SET severity_code = 'warning'
WHERE br_id = 'application-baunit-has-parcels';



-- Update the map to include a parcels layer, using the existing dynamic queries. 
INSERT INTO system.config_map_layer (name, title, type_code, 
active, visible_in_start, item_order, style, url, wms_layers, 
wms_version, wms_format, wms_data_source, pojo_structure, 
pojo_query_name, pojo_query_name_for_select, shape_location, 
security_user, security_password, added_from_bulk_operation, 
use_in_public_display) VALUES ('parcels', 
'Parcels', 'pojo', true, false, 25, 
'parcel.xml', NULL, NULL, NULL, NULL, NULL, 
'theGeom:Polygon,label:""', 'SpatialResult.getParcels', 
'dynamic.informationtool.get_parcel', NULL, NULL, NULL, 
false, false);

-- RE-add the pending parcels layer as well
INSERT INTO system.config_map_layer (name, title, type_code, active, 
visible_in_start, item_order, style, url, wms_layers, wms_version, 
wms_format, wms_data_source, pojo_structure, pojo_query_name, 
pojo_query_name_for_select, shape_location, security_user, 
security_password, added_from_bulk_operation, use_in_public_display) 
VALUES ('pending-parcels', 'Pending parcels', 'pojo', true, false, 30, 
'pending_parcels.xml', NULL, NULL, NULL, NULL, NULL, 
'theGeom:Polygon,label:""', 'SpatialResult.getParcelsPending', 
'dynamic.informationtool.get_parcel_pending', NULL, NULL, NULL, 
false, false);

-- Re-enable the parcel number map search
UPDATE system.map_search_option SET active = TRUE WHERE code = 'NUMBER'; 


/*
-- Create wrapper function for the makebox3d function as it was renamed to 3dmakebox in PostGIS 2.0
-- Not required for the SOLA Portable database. 
CREATE OR REPLACE FUNCTION public.st_makebox3d(
    geom1 geometry,
    geom2 geometry)
  RETURNS box3d AS
'$libdir/postgis-2.2', 'BOX3D_construct'
  LANGUAGE c IMMUTABLE STRICT
  COST 1;
ALTER FUNCTION public.st_makebox3d(geometry, geometry)
  OWNER TO postgres;
COMMENT ON FUNCTION public.st_makebox3d(geometry, geometry) IS 'args: point3DLowLeftBottom, point3DUpRightTop - Creates a BOX3D defined by the given 3d point geometries.';
*/
