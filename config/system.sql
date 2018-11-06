--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = system, pg_catalog;

--
-- Data for Name: config_map_layer_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE config_map_layer_type DISABLE TRIGGER ALL;

INSERT INTO config_map_layer_type (code, display_value, status, description) VALUES ('wms', 'WMS server with layers::::Server WMS con layer', 'c', NULL);
INSERT INTO config_map_layer_type (code, display_value, status, description) VALUES ('shape', 'Shapefile::::Shapefile', 'c', NULL);
INSERT INTO config_map_layer_type (code, display_value, status, description) VALUES ('pojo', 'Pojo layer::::Pojo layer', 'c', NULL);
INSERT INTO config_map_layer_type (code, display_value, status, description) VALUES ('pojo_public_display', 'Pojo layer used for public display', 'c', 'It is an extension of pojo layer. It is used only during the public display map generation.');


ALTER TABLE config_map_layer_type ENABLE TRIGGER ALL;

--
-- Data for Name: query; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE query DISABLE TRIGGER ALL;

INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getParcels', 'select co.id, co.name_firstpart || ''/'' || co.name_lastpart as label,  st_asewkb(st_transform(co.geom_polygon, #{srid})) as the_geom from cadastre.cadastre_object co where type_code= ''parcel'' and status_code= ''current'' and ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid})) and st_area(co.geom_polygon)> power(5 * #{pixel_res}, 2)', NULL);
INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getParcelsPending', 'select co.id, co.name_firstpart || ''/'' || co.name_lastpart as label,  st_asewkb(st_transform(co.geom_polygon, #{srid})) as the_geom  from cadastre.cadastre_object co  where type_code= ''parcel'' and status_code= ''pending''   and ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid})) union select co.id, co.name_firstpart || ''/'' || co.name_lastpart as label,  st_asewkb(co_t.geom_polygon) as the_geom  from cadastre.cadastre_object co inner join cadastre.cadastre_object_target co_t on co.id = co_t.cadastre_object_id and co_t.geom_polygon is not null where ST_Intersects(co_t.geom_polygon, ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))       and co_t.transaction_id in (select id from transaction.transaction where status_code not in (''approved'')) ', NULL);
INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getSurveyControls', 'select id, label, st_asewkb(st_transform(geom, #{srid})) as the_geom from cadastre.survey_control  where ST_Intersects(st_transform(geom, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getRoads', 'select id, label, st_asewkb(st_transform(geom, #{srid})) as the_geom from cadastre.road where ST_Intersects(st_transform(geom, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid})) and st_area(geom)> power(5 * #{pixel_res}, 2)', NULL);
INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getPlaceNames', 'select id, label, st_asewkb(st_transform(geom, #{srid})) as the_geom from cadastre.place_name where ST_Intersects(st_transform(geom, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getApplications', 'select id, nr as label, st_asewkb(st_transform(location, #{srid})) as the_geom from application.application where ST_Intersects(st_transform(location, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('dynamic.informationtool.get_parcel', 'select co.id, co.name_firstpart || ''/'' || co.name_lastpart as parcel_nr,      (select string_agg(ba.name_firstpart || ''/'' || ba.name_lastpart, '','')      from administrative.ba_unit_contains_spatial_unit bas, administrative.ba_unit ba      where spatial_unit_id= co.id and bas.ba_unit_id= ba.id) as ba_units,      ( SELECT spatial_value_area.size FROM cadastre.spatial_value_area      WHERE spatial_value_area.type_code=''officialArea'' and spatial_value_area.spatial_unit_id = co.id) AS area_official_sqm,       st_asewkb(st_transform(co.geom_polygon, #{srid})) as the_geom      from cadastre.cadastre_object co      where type_code= ''parcel'' and status_code= ''current''      and ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('dynamic.informationtool.get_parcel_pending', 'select co.id, co.name_firstpart || ''/'' || co.name_lastpart as parcel_nr,       ( SELECT spatial_value_area.size FROM cadastre.spatial_value_area         WHERE spatial_value_area.type_code=''officialArea'' and spatial_value_area.spatial_unit_id = co.id) AS area_official_sqm,   st_asewkb(st_transform(co.geom_polygon, #{srid})) as the_geom    from cadastre.cadastre_object co  where type_code= ''parcel'' and ((status_code= ''pending''    and ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid})))   or (co.id in (select cadastre_object_id           from cadastre.cadastre_object_target co_t inner join transaction.transaction t on co_t.transaction_id=t.id           where ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid})) and t.status_code not in (''approved''))))', NULL);
INSERT INTO query (name, sql, description) VALUES ('dynamic.informationtool.get_place_name', 'select id, label,  st_asewkb(st_transform(geom, #{srid})) as the_geom from cadastre.place_name where ST_Intersects(st_transform(geom, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('dynamic.informationtool.get_road', 'select id, label,  st_asewkb(st_transform(geom, #{srid})) as the_geom from cadastre.road where ST_Intersects(st_transform(geom, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('dynamic.informationtool.get_application', 'select id, nr,  st_asewkb(st_transform(location, #{srid})) as the_geom from application.application where ST_Intersects(st_transform(location, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('dynamic.informationtool.get_survey_control', 'select id, label,  st_asewkb(st_transform(geom, #{srid})) as the_geom from cadastre.survey_control where ST_Intersects(st_transform(geom, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getParcelsHistoricWithCurrentBA', 'select co.id, co.name_firstpart || ''/'' || co.name_lastpart as label,  st_asewkb(st_transform(co.geom_polygon, #{srid})) as the_geom from cadastre.cadastre_object co inner join administrative.ba_unit_contains_spatial_unit ba_co on co.id = ba_co.spatial_unit_id   inner join administrative.ba_unit ba_unit on ba_unit.id= ba_co.ba_unit_id where co.type_code=''parcel'' and co.status_code= ''historic'' and ba_unit.status_code = ''current'' and ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('dynamic.informationtool.get_parcel_historic_current_ba', 'select co.id, co.name_firstpart || ''/'' || co.name_lastpart as parcel_nr,         (select string_agg(ba.name_firstpart || ''/'' || ba.name_lastpart, '','')           from administrative.ba_unit_contains_spatial_unit bas, administrative.ba_unit ba           where spatial_unit_id= co.id and bas.ba_unit_id= ba.id) as ba_units,         (SELECT spatial_value_area.size      FROM cadastre.spatial_value_area           WHERE spatial_value_area.type_code=''officialArea'' and spatial_value_area.spatial_unit_id = co.id) AS area_official_sqm,         st_asewkb(st_transform(co.geom_polygon, #{srid})) as the_geom        from cadastre.cadastre_object co inner join administrative.ba_unit_contains_spatial_unit ba_co on co.id = ba_co.spatial_unit_id   inner join administrative.ba_unit ba_unit on ba_unit.id= ba_co.ba_unit_id where co.type_code=''parcel'' and co.status_code= ''historic'' and ba_unit.status_code = ''current''       and ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);
INSERT INTO query (name, sql, description) VALUES ('map_search.cadastre_object_by_number', 'select id, name_firstpart || ''/'' || name_lastpart as label, st_asewkb(st_transform(geom_polygon, #{srid})) as the_geom  from cadastre.cadastre_object  where status_code= ''current'' and geom_polygon IS NOT NULL and compare_strings(#{search_string}, name_firstpart || '' '' || name_lastpart) ORDER BY lpad(regexp_replace(name_firstpart, ''\\D*'', '''', ''g''), 5, ''0'') || name_firstpart || name_lastpart limit 30', NULL);
INSERT INTO query (name, sql, description) VALUES ('map_search.cadastre_object_by_baunit', 'select distinct co.id,  ba_unit.name_firstpart || ''/ '' || ba_unit.name_lastpart || '' > '' || co.name_firstpart || ''/ '' || co.name_lastpart as label,  st_asewkb(st_transform(geom_polygon, #{srid})) as the_geom from cadastre.cadastre_object  co    inner join administrative.ba_unit_contains_spatial_unit bas on co.id = bas.spatial_unit_id     inner join administrative.ba_unit on ba_unit.id = bas.ba_unit_id  where (co.status_code= ''current'' or ba_unit.status_code= ''current'')    and compare_strings(#{search_string}, ba_unit.name_firstpart || '' '' || ba_unit.name_lastpart) limit 30', NULL);
INSERT INTO query (name, sql, description) VALUES ('map_search.cadastre_object_by_baunit_owner', 'select distinct co.id,  coalesce(party.name, '''') || '' '' || coalesce(party.last_name, '''') || '' > '' || co.name_firstpart || ''/ '' || co.name_lastpart as label,  st_asewkb(st_transform(co.geom_polygon, #{srid})) as the_geom  from cadastre.cadastre_object  co     inner join administrative.ba_unit_contains_spatial_unit bas on co.id = bas.spatial_unit_id     inner join administrative.ba_unit on bas.ba_unit_id= ba_unit.id     inner join administrative.rrr on (ba_unit.id = rrr.ba_unit_id and rrr.status_code = ''current'' and rrr.type_code = ''ownership'')     inner join administrative.party_for_rrr pfr on rrr.id = pfr.rrr_id     inner join party.party on pfr.party_id= party.id where (co.status_code= ''current'' or ba_unit.status_code= ''current'')     and compare_strings(#{search_string}, coalesce(party.name, '''') || '' '' || coalesce(party.last_name, '''')) limit 30', NULL);
INSERT INTO query (name, sql, description) VALUES ('system_search.cadastre_object_by_baunit_id', 'SELECT id,  name_firstpart || ''/ '' || name_lastpart as label, st_asewkb(st_transform(geom_polygon, #{srid})) as the_geom  FROM cadastre.cadastre_object WHERE transaction_id IN (  SELECT cot.transaction_id FROM (administrative.ba_unit_contains_spatial_unit ba_su     INNER JOIN cadastre.cadastre_object co ON ba_su.spatial_unit_id = co.id)     INNER JOIN cadastre.cadastre_object_target cot ON co.id = cot.cadastre_object_id     WHERE ba_su.ba_unit_id = #{search_string})  AND (SELECT COUNT(1) FROM administrative.ba_unit_contains_spatial_unit WHERE spatial_unit_id = cadastre_object.id) = 0 AND status_code = ''current''', 'Query used by BaUnitBean.loadNewParcels');
INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getParcelNodes', 'select distinct st_astext(st_transform(geom, #{srid})) as id, '''' as label, st_asewkb(st_transform(geom, #{srid})) as the_geom from (select (ST_DumpPoints(geom_polygon)).* from cadastre.cadastre_object co  where type_code= ''parcel'' and status_code= ''current''  and ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))) tmp_table ', NULL);
INSERT INTO query (name, sql, description) VALUES ('public_display.parcels', 'select co.id, co.name_firstpart as label,  st_asewkb(st_transform(co.geom_polygon, #{srid})) as the_geom from cadastre.cadastre_object co where type_code= ''parcel'' and status_code= ''current'' and name_lastpart = #{name_lastpart} and ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 'Query is used from public display map. It retrieves parcels being of a certain area (name_lastpart).');
INSERT INTO query (name, sql, description) VALUES ('public_display.parcels_next', 'SELECT co_next.id, co_next.name_firstpart as label,  st_asewkb(st_transform(co_next.geom_polygon, #{srid})) as the_geom  from cadastre.cadastre_object co_next, cadastre.cadastre_object co where co.type_code= ''parcel'' and co.status_code= ''current'' and co_next.type_code= ''parcel'' and co_next.status_code= ''current'' and co.name_lastpart = #{name_lastpart} and co_next.name_lastpart != #{name_lastpart} and st_dwithin(st_transform(co.geom_polygon, #{srid}), st_transform(co_next.geom_polygon, #{srid}), 5) and ST_Intersects(st_transform(co_next.geom_polygon, #{srid}), ST_SetSRID(ST_MakeBox3D(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', ' Query is used from public display map. It retrieves parcels being near the parcels of the layer public-display-parcels.');
INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getIslandGroups', 'SELECT id, label, st_asewkb(st_transform(reference_point, #{srid})) as the_geom 
 FROM cadastre.spatial_unit 
 WHERE level_id = ''islandGroup''
 AND reference_point IS NOT NULL
 AND ST_Intersects(st_transform(reference_point, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 'Retrieves location points for Tonga''s major island groups');
INSERT INTO query (name, sql, description) VALUES ('map_search.island', 'SELECT su.id, su.label, st_asewkb(su.geom) as the_geom 
  FROM cadastre.spatial_unit su 
  WHERE su.level_id = ''island''  
  AND compare_strings(#{search_string}, su.label)
  AND su.label IS NOT NULL
  AND su.geom IS NOT NULL', NULL);
INSERT INTO query (name, sql, description) VALUES ('SpatialResult.getIslands', 'SELECT id, label, st_asewkb(st_transform(geom, #{srid})) as the_geom 
 FROM cadastre.spatial_unit 
 WHERE level_id = ''island''
 AND geom IS NOT NULL
 AND ST_Intersects(st_transform(geom, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid}))', 'Retrieves island polygons for Tonga');
INSERT INTO query (name, sql, description) VALUES ('dynamic.informationtool.get_island', 'SELECT id, label,  st_asewkb(st_transform(geom, #{srid})) as the_geom 
  FROM cadastre.spatial_unit 
  WHERE geom IS NOT NULL
  AND level_id = ''island''
  AND  ST_Intersects(st_transform(geom, #{srid}), ST_SetSRID(ST_GeomFromWKB(#{wkb_geom}), #{srid}))', NULL);


ALTER TABLE query ENABLE TRIGGER ALL;

--
-- Data for Name: config_map_layer; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE config_map_layer DISABLE TRIGGER ALL;

INSERT INTO config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, url, wms_layers, wms_version, wms_format, wms_data_source, pojo_structure, pojo_query_name, pojo_query_name_for_select, shape_location, security_user, security_password, added_from_bulk_operation, use_in_public_display) VALUES ('all', 'Tonga Satellite', 'wms', true, false, 1, NULL, 'http://localhost:8085/geoserver/tonga/wms', 'tonga:all', '1.1.1', 'image/jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false);
INSERT INTO config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, url, wms_layers, wms_version, wms_format, wms_data_source, pojo_structure, pojo_query_name, pojo_query_name_for_select, shape_location, security_user, security_password, added_from_bulk_operation, use_in_public_display) VALUES ('tongatapubath', 'Tongatapu Reef Lidar', 'wms', true, false, 5, NULL, 'http://localhost:8085/geoserver/tonga/wms', 'tonga:Tongatapu_Bath', '1.1.1', 'image/png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false);
INSERT INTO config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, url, wms_layers, wms_version, wms_format, wms_data_source, pojo_structure, pojo_query_name, pojo_query_name_for_select, shape_location, security_user, security_password, added_from_bulk_operation, use_in_public_display) VALUES ('tongataputopo', 'Tongatapu Lidar', 'wms', true, false, 10, NULL, 'http://localhost:8085/geoserver/tonga/wms', 'tonga:Tongatapu_Topo20cm', '1.1.1', 'image/png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false);
INSERT INTO config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, url, wms_layers, wms_version, wms_format, wms_data_source, pojo_structure, pojo_query_name, pojo_query_name_for_select, shape_location, security_user, security_password, added_from_bulk_operation, use_in_public_display) VALUES ('lifukatopo', 'Lifuka Lidar', 'wms', true, false, 15, NULL, 'http://localhost:8085/geoserver/tonga/wms', 'tonga:Lifuka_Topo', '1.1.1', 'image/png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, false);
INSERT INTO config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, url, wms_layers, wms_version, wms_format, wms_data_source, pojo_structure, pojo_query_name, pojo_query_name_for_select, shape_location, security_user, security_password, added_from_bulk_operation, use_in_public_display) VALUES ('island-group', 'Island Group', 'pojo', true, true, 20, 'tonga_islandGroup.xml', NULL, NULL, NULL, NULL, NULL, 'theGeom:Point,label:""', 'SpatialResult.getIslandGroups', NULL, NULL, NULL, NULL, false, false);
INSERT INTO config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, url, wms_layers, wms_version, wms_format, wms_data_source, pojo_structure, pojo_query_name, pojo_query_name_for_select, shape_location, security_user, security_password, added_from_bulk_operation, use_in_public_display) VALUES ('island', 'Island', 'pojo', true, true, 18, 'tonga_island.xml', NULL, NULL, NULL, NULL, NULL, 'theGeom:Polygon,label:""', 'SpatialResult.getIslands', 'dynamic.informationtool.get_island', NULL, NULL, NULL, false, false);
INSERT INTO config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, url, wms_layers, wms_version, wms_format, wms_data_source, pojo_structure, pojo_query_name, pojo_query_name_for_select, shape_location, security_user, security_password, added_from_bulk_operation, use_in_public_display) VALUES ('parcels', 'Parcels', 'pojo', true, false, 25, 'parcel.xml', NULL, NULL, NULL, NULL, NULL, 'theGeom:Polygon,label:""', 'SpatialResult.getParcels', 'dynamic.informationtool.get_parcel', NULL, NULL, NULL, false, false);
INSERT INTO config_map_layer (name, title, type_code, active, visible_in_start, item_order, style, url, wms_layers, wms_version, wms_format, wms_data_source, pojo_structure, pojo_query_name, pojo_query_name_for_select, shape_location, security_user, security_password, added_from_bulk_operation, use_in_public_display) VALUES ('pending-parcels', 'Pending parcels', 'pojo', true, false, 30, 'pending_parcels.xml', NULL, NULL, NULL, NULL, NULL, 'theGeom:Polygon,label:""', 'SpatialResult.getParcelsPending', 'dynamic.informationtool.get_parcel_pending', NULL, NULL, NULL, false, false);


ALTER TABLE config_map_layer ENABLE TRIGGER ALL;

--
-- Data for Name: crs; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE crs DISABLE TRIGGER ALL;

INSERT INTO crs (srid, from_long, to_long, item_order) VALUES (5887, -173, -175, 1);


ALTER TABLE crs ENABLE TRIGGER ALL;

--
-- Data for Name: map_search_option; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE map_search_option DISABLE TRIGGER ALL;

INSERT INTO map_search_option (code, title, query_name, active, min_search_str_len, zoom_in_buffer, description) VALUES ('BAUNIT', 'Property number', 'map_search.cadastre_object_by_baunit', false, 3, 50.00, NULL);
INSERT INTO map_search_option (code, title, query_name, active, min_search_str_len, zoom_in_buffer, description) VALUES ('OWNER_OF_BAUNIT', 'Property owner', 'map_search.cadastre_object_by_baunit_owner', false, 3, 50.00, NULL);
INSERT INTO map_search_option (code, title, query_name, active, min_search_str_len, zoom_in_buffer, description) VALUES ('ISLAND', 'Island', 'map_search.island', true, 2, 300.00, NULL);
INSERT INTO map_search_option (code, title, query_name, active, min_search_str_len, zoom_in_buffer, description) VALUES ('NUMBER', 'Number', 'map_search.cadastre_object_by_number', true, 3, 50.00, NULL);


ALTER TABLE map_search_option ENABLE TRIGGER ALL;

--
-- Data for Name: query_field; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE query_field DISABLE TRIGGER ALL;

INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel', 1, 'parcel_nr', 'Parcel number::::Numero Particella');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel', 2, 'ba_units', 'Properties::::Proprieta');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel', 3, 'area_official_sqm', 'Official area (m2)::::Area ufficiale (m2)');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel', 0, 'id', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel', 4, 'the_geom', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel_pending', 0, 'id', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel_pending', 1, 'parcel_nr', 'Parcel number::::Numero Particella');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel_pending', 2, 'area_official_sqm', 'Official area (m2)::::Area ufficiale (m2)');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel_pending', 3, 'the_geom', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_place_name', 0, 'id', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_place_name', 1, 'label', 'Name::::Nome');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_place_name', 2, 'the_geom', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_road', 0, 'id', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_road', 1, 'label', 'Name::::Nome');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_road', 2, 'the_geom', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_application', 0, 'id', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_application', 1, 'nr', 'Number::::Numero');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_application', 2, 'the_geom', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_survey_control', 0, 'id', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_survey_control', 1, 'label', 'Label::::Etichetta');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_survey_control', 2, 'the_geom', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel_historic_current_ba', 0, 'id', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel_historic_current_ba', 1, 'parcel_nr', 'Parcel number::::Numero Particella');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel_historic_current_ba', 2, 'ba_units', 'Properties::::Proprieta');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel_historic_current_ba', 3, 'area_official_sqm', 'Official area (m2)::::Area ufficiale (m2)');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_parcel_historic_current_ba', 4, 'the_geom', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_island', 0, 'id', NULL);
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_island', 1, 'label', 'Island Name');
INSERT INTO query_field (query_name, index_in_query, name, display_value) VALUES ('dynamic.informationtool.get_island', 2, 'the_geom', NULL);


ALTER TABLE query_field ENABLE TRIGGER ALL;

--
-- Data for Name: setting; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE setting DISABLE TRIGGER ALL;

INSERT INTO setting (name, vl, active, description) VALUES ('map-tolerance', '0.01', true, 'The tolerance that is used while snapping geometries to each other. If two points are within this distance are considered being in the same location.');
INSERT INTO setting (name, vl, active, description) VALUES ('map-shift-tolerance-rural', '20', true, 'The shift tolerance of boundary points used in cadastre change in rural areas.');
INSERT INTO setting (name, vl, active, description) VALUES ('map-shift-tolerance-urban', '5', true, 'The shift tolerance of boundary points used in cadastre change in urban areas.');
INSERT INTO setting (name, vl, active, description) VALUES ('public-notification-duration', '30', true, 'The notification duration for the public display.');
INSERT INTO setting (name, vl, active, description) VALUES ('pword-expiry-days', '90', true, 'The number of days a users password remains valid');
INSERT INTO setting (name, vl, active, description) VALUES ('map-west', '1721000', true, 'The most west coordinate. It is used in the map control.');
INSERT INTO setting (name, vl, active, description) VALUES ('map-north', '2679600', true, 'The most north coordinate. It is used in the map control.');
INSERT INTO setting (name, vl, active, description) VALUES ('map-south', '2621000', true, 'The most south coordinate. It is used in the map control.');
INSERT INTO setting (name, vl, active, description) VALUES ('map-east', '1667000', true, 'The most east coordinate. It is used in the map control.');


ALTER TABLE setting ENABLE TRIGGER ALL;

--
-- Data for Name: version; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE version DISABLE TRIGGER ALL;

INSERT INTO version (version_num) VALUES ('1311a');
INSERT INTO version (version_num) VALUES ('1312a');
INSERT INTO version (version_num) VALUES ('1312b');
INSERT INTO version (version_num) VALUES ('1312c');
INSERT INTO version (version_num) VALUES ('1402a');
INSERT INTO version (version_num) VALUES ('1402b');


ALTER TABLE version ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

