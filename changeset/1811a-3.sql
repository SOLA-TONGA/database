
-- Fix the SRID for the bulk operation table
ALTER TABLE bulk_operation.spatial_unit_temporary DROP CONSTRAINT IF EXISTS enforce_srid_geom;
UPDATE bulk_operation.spatial_unit_temporary SET geom = ST_SetSRID(geom, 5887) WHERE geom IS NOT NULL;
ALTER TABLE bulk_operation.spatial_unit_temporary ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 5887);