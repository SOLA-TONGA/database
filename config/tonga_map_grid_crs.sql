-- Setup the SOLA Map configuration by creating Tonga Map Grid SRID for PostGIS. Tonga Map Grid 
-- is not natively supported by PostGIS, so add the Spatial Reference System configuration in 
-- manually. SRID 999 matches the SRID used for the Geoserver orthophotos and Lidar images. 
DELETE FROM public.spatial_ref_sys WHERE srid = 999;
/* INSERT into public.spatial_ref_sys (srid, auth_name, auth_srid, proj4text, srtext) values ( 999, 'spatialreference.org', 999, '+proj=tmerc +lat_0=0 +lon_0=-177 +k=0.9996 +x_0=1500000 +y_0=5000000 +ellps=GRS80 +units=m +no_defs ', 'PROJCS["Tonga Map Grid",GEOGCS["Tonga Geodetic Datum 2005",DATUM["Not_specified_based_on_GRS_1980_ellipsoid",SPHEROID["GRS_1980",6378137.0,298.257222101]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Transverse_Mercator"],PARAMETER["False_Easting",1500000.0],PARAMETER["False_Northing",5000000.0],PARAMETER["Central_Meridian",-177.0],PARAMETER["Scale_Factor",0.9996],PARAMETER["Latitude_Of_Origin",0.0],AUTHORITY["EPSG",999],UNIT["Meter",1.0]]'); */


-- When SOLA Tonga was first deployed, an official EPSG SRID for Tonga
-- Map Grid was not available, so SRID 999 was setup to represet TMG
-- This script migrates the database to use SRID 5887 (TMG) instead of 999.

-- Add defn for 5887 into the spatial_ref_sys table if it isn't already there
INSERT INTO public.spatial_ref_sys (srid, auth_name, auth_srid, proj4text, srtext)
SELECT 5887, 'EPSG', 5887, '+proj=tmerc +lat_0=0 +lon_0=-177 +k=0.9996 +x_0=1500000 +y_0=5000000 +ellps=GRS80 +units=m +no_defs ','PROJCS["TGD2005 / Tonga Map Grid",GEOGCS["TGD2005",DATUM["Tonga_Geodetic_Datum_2005",SPHEROID["GRS 1980",6378137,298.257222101,AUTHORITY["EPSG","7019"]],AUTHORITY["EPSG","1095"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.0174532925199433,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","5886"]],PROJECTION["Transverse_Mercator"],PARAMETER["latitude_of_origin",0],PARAMETER["central_meridian",-177],PARAMETER["scale_factor",0.9996],PARAMETER["false_easting",1500000],PARAMETER["false_northing",5000000],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AXIS["Easting",EAST],AXIS["Northing",NORTH],AUTHORITY["EPSG","5887"]]'
FROM public.spatial_ref_sys WHERE NOT EXISTS (SELECT 1 FROM public.spatial_ref_sys WHERE srid = 5887);