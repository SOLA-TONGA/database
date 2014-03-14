--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = application, pg_catalog;

--
-- Data for Name: request_type_requires_source_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE request_type_requires_source_type DISABLE TRIGGER ALL;

INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('permit', 'permit');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('powerOfAttorney', 'regnPowerOfAttorney');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('surrenderDocs', 'apiSurrender');
INSERT INTO request_type_requires_source_type (source_type_code, request_type_code) VALUES ('mortgageDoc', 'mortgageDocument');


ALTER TABLE request_type_requires_source_type ENABLE TRIGGER ALL;

SET search_path = cadastre, pg_catalog;

--
-- Data for Name: level; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE level DISABLE TRIGGER ALL;

INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('lease', 'Lease', 'all', 'polygon', 'primaryRight', '1fee42fe-9eb4-11e3-96a1-ff702cf1c2cc', 1, 'i', 'test-id', '2014-02-26 20:03:41.823');
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('townAllotment', 'Town Allotment', 'all', 'polygon', 'primaryRight', '1ff1c582-9eb4-11e3-8edd-879184a7161b', 1, 'i', 'test-id', '2014-02-26 20:03:41.848');
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('taxAllotment', 'Tax Allotment', 'all', 'polygon', 'primaryRight', '1ff23ab2-9eb4-11e3-ab3f-fb80b66272b4', 1, 'i', 'test-id', '2014-02-26 20:03:41.85');
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('sublease', 'Sublease', 'all', 'polygon', 'primaryRight', '1ff288d2-9eb4-11e3-8a38-afe2b38dca81', 1, 'i', 'test-id', '2014-02-26 20:03:41.853');
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('islandGroup', 'Island Group', 'all', 'point', 'geographicLocator', 'e2958bf8-a249-11e3-b28d-638ac6c01027', 1, 'i', 'andrew', '2014-03-03 09:33:16.785');
INSERT INTO level (id, name, register_type_code, structure_code, type_code, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('island', 'Island', 'all', 'polygon', 'geographicLocator', 'e2995c92-a249-11e3-b6a9-97894222e395', 1, 'i', 'andrew', '2014-03-03 09:33:16.785');


ALTER TABLE level ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

