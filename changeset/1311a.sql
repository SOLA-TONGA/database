-- 28 Nov 2013 Ticket #??
-- Add Surrender right type 
INSERT INTO administrative.rrr_type(code, rrr_group_type_code, display_value, is_primary, share_check, party_required, status, description)
    SELECT 'surrender', 'restrictions', 'Surrender', FALSE, FALSE, TRUE, 'c', 'Identifies that an allotment has been surrendered in part or whole. The surrendered part of the allotment can only be claimed after it has been surrendered for 12 months.'
    WHERE NOT EXISTS (SELECT code FROM administrative.rrr_type WHERE code = 'surrender');

UPDATE 	application.request_type
SET display_value = 'Surrender Allotment::::TONGAN',
    rrr_type_code = 'surrender',
	type_action_code = 'new',
	notation_template = 'Surrender allotment to <name>',
	description = 'Used to surrender all or part of an allotment'
WHERE code = 'apiSurrender';

UPDATE 	application.request_type
SET notation_template = regexp_replace(notation_template, '''api', 'allotment')
WHERE code IN ('taxapi', 'townapi', 'apiExchange', 'apiEjectment');

INSERT INTO source.administrative_source_type (code,display_value,status,is_for_registration, description)
VALUES ('surrenderDocs','Surrender Documents','c','FALSE', 'Documents supporting surrender of an allotment');

UPDATE administrative.ba_unit_rel_type
SET status = 'x'
WHERE code IN ('priorTitle', 'rootTitle', 'island');

INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_order, display_group_name)
    VALUES ('hodReview','applicationServices','Head of Division Review::::TONGAN','c',5,0.00,0.00,0.00,0,
	null,null,null,'Review of the documentation prepared for the Ministerial Briefing', 17, 'Workflow');
INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_order, display_group_name)
    VALUES ('ministerDecision','applicationServices','Ministerial Decision::::TONGAN','c',5,0.00,0.00,0.00,0,
	null,null,null,'Captures the decision by the minister as to whether to proceed with the transaction or not.', 18, 'Workflow');
UPDATE application.request_type
SET display_value = 'Ministerial Briefing Preparation::::TONGAN',
    description = 'Preparing the briefing for the Minister of Lands to gain approval for the application'
WHERE code = 'ministerBriefing';

INSERT INTO system.approle (code, display_value, status, description)
   SELECT 'ministerDecision', 'Service - Ministerial Decision', 'c', 'Application Service. Allows the Ministerial Decision service to be started.'
WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'ministerDecision');
INSERT INTO system.approle (code, display_value, status, description)
   SELECT 'hodReview', 'Service - Head of Division Review', 'c', 'Application Service. Allows the Head of Division Review service to be started.'
   WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'hodReview');
   
INSERT INTO system.approle_appgroup (approle_code, appgroup_id) VALUES ('ministerDecision','registration-id');
INSERT INTO system.approle_appgroup (approle_code, appgroup_id) VALUES ('hodReview','registration-id');


ALTER TABLE administrative.rrr
ADD rrr_ref character varying(255);

ALTER TABLE administrative.rrr_historic
ADD rrr_ref character varying(255);

-- Add the mortgage number as the rrr_ref
ALTER TABLE administrative.rrr DISABLE TRIGGER ALL;
UPDATE administrative.rrr
SET rrr_ref = nr
WHERE type_code = 'mortgage'
AND transaction_id = 'migration';
ALTER TABLE administrative.rrr ENABLE TRIGGER ALL;


-- Update towns that are linked to the wrong names so that it is linked to their correct town names
-- Delete relationship to island and also from ba_unit
-- Correct town name - Current town name
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '9935900e-44c8-11e3-b560-cba1fb51e887' WHERE to_ba_unit_id = 'e5f77ab2-44c6-11e3-a031-270e141c49d4'; -- 'Atele - Atele 'Olokava
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '9937d9fe-44c8-11e3-b234-3fdea1c0e199'; -- 'Atele - Atele 'Olokava
DELETE FROM administrative.ba_unit WHERE id = '9937d9fe-44c8-11e3-b234-3fdea1c0e199'; -- 'Atele - Atele 'Olokava

DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '994ac60e-44c8-11e3-9fda-1bf57634dd7c'; -- Niutoua - Niiutoua
DELETE FROM administrative.ba_unit WHERE id = '994ac60e-44c8-11e3-9fda-1bf57634dd7c'; -- Niutoua - Niiutoua

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '9948a324-44c8-11e3-9313-9b16eb60f2f0' WHERE to_ba_unit_id = 'e2927106-44c6-11e3-bdec-4bb28a9f4f52'; -- Mataki'eua - Mataki'Eua
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '9948a324-44c8-11e3-9313-9b16eb60f2f0' WHERE to_ba_unit_id = 'e2af4844-44c6-11e3-b1e0-87a05a4be9d1'; -- Mataki'eua - Mataki'Eua
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '9948a324-44c8-11e3-9313-9b16eb60f2f0' WHERE to_ba_unit_id = 'e2f308fe-44c6-11e3-92a3-1763eed73b80'; -- Mataki'eua - Mataki'Eua
DELETE FROM administrative.ba_unit WHERE id = '9948ca34-44c8-11e3-8738-9fdcfa479ede'; -- Mataki'eua - Mataki'Eua
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '9948ca34-44c8-11e3-8738-9fdcfa479ede'; -- Mataki'eua - Mataki'Eua

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '993fa24c-44c8-11e3-90af-db397f745247' WHERE to_ba_unit_id = 'e3a03b78-44c6-11e3-8aea-0f1ffa57319d'; -- Ma'ufanga - Ma'ofanga
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '993fa24c-44c8-11e3-90af-db397f745247' WHERE to_ba_unit_id = 'e3a08998-44c6-11e3-96a9-5b7261e1ea85'; -- Ma'ufanga - Ma'ofanga
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '993fa24c-44c8-11e3-90af-db397f745247' WHERE to_ba_unit_id = 'e424afac-44c6-11e3-bd5c-8f9b7b2a63dc'; -- Ma'ufanga - Ma'ofanga
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '993fa24c-44c8-11e3-90af-db397f745247' WHERE to_ba_unit_id = 'e42524dc-44c6-11e3-9c12-f7496bdc8d8f'; -- Ma'ufanga - Ma'ofanga
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '993fa24c-44c8-11e3-90af-db397f745247' WHERE to_ba_unit_id = 'e2cf53dc-44c6-11e3-b44b-b79185ac9703'; -- Hala'ovave - Hala o'vave-Kolomotu'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '993fa24c-44c8-11e3-90af-db397f745247' WHERE to_ba_unit_id = 'e301fd5a-44c6-11e3-b9f0-b770bc996597'; -- Hala'ovave - Hala o'vave-Kolomotu'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '993fa24c-44c8-11e3-90af-db397f745247' WHERE to_ba_unit_id = 'e3a0fec8-44c6-11e3-9de4-0f429871cb08'; -- Hala'ovave - Hala o'vave-Kolomotu'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '993fa24c-44c8-11e3-90af-db397f745247' WHERE to_ba_unit_id = 'e3b438ee-44c6-11e3-971f-03ec5be01393'; -- Hala'ovave - Hala o'vave-Kolomotu'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '993fa24c-44c8-11e3-90af-db397f745247' WHERE to_ba_unit_id = 'e4020bfa-44c6-11e3-9d2e-c3bcb3507488'; -- Hala'ovave - Hala o'vave-Kolomotu'a
DELETE FROM administrative.ba_unit WHERE id = '993fc95c-44c8-11e3-9e3e-ffcca879bd72'; -- Hala'ovave - Hala o'vave
DELETE FROM administrative.ba_unit WHERE id = '993fc95c-44c8-11e3-935e-c3af4a84a8a9'; -- Hala'ovave - Hala o'vave-Kolomotu'a
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '993fc95c-44c8-11e3-9e3e-ffcca879bd72';  -- Ma'ufanga - Ma'ofanga
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '993fc95c-44c8-11e3-935e-c3af4a84a8a9';  -- Hala'ovave - Hala o'vave-Kolomotu'a

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd69c4c-44c4-11e3-b869-03df4c654831' WHERE to_ba_unit_id = 'e2885ebe-44c6-11e3-93db-e7b6fabd9b8c'; -- Ma'ufanga - Ma'ofanga
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd69c4c-44c4-11e3-b869-03df4c654831' WHERE to_ba_unit_id = 'e74b76e8-44c6-11e3-809b-eb2d1f5720df'; -- Ma'ufanga - Ma'ofanga
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd69c4c-44c4-11e3-b869-03df4c654831' WHERE to_ba_unit_id = '8634459c-44e9-11e3-9ab2-dfb19d0d4fd5'; -- Ma'ufanga - Ma'ofanga
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd69c4c-44c4-11e3-b869-03df4c654831' WHERE to_ba_unit_id = '862c2f2e-44e9-11e3-ab2e-ffe451f9b82f'; -- Ma'ufanga - Ma'ofanga
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd69c4c-44c4-11e3-b869-03df4c654831' WHERE to_ba_unit_id = 'e56d3a0a-44c6-11e3-8861-6b055e00b022'; -- Ma'ufanga - Ma'uganga
DELETE FROM administrative.ba_unit WHERE id = '9946a74a-44c8-11e3-9ca4-33c5c419599b'; -- Ma'ufanga - Ma'ofanga
DELETE FROM administrative.ba_unit WHERE id = '9946ce5a-44c8-11e3-823d-efc5321e71ab'; -- Ma'ufanga - Ma'uganga
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99460b0a-44c8-11e3-8d0a-63488fd41eb9';  -- Ma'ufanga - Ma'ofanga
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99460b0a-44c8-11e3-8d0a-63488fd41eb9'; -- Ma'ufanga - Ma'uganga

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '99460b0a-44c8-11e3-ad96-1b6bf3c26d3f' WHERE to_ba_unit_id = 'e2e685ac-44c6-11e3-8ad9-5f6211711307'; -- Longolongo - Longolongo Kolomotu'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '99460b0a-44c8-11e3-ad96-1b6bf3c26d3f' WHERE to_ba_unit_id = 'e5b392de-44c6-11e3-8c97-e3a42865e5fe'; -- Longolongo - Longongo
DELETE FROM administrative.ba_unit WHERE id = '99460b0a-44c8-11e3-8d0a-63488fd41eb9'; -- Longolongo - Longolongo Kolomotu'a
DELETE FROM administrative.ba_unit WHERE id = '9946592a-44c8-11e3-8d64-636776926c40'; -- Longolongo - Longongo
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99460b0a-44c8-11e3-8d0a-63488fd41eb9'; -- Longolongo - Longolongo Kolomotu'a
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '9946592a-44c8-11e3-8d64-636776926c40'; -- Longolongo - Longongo

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd87116-44c4-11e3-90f1-dfe1ca407420' WHERE to_ba_unit_id = 'e608b8fe-44c6-11e3-af22-6f1360647b72'; -- Fua'amotu - Fu'amotu
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd87116-44c4-11e3-90f1-dfe1ca407420' WHERE to_ba_unit_id = 'e68082d0-44c6-11e3-b9ff-2ba277ac00d8'; -- Fua'amotu - Fu'amotu
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd87116-44c4-11e3-90f1-dfe1ca407420' WHERE to_ba_unit_id = 'e5f5a5e8-44c6-11e3-9f0a-b7c4edc8df94'; -- Fua'amotu - Fu'amotu
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd87116-44c4-11e3-90f1-dfe1ca407420' WHERE to_ba_unit_id = 'e5fd4726-44c6-11e3-84dc-87ea804cbc4f'; -- Fua'amotu - Fu'amotu
DELETE FROM administrative.ba_unit WHERE id = '993c9502-44c8-11e3-97f7-63cf4f3a65f9'; -- Fua'amotu - Fu'amotu
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '993c9502-44c8-11e3-97f7-63cf4f3a65f9'; -- Fua'amotu - Fu'amotu

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4c78c-44c4-11e3-8198-53028243c443' WHERE to_ba_unit_id = 'e9ffcba0-44c6-11e3-9636-b3c4985b7c89'; -- Kolofo'ou - Klf
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4c78c-44c4-11e3-8198-53028243c443' WHERE to_ba_unit_id = 'e6ee887a-44c6-11e3-abaf-53a9d3d72254'; -- Kolofo'ou - Kofo'ou
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4c78c-44c4-11e3-8198-53028243c443' WHERE to_ba_unit_id = 'e6a39bb2-44c6-11e3-8338-2b214ebda372'; -- Kolofo'ou - Kolofo'ou-Nu'alei
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4c78c-44c4-11e3-8198-53028243c443' WHERE to_ba_unit_id = 'e6aa2b80-44c6-11e3-9078-0b302103ab14'; -- Kolofo'ou - Kolofo'ou-Nu'alei
DELETE FROM administrative.ba_unit WHERE id = '99434be0-44c8-11e3-9f6a-938ca0c991f8'; -- Kolofo'ou - Klf
DELETE FROM administrative.ba_unit WHERE id = '99434be0-44c8-11e3-9fa1-5b48d1d7b756'; -- Kolofo'ou - Kofo'ou
DELETE FROM administrative.ba_unit WHERE id = '9943e820-44c8-11e3-8152-e75d29bcd904'; -- Kolofo'ou - Kolofo'ou-Nu'alei
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99434be0-44c8-11e3-9f6a-938ca0c991f8'; -- Kolofo'ou - Klf
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99434be0-44c8-11e3-9fa1-5b48d1d7b756'; -- Kolofo'ou - Kofo'ou
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '9943e820-44c8-11e3-8152-e75d29bcd904'; -- Kolofo'ou - Kolofo'ou-Nu'alei

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '9935900e-44c8-11e3-b560-cba1fb51e887' WHERE to_ba_unit_id = 'e3eb2840-44c6-11e3-ae1d-97489b7115c1'; -- 'Atele - Atele
DELETE FROM administrative.ba_unit WHERE id = '9937d9fe-44c8-11e3-ae05-4b02c889a6e8'; -- 'Atele - Atele
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '9937d9fe-44c8-11e3-ae05-4b02c889a6e8'; -- 'Atele - Atele

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '99384f38-44c8-11e3-b00c-3b330e049542' WHERE to_ba_unit_id = 'e35d651e-44c6-11e3-a9be-43e65119e53d'; -- Fafa Island - Fafa Islandand
DELETE FROM administrative.ba_unit WHERE id = '99387648-44c8-11e3-be8a-e73a241fdfc1'; -- Fafa Island - Fafa Islandand
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99387648-44c8-11e3-be8a-e73a241fdfc1'; -- Fafa Island - Fafa Islandand

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4a07c-44c4-11e3-a911-77be66607d3a' WHERE to_ba_unit_id = 'e59e83ee-44c6-11e3-9a0f-37f41a76ce5a'; --Kolomotu'a - Kolomotua'
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4a07c-44c4-11e3-a911-77be66607d3a' WHERE to_ba_unit_id = 'e49aa4b4-44c6-11e3-8e6f-a3a59fb408ac'; --Kolomotu'a - Kolomou'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4a07c-44c4-11e3-a911-77be66607d3a' WHERE to_ba_unit_id = 'e48dac32-44c6-11e3-832c-dfc739ff0278'; --Kolomotu'a - Kolomou'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4a07c-44c4-11e3-a911-77be66607d3a' WHERE to_ba_unit_id = 'e4a1d0c2-44c6-11e3-b8f3-577824fab828'; --Kolomotu'a - Kolomou'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4a07c-44c4-11e3-a911-77be66607d3a' WHERE to_ba_unit_id = 'e4edf60a-44c6-11e3-a032-5f91873da55e'; --Kolomotu'a - Kolomoutu'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4a07c-44c4-11e3-a911-77be66607d3a' WHERE to_ba_unit_id = 'e5a317e2-44c6-11e3-8177-972eb987edcc'; --Kolomotu'a - Kolomoutu'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4a07c-44c4-11e3-a911-77be66607d3a' WHERE to_ba_unit_id = 'e56dfd5a-44c6-11e3-ba85-d7c57f205eae'; --Kolomotu'a - Kolotu'a
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbd4a07c-44c4-11e3-a911-77be66607d3a' WHERE to_ba_unit_id = 'e56e728a-44c6-11e3-a0d8-cffcef5d7d07'; --Kolomotu'a - Komotu'a
DELETE FROM administrative.ba_unit WHERE id = '99443640-44c8-11e3-b96f-e3297c99c458'; --Kolomotu'a - Kolomotua'
DELETE FROM administrative.ba_unit WHERE id = '99445d50-44c8-11e3-83aa-f79321771013'; --Kolomotu'a - Kolomou'a
DELETE FROM administrative.ba_unit WHERE id = '99445d50-44c8-11e3-bfad-7f43344ddf45'; --Kolomotu'a - Kolomoutu'a
DELETE FROM administrative.ba_unit WHERE id = '99448460-44c8-11e3-8a9c-23fd7b02faee'; --Kolomotu'a - Kolotu'a
DELETE FROM administrative.ba_unit WHERE id = '9944d280-44c8-11e3-8a77-73925ddfb9da'; --Kolomotu'a - Komotu'a
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99443640-44c8-11e3-b96f-e3297c99c458'; --Kolomotu'a - Kolomotua'
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99445d50-44c8-11e3-83aa-f79321771013'; --Kolomotu'a - Kolomou'a
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99445d50-44c8-11e3-bfad-7f43344ddf45'; --Kolomotu'a - Kolomoutu'a
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99448460-44c8-11e3-8a9c-23fd7b02faee'; --Kolomotu'a - Kolotu'a
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '9944d280-44c8-11e3-8a77-73925ddfb9da'; --Kolomotu'a - Komotu'a

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbdb5750-44c4-11e3-927e-47d8970709fb' WHERE to_ba_unit_id = 'e30cfa02-44c6-11e3-8d49-ef04278dab2e'; --'Ahau - Ahau
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbdb5750-44c4-11e3-927e-47d8970709fb' WHERE to_ba_unit_id = 'e3102e5c-44c6-11e3-bec6-7fa7c2dd3aff'; --'Ahau - Ahau
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '993716ae-44c8-11e3-a2fe-5fc2be9d1a71'; --'Ahau - Ahau
DELETE FROM administrative.ba_unit WHERE id = '993716ae-44c8-11e3-a2fe-5fc2be9d1a71'; --'Ahau - Ahau

DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'bbd5d8fc-44c4-11e3-ad61-735d1e2ac3a9'; --invalid town lolotelio
DELETE FROM administrative.ba_unit WHERE id = 'bbd5d8fc-44c4-11e3-ad61-735d1e2ac3a9'; --invalid town lolotelio

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = '994c259e-44c8-11e3-9091-af1b2265095d' WHERE to_ba_unit_id = 'e474305e-44c6-11e3-9fcc-af4afe2497da'; --Nuku'alofa - Nuku'aloga
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'bff84956-53dd-11e3-a3f2-1b91234140c0'; --Nuku'alofa - Nuku'aloga
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '994c259e-44c8-11e3-8f36-2b19ad581217'; --Nuku'alofa - Nuku'aloga
DELETE FROM administrative.ba_unit WHERE id = '994c259e-44c8-11e3-8f36-2b19ad581217'; --Nuku'alofa - Nuku'aloga

UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbdb7e60-44c4-11e3-931b-5bd8c49aac21' WHERE to_ba_unit_id = 'eae80c26-44c6-11e3-a38f-070243594dab'; --'Eueiki - 'eueiki
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbdb7e60-44c4-11e3-931b-5bd8c49aac21' WHERE to_ba_unit_id = 'e51ca7de-44c6-11e3-b751-cf9533d10e9d'; --'Eueiki - Eueiki
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbdb7e60-44c4-11e3-931b-5bd8c49aac21' WHERE to_ba_unit_id = 'e51d1d0e-44c6-11e3-ab7e-2336ea8abde9'; --'Eueiki - Eueiki
UPDATE administrative.required_relationship_baunit SET from_ba_unit_id = 'bbdb7e60-44c4-11e3-931b-5bd8c49aac21' WHERE to_ba_unit_id = 'e5ca9da8-44c6-11e3-aed3-7370867897e9'; --'Eueiki - Eueiki
DELETE FROM administrative.ba_unit WHERE id = '9935de2e-44c8-11e3-8d64-43b92c376474'; --'Eueiki - 'eueiki
DELETE FROM administrative.ba_unit WHERE id = '99382828-44c8-11e3-b311-c7de4080b326'; --'Eueiki - Eueiki
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '9935de2e-44c8-11e3-8d64-43b92c376474'; --'Eueiki - 'eueiki
DELETE FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = '99382828-44c8-11e3-b311-c7de4080b326'; --'Eueiki - Eueiki

-- Update wrong town names
UPDATE administrative.ba_unit SET name = 'Neiafu', name_firstpart = 'Neiafu' WHERE id = 'bbd6ea6c-44c4-11e3-8562-57ea70dcdc14'; --Neiafu tt - Neiafu
UPDATE administrative.ba_unit SET name = 'Hihifo', name_firstpart = 'Hihifo' WHERE id = '9940dad6-44c8-11e3-86b4-4ff4676ecf85'; --Hihifo NTT - Hihifo
UPDATE administrative.ba_unit SET name = '''Atata Island', name_firstpart = '''Atata Island' WHERE id = '9937b2ee-44c8-11e3-90bf-4b32854a2942'; --'Atata Island - Atata Islandand
UPDATE administrative.ba_unit SET name = '''Alakifonua', name_firstpart = '''Alakifonua' WHERE id = '99373dbe-44c8-11e3-a4af-0b2e502e0c76'; --'Alakifonua - Alakifonua
UPDATE administrative.ba_unit SET name = '''Atele', name_firstpart = '''Atele' WHERE id = '9937d9fe-44c8-11e3-b234-3fdea1c0e199'; --'Atele - Atele 'Olokava
