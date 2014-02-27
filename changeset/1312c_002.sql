-- #2 Make the Estates represent Nobles instead of areas of land
DELETE from administrative.ba_unit where type_code = 'estateUnit';
INSERT INTO party.party(id, name, type_code) VALUES ('crown', 'Crown','nonNaturalPerson');

INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05334d90-66a3-11e3-aee7-ebbb8297d9f8', 'Ha''alaufuli', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''alaufuli' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05371e2a-66a3-11e3-8b65-37bd44be44ea', 'Ha''avakatolo', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''avakatolo' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0537935a-66a3-11e3-b355-5ffd22e834f8', 'Utui', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Utui' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05382f9a-66a3-11e3-9ebe-eb267c74f090', 'Taunga', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Taunga' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0538a4d4-66a3-11e3-9099-7b18f14fdf5b', 'Kolovai', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Kolovai' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05391a04-66a3-11e3-9431-d37f2ddae8c7', 'Atata', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Atata' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05396824-66a3-11e3-b5ca-2f721b9005df', 'Maufanga', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Maufanga' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0539dd54-66a3-11e3-8634-07bc9b81258b', 'Nga''akau', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Nga''akau' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053a5284-66a3-11e3-9fc1-ff5ae9876722', 'Faleloa', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Faleloa' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053ac7b4-66a3-11e3-bbf4-bf2654c88064', 'Falevai', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Falevai' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053b3ce4-66a3-11e3-8dba-3f22c0c9e41a', 'Havelu', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Havelu' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053bb21e-66a3-11e3-8af8-779f0a77c6e3', 'Puke', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Puke' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053c274e-66a3-11e3-9b2e-33a75a68c3e6', 'Alele', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Alele' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053c756e-66a3-11e3-9231-5f1c76b30a0a', 'Angaha (western side)', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Angaha (western side)' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053cea9e-66a3-11e3-8227-3bf26d0daec2', 'Ahau (western side)', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ahau (western side)' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053d5fce-66a3-11e3-84df-6f75910733e9', 'Palau', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Palau' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053dd4fe-66a3-11e3-86af-1310c468b629', 'Ha''ahoko', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''ahoko' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053e4a38-66a3-11e3-b47a-9f007a7f5e6e', 'Leimatu''a', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Leimatu''a' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053e9858-66a3-11e3-a24f-e745aefd48bb', 'Hunga', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Hunga' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053f0d88-66a3-11e3-8578-af7d69159808', 'Fangalepa', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fangalepa' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053f82b8-66a3-11e3-86ba-979298dc1a90', 'Loto''uiha', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Loto''uiha' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '053ff7e8-66a3-11e3-97d2-fb5cd385dc6b', 'Faletanu', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Faletanu' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05406d18-66a3-11e3-8eee-e7c8e40ae53c', 'Angaha (Eastern Side)', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Angaha (Eastern Side)' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0540bb42-66a3-11e3-9eeb-97f8e71dd8a8', 'Ma''ufanga (Niua)', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ma''ufanga (Niua)' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05413072-66a3-11e3-b444-477e8ec29f64', '''Utulau', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = '''Utulau' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0541a5a2-66a3-11e3-afa7-8742e895c10d', 'Taoa', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Taoa' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0541f3c2-66a3-11e3-b523-4702bc7500fe', 'Nomuka', '''Eua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Nomuka' AND name_lastpart = '''Eua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054268f2-66a3-11e3-993d-b7baeaa2e8c5', 'Nomukeiki', '''Eua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Nomukeiki' AND name_lastpart = '''Eua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0542de22-66a3-11e3-ab56-0f8d3e4f5718', 'Lofafanga', '''Eua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Lofafanga' AND name_lastpart = '''Eua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0543535c-66a3-11e3-b915-17e883ba6442', 'Niniva', '''Eua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Niniva' AND name_lastpart = '''Eua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0543a17c-66a3-11e3-85ce-4bac5f94109c', 'Lapaha', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Lapaha' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054416ac-66a3-11e3-a8d9-1b4430786c3d', 'Hamula', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Hamula' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05448bdc-66a3-11e3-8296-9fcf59293fad', 'Toloa', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Toloa' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0545010c-66a3-11e3-b8ae-1bd235b6f001', 'Lakepa (''Ahau)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Lakepa (''Ahau)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05454f2c-66a3-11e3-bee0-b380ca3294e7', 'Lakepa (Ha''atau)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Lakepa (Ha''atau)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0545c45c-66a3-11e3-b842-1fddf9f3560b', 'Lakepa (Kala''au)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Lakepa (Kala''au)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05463996-66a3-11e3-88be-571b557597b4', 'Lakepa (Ha''amea)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Lakepa (Ha''amea)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0546aec6-66a3-11e3-ba3d-ff69248a84f0', 'Lakepa (Navutoka)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Lakepa (Navutoka)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0546fce6-66a3-11e3-9b8a-175839e446eb', 'Fonongahina', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fonongahina' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05477216-66a3-11e3-894b-fb8fbaa086bd', 'Tafangafanga (Hahake)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Tafangafanga (Hahake)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0547e746-66a3-11e3-a773-8f720a6059ce', 'Lakepa (''Eua)', '''Eua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Lakepa (''Eua)' AND name_lastpart = '''Eua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05483566-66a3-11e3-8183-538eb2ea5ccb', 'Talafo''ou', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Talafo''ou' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0548aaa0-66a3-11e3-9b31-0339df3b8823', 'Masilamea', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Masilamea' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05491fd0-66a3-11e3-895e-bb54f0ee4764', 'Fualu', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fualu' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05496df0-66a3-11e3-a551-1be1cf2fbe03', 'Pea', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pea' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054a0a30-66a3-11e3-a2b7-bf2ec7e573a5', 'Nakolo', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Nakolo' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054a7f60-66a3-11e3-841d-db2c6a457628', 'Malapo', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Malapo' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054af490-66a3-11e3-8cbb-83296bb43380', 'Fetoa', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fetoa' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054b42b0-66a3-11e3-90b0-33cc0f58b279', 'Tefisi', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Tefisi' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054bb7ea-66a3-11e3-9806-2b0b112ef83b', 'Tokomololo', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Tokomololo' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054c2d1a-66a3-11e3-9ab2-83c629a1ad94', 'Vaini', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Vaini' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054ca24a-66a3-11e3-a508-43d0e5bf7245', 'Vaipoa', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Vaipoa' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054cf06a-66a3-11e3-a151-db606990c1cc', 'Hihifo', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Hihifo' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054d659a-66a3-11e3-8677-db5eda80a31a', 'Vaotahi', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Vaotahi' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054ddaca-66a3-11e3-9abf-f7ecf2eb8c28', 'Hunganga', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Hunganga' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054e28f4-66a3-11e3-afd2-fb4d6a0090c6', 'Tavili', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Tavili' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054e9e24-66a3-11e3-831c-33b6284badb9', 'Taka''amoato''a', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Taka''amoato''a' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054eec44-66a3-11e3-9940-27184f0361f2', 'Teleki', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Teleki' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054f6174-66a3-11e3-8dbb-7b80500ed30d', 'Uiha', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Uiha' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '054fd6a4-66a3-11e3-8ae3-0f79cea84bec', 'Te''ekiu', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Te''ekiu' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055024c4-66a3-11e3-b300-dbd112512c03', 'Haufolau', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Haufolau' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055099f4-66a3-11e3-9789-eb2b7ccab069', 'Fangale''ounga', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fangale''ounga' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0550e81e-66a3-11e3-a8b9-cbebf7770b4e', 'Kolonga', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Kolonga' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05515d4e-66a3-11e3-bb68-c32dd71d0d31', 'Poha', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Poha' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0551d27e-66a3-11e3-9ac0-171910a90444', 'Kotonga', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Kotonga' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055247ae-66a3-11e3-9daf-dbcdedd38707', 'Loto''a', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Loto''a' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055295ce-66a3-11e3-8432-47a9b044867d', 'Sia ko Veiongo', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Sia ko Veiongo' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05530afe-66a3-11e3-8c2b-4fdf7e5ad965', 'Pangai (Nuku''alofa)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pangai (Nuku''alofa)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05538038-66a3-11e3-9ed0-4fa19648e036', 'Mapu''afuiva (Nuku''alofa)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Mapu''afuiva (Nuku''alofa)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0553f568-66a3-11e3-a3d1-5750111ce275', 'Afinemata Island', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Afinemata Island' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05546a98-66a3-11e3-8b8a-cb425c0e87db', 'Fua''amotu Island', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fua''amotu Island' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0554dfc8-66a3-11e3-bcc4-eb245be2c3cd', 'Nuapapu Island', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Nuapapu Island' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055554f8-66a3-11e3-a78a-1bb68d98334f', 'Pangaimotu', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pangaimotu' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0555ca28-66a3-11e3-bf62-bfa03d8b7fa7', 'Tufutelei (''Api)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Tufutelei (''Api)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05563f62-66a3-11e3-b675-73bfe30a1762', '''Ovava (''Api)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = '''Ovava (''Api)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0556b492-66a3-11e3-a8e5-3faba763afec', 'Holonga ', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Holonga ' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055729c2-66a3-11e3-b25e-6f0a299bd613', 'Fatai (''Api)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fatai (''Api)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05579ef2-66a3-11e3-86e9-1fe62f9f0ff0', 'Fangaliki (''Api)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fangaliki (''Api)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05581422-66a3-11e3-8541-d7792da3c66d', 'Keitahi (''Api)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Keitahi (''Api)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05586242-66a3-11e3-8993-cb963230905a', 'Tamama''uloto (''Api)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Tamama''uloto (''Api)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0558d77c-66a3-11e3-8458-9bb11d05bff8', 'Veitatalo (''Api)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Veitatalo (''Api)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05594cac-66a3-11e3-9709-c37c99bb3fbd', 'Pipilotoi (''Api)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pipilotoi (''Api)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05599acc-66a3-11e3-8ad2-973f869730ec', 'Pangai - ''Uta (Lifuka)', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pangai - ''Uta (Lifuka)' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055a0ffc-66a3-11e3-a58c-1f9680c05de9', 'Tau''akipulu', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Tau''akipulu' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055a852c-66a3-11e3-9506-6f27426dd51d', 'Pangai (Foa)', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pangai (Foa)' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055ad34c-66a3-11e3-97ee-d3e1ca82b8ac', 'Mango Island', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Mango Island' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055b487c-66a3-11e3-96ce-d3feb1c7a12c', 'Nukunamo Island', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Nukunamo Island' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055bbdb6-66a3-11e3-a321-6357c2a75bdd', 'Houma', '''Eua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Houma' AND name_lastpart = '''Eua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055c32e6-66a3-11e3-852f-ab90a7491cf5', 'Falehau', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Falehau' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055c8106-66a3-11e3-876c-f70736d9050a', 'Mata''aho', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Mata''aho' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055cf636-66a3-11e3-9636-3bcc353c0f19', 'Mahinafekita', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Mahinafekita' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055d6b66-66a3-11e3-bb56-5fab64b4f7b0', 'Angihoa', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Angihoa' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055db986-66a3-11e3-ad9a-47043818a863', 'Makave', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Makave' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055e2ec0-66a3-11e3-b7ea-4bd5d168ebc9', 'Holopeka', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Holopeka' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055ea3f0-66a3-11e3-be04-d74100bdf05b', 'Fonoifua', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fonoifua' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055f1920-66a3-11e3-8d49-576b5b0ec6af', 'Ha''ano', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''ano' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055f6740-66a3-11e3-bda2-7f2a4b93c638', 'Pukotala', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pukotala' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '055fdc70-66a3-11e3-9974-ab834f417e5e', 'Muitoa', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Muitoa' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056051a0-66a3-11e3-b135-87a412e5e69b', 'Tungua', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Tungua' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0560c6da-66a3-11e3-bd47-03320f88a6cb', 'Matuku', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Matuku' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05613c0a-66a3-11e3-b423-039c396ada4d', 'Ha''ateiho', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''ateiho' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0561b13a-66a3-11e3-aafd-df0e405fdce1', 'Vaikeli ', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Vaikeli ' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0562266a-66a3-11e3-9a7c-970844fe13df', 'Ha''ateiho', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''ateiho' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05629b9a-66a3-11e3-9102-8bfbd0fa51d2', 'Fine''ehe (Pangai)', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fine''ehe (Pangai)' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056310ca-66a3-11e3-a8f1-9f0e52e202d4', 'Talasiu', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Talasiu' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05638604-66a3-11e3-9380-cb5ce130bd51', 'Ofu', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ofu' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05642244-66a3-11e3-b9a2-138b48f7d0ba', 'Okoa', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Okoa' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05649774-66a3-11e3-a408-e784252db708', 'Vasivasi', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Vasivasi' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05650ca4-66a3-11e3-975d-976ffa218a3b', 'Pelehake', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pelehake' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056581d4-66a3-11e3-86fa-0f679921e670', 'Ha''atalafale', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''atalafale' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0565cff4-66a3-11e3-ab2f-03538516f8ea', 'Ha''atalafale', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''atalafale' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05661e1e-66a3-11e3-97b1-13fa1932c56e', '''Utungake', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = '''Utungake' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05666c3e-66a3-11e3-8bd3-5fa97581840c', 'Ha''afakahenga', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''afakahenga' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0566ba5e-66a3-11e3-b869-47f08081141e', 'Futu', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Futu' AND name_lastpart = 'Niua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05672f8e-66a3-11e3-b9f1-f369d7035a43', 'Nukunuku', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Nukunuku' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05677dae-66a3-11e3-a883-ab7fc3cd021e', 'Matahau', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Matahau' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0567cbce-66a3-11e3-9e00-bb4c930a55f5', 'Vaotu''u', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Vaotu''u' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056819ee-66a3-11e3-b4c2-63db63e26890', 'Matafonua', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Matafonua' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0568680e-66a3-11e3-ac8b-8bc5bb1054a6', 'Mu''a', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Mu''a' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0568b638-66a3-11e3-8641-77a0b9c7d860', 'Mu''a (Ha''atakalaua to Fua''amotu)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Mu''a (Ha''atakalaua to Fua''amotu)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0568dd48-66a3-11e3-ae1a-ab2874965518', 'Mu''a (Kai''avale)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Mu''a (Kai''avale)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05692b68-66a3-11e3-99df-f76d8db4d2d2', 'Mu''a (Ha''atui)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Mu''a (Ha''atui)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05697988-66a3-11e3-a128-1b638fc98f6f', 'Navutoka', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Navutoka' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0569eeb8-66a3-11e3-8856-177d960a3381', 'Ha''afeva', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''afeva' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056a3cd8-66a3-11e3-a802-1f869999d038', 'Hihifo', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Hihifo' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056a8af8-66a3-11e3-b5e9-cf3f2c80296c', 'Houma', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Houma' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056b0028-66a3-11e3-a062-cbb752577a14', 'Foui', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Foui' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056b4e48-66a3-11e3-be38-5b9a461ad102', 'Ta''anea', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ta''anea' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056bc382-66a3-11e3-a65f-07be1553f4e6', 'Fahefa', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fahefa' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056c38b2-66a3-11e3-97f2-cffbf729476e', 'Pangai', '''Eua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pangai' AND name_lastpart = '''Eua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056c86d2-66a3-11e3-bdc1-4fdebef996e9', 'Longoteme', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Longoteme' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056cfc02-66a3-11e3-b0f6-f760166b1b58', 'Matahau (Vikune)', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Matahau (Vikune)' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056d4a22-66a3-11e3-aee1-2b8d99cb95ed', '''Oneata Island', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = '''Oneata Island' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056dbf52-66a3-11e3-b96d-7f305e964f78', 'Kanatea Island', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Kanatea Island' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056e348c-66a3-11e3-8ce1-cfe447aa22b5', 'Pale''a (Pale''a to Fongotofe)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Pale''a (Pale''a to Fongotofe)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056e82ac-66a3-11e3-b63a-3bd99cf6bd84', 'Talahuo ', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Talahuo ' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056ef7dc-66a3-11e3-8794-37e4417b0549', 'Lolopipi (between Nga''akau and Vaimalo)', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Lolopipi (between Nga''akau and Vaimalo)' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056f6d0c-66a3-11e3-afba-873981863150', 'Longomapu', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Longomapu' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '056fbb2c-66a3-11e3-8507-372d56ecab9c', 'Kolotahi Island', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Kolotahi Island' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0570305c-66a3-11e3-bfd3-2fcb7cf536ea', 'Ha''akoka', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Ha''akoka' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0570a58c-66a3-11e3-b96e-433875b5710d', 'Fangaeva', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Fangaeva' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05711ac6-66a3-11e3-b93e-47deb59e9264', 'Crown', 'Tongatapu', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Crown' AND name_lastpart = 'Tongatapu');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05718ff6-66a3-11e3-a250-77661fe6456c', 'Crown', 'Vava''u', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Crown' AND name_lastpart = 'Vava''u');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05720526-66a3-11e3-9d6c-2f32796dc2e0', 'Crown', '''Eua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Crown' AND name_lastpart = '''Eua');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '05725346-66a3-11e3-9be2-9b501bfd73de', 'Crown', 'Ha''apai', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Crown' AND name_lastpart = 'Ha''apai');
INSERT INTO cadastre.cadastre_object (id, name_firstpart, name_lastpart, type_code, status_code, transaction_id, land_use_code, source_reference, change_user)
 SELECT '0572c876-66a3-11e3-801b-87d59ed88002', 'Crown', 'Niua', 'estate', 'current', 'migration', null, 'Land Act', 'migration'
 WHERE NOT EXISTS (SELECT id FROM cadastre.cadastre_object WHERE name_firstpart = 'Crown' AND name_lastpart = 'Niua');
 
 INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'afu', 'AFU', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'AFU' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '053681ea-66a3-11e3-b8de-3357705d3969', 'afu', 'AFU_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '053681ea-66a3-11e3-b8de-3357705d3969'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '0536a8fa-66a3-11e3-9385-3f77744b3927', '053681ea-66a3-11e3-b8de-3357705d3969', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '0536a8fa-66a3-11e3-9385-3f77744b3927'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '053681ea-66a3-11e3-b8de-3357705d3969', '0536a8fa-66a3-11e3-9385-3f77744b3927', 'afu'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '053681ea-66a3-11e3-b8de-3357705d3969'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'ahomee', '''AHOME''E', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'AHOMEE' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0537453a-66a3-11e3-bf39-2bb8addbf4f1', 'ahomee', 'AHOMEE_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0537453a-66a3-11e3-bf39-2bb8addbf4f1'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05376c4a-66a3-11e3-a318-37d7e0cb9411', '0537453a-66a3-11e3-bf39-2bb8addbf4f1', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05376c4a-66a3-11e3-a318-37d7e0cb9411'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0537453a-66a3-11e3-bf39-2bb8addbf4f1', '05376c4a-66a3-11e3-a318-37d7e0cb9411', '''ahome''e'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0537453a-66a3-11e3-bf39-2bb8addbf4f1'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'akauola', '''AKAUOLA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'AKAUOLA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '05382f9a-66a3-11e3-9b8f-37b4bf7d5be2', 'akauola', 'AKAUOLA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '05382f9a-66a3-11e3-9b8f-37b4bf7d5be2'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '053856aa-66a3-11e3-8edb-bff79173b517', '05382f9a-66a3-11e3-9b8f-37b4bf7d5be2', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '053856aa-66a3-11e3-8edb-bff79173b517'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '05382f9a-66a3-11e3-9b8f-37b4bf7d5be2', '053856aa-66a3-11e3-8edb-bff79173b517', '''akauola'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '05382f9a-66a3-11e3-9b8f-37b4bf7d5be2'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'ata', 'ATA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'ATA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0538cbe4-66a3-11e3-9533-efeba514a059', 'ata', 'ATA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0538cbe4-66a3-11e3-9533-efeba514a059'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '0538f2f4-66a3-11e3-b590-63f3141cc152', '0538cbe4-66a3-11e3-9533-efeba514a059', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '0538f2f4-66a3-11e3-b590-63f3141cc152'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0538cbe4-66a3-11e3-9533-efeba514a059', '0538f2f4-66a3-11e3-b590-63f3141cc152', 'ata'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0538cbe4-66a3-11e3-9533-efeba514a059'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'fakafanua', 'FAKAFANUA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'FAKAFANUA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0539b644-66a3-11e3-9026-ebf143488c53', 'fakafanua', 'FAKAFANUA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0539b644-66a3-11e3-9026-ebf143488c53'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '0539b644-66a3-11e3-8c05-73db7a07844b', '0539b644-66a3-11e3-9026-ebf143488c53', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '0539b644-66a3-11e3-8c05-73db7a07844b'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0539b644-66a3-11e3-9026-ebf143488c53', '0539b644-66a3-11e3-8c05-73db7a07844b', 'fakafanua'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0539b644-66a3-11e3-9026-ebf143488c53'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'fakatulolo', 'FAKATULOLO', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'FAKATULOLO' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '053aeec4-66a3-11e3-9bc6-c74963076d6a', 'fakatulolo', 'FAKATULOLO_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '053aeec4-66a3-11e3-9bc6-c74963076d6a'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '053b15d4-66a3-11e3-9b81-23f67fdeb85f', '053aeec4-66a3-11e3-9bc6-c74963076d6a', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '053b15d4-66a3-11e3-9b81-23f67fdeb85f'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '053aeec4-66a3-11e3-9bc6-c74963076d6a', '053b15d4-66a3-11e3-9b81-23f67fdeb85f', 'fakatulolo'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '053aeec4-66a3-11e3-9bc6-c74963076d6a'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'fielakepa', 'FIELAKEPA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'FIELAKEPA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '053b63fe-66a3-11e3-8fc2-47df62957b10', 'fielakepa', 'FIELAKEPA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '053b63fe-66a3-11e3-8fc2-47df62957b10'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '053b8b0e-66a3-11e3-90d9-c7961201ac61', '053b63fe-66a3-11e3-8fc2-47df62957b10', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '053b8b0e-66a3-11e3-90d9-c7961201ac61'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '053b63fe-66a3-11e3-8fc2-47df62957b10', '053b8b0e-66a3-11e3-90d9-c7961201ac61', 'fielakepa'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '053b63fe-66a3-11e3-8fc2-47df62957b10'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'fohe', 'FOHE', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'FOHE' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '053bd92e-66a3-11e3-8d08-97c023e4591a', 'fohe', 'FOHE_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '053bd92e-66a3-11e3-8d08-97c023e4591a'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '053c003e-66a3-11e3-bf6c-0b70c2e46e1a', '053bd92e-66a3-11e3-8d08-97c023e4591a', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '053c003e-66a3-11e3-bf6c-0b70c2e46e1a'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '053bd92e-66a3-11e3-8d08-97c023e4591a', '053c003e-66a3-11e3-bf6c-0b70c2e46e1a', 'fohe'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '053bd92e-66a3-11e3-8d08-97c023e4591a'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'fotofili', 'FOTOFILI', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'FOTOFILI' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '053c274e-66a3-11e3-8368-b7439b442632', 'fotofili', 'FOTOFILI_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '053c274e-66a3-11e3-8368-b7439b442632'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '053c4e5e-66a3-11e3-b976-0b05ea170d6f', '053c274e-66a3-11e3-8368-b7439b442632', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '053c4e5e-66a3-11e3-b976-0b05ea170d6f'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '053c274e-66a3-11e3-8368-b7439b442632', '053c4e5e-66a3-11e3-b976-0b05ea170d6f', 'fotofili'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '053c274e-66a3-11e3-8368-b7439b442632'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'fotu', 'FOTU', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'FOTU' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '053e4a38-66a3-11e3-a958-6bba44ca7a16', 'fotu', 'FOTU_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '053e4a38-66a3-11e3-a958-6bba44ca7a16'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '053e7148-66a3-11e3-8a56-8f0201b9742e', '053e4a38-66a3-11e3-a958-6bba44ca7a16', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '053e7148-66a3-11e3-8a56-8f0201b9742e'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '053e4a38-66a3-11e3-a958-6bba44ca7a16', '053e7148-66a3-11e3-8a56-8f0201b9742e', 'fotu'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '053e4a38-66a3-11e3-a958-6bba44ca7a16'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'fulivai', 'FULIVAI', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'FULIVAI' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '053ebf68-66a3-11e3-84af-6f9618462b6f', 'fulivai', 'FULIVAI_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '053ebf68-66a3-11e3-84af-6f9618462b6f'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '053ee678-66a3-11e3-a6d2-9f8a7ffb0445', '053ebf68-66a3-11e3-84af-6f9618462b6f', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '053ee678-66a3-11e3-a6d2-9f8a7ffb0445'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '053ebf68-66a3-11e3-84af-6f9618462b6f', '053ee678-66a3-11e3-a6d2-9f8a7ffb0445', 'fulivai'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '053ebf68-66a3-11e3-84af-6f9618462b6f'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'fusitua', 'FUSITU''A', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'FUSITUA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '05401ef8-66a3-11e3-98d3-53f1e3be84d0', 'fusitua', 'FUSITUA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '05401ef8-66a3-11e3-98d3-53f1e3be84d0'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05404608-66a3-11e3-8477-43c5aedc03f0', '05401ef8-66a3-11e3-98d3-53f1e3be84d0', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05404608-66a3-11e3-8477-43c5aedc03f0'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '05401ef8-66a3-11e3-98d3-53f1e3be84d0', '05404608-66a3-11e3-8477-43c5aedc03f0', 'fusitu''a'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '05401ef8-66a3-11e3-98d3-53f1e3be84d0'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'heir apparent', 'HEIR APPARENT', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'HEIR APPARENT' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '05415782-66a3-11e3-a625-3b701f4a2b1a', 'heir apparent', 'HEIR APPARENT_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '05415782-66a3-11e3-a625-3b701f4a2b1a'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05415782-66a3-11e3-8975-173130a072b4', '05415782-66a3-11e3-a625-3b701f4a2b1a', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05415782-66a3-11e3-8975-173130a072b4'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '05415782-66a3-11e3-a625-3b701f4a2b1a', '05415782-66a3-11e3-8975-173130a072b4', 'heir apparent'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '05415782-66a3-11e3-a625-3b701f4a2b1a'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'kalaniuvalu', 'KALANIUVALU', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'KALANIUVALU' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0543c88c-66a3-11e3-b245-db863c6fab11', 'kalaniuvalu', 'KALANIUVALU_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0543c88c-66a3-11e3-b245-db863c6fab11'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '0543ef9c-66a3-11e3-a7f0-676124f61588', '0543c88c-66a3-11e3-b245-db863c6fab11', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '0543ef9c-66a3-11e3-a7f0-676124f61588'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0543c88c-66a3-11e3-b245-db863c6fab11', '0543ef9c-66a3-11e3-a7f0-676124f61588', 'kalaniuvalu'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0543c88c-66a3-11e3-b245-db863c6fab11'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'lasike', 'LASIKE', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'LASIKE' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0545010c-66a3-11e3-95da-c3ca20807a03', 'lasike', 'LASIKE_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0545010c-66a3-11e3-95da-c3ca20807a03'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '0545281c-66a3-11e3-8e4a-8b459fde9708', '0545010c-66a3-11e3-95da-c3ca20807a03', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '0545281c-66a3-11e3-8e4a-8b459fde9708'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0545010c-66a3-11e3-95da-c3ca20807a03', '0545281c-66a3-11e3-8e4a-8b459fde9708', 'lasike'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0545010c-66a3-11e3-95da-c3ca20807a03'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'lauaki', 'LAUAKI', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'LAUAKI' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '05485c76-66a3-11e3-bdb3-1b3aa96281de', 'lauaki', 'LAUAKI_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '05485c76-66a3-11e3-bdb3-1b3aa96281de'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05488386-66a3-11e3-a678-9b47e0fa83c3', '05485c76-66a3-11e3-bdb3-1b3aa96281de', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05488386-66a3-11e3-a678-9b47e0fa83c3'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '05485c76-66a3-11e3-bdb3-1b3aa96281de', '05488386-66a3-11e3-a678-9b47e0fa83c3', 'lauaki'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '05485c76-66a3-11e3-bdb3-1b3aa96281de'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'lavaka', 'LAVAKA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'LAVAKA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '05491fd0-66a3-11e3-8a39-6b0e3f7490f8', 'lavaka', 'LAVAKA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '05491fd0-66a3-11e3-8a39-6b0e3f7490f8'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '054946e0-66a3-11e3-a303-cbbb9a30766f', '05491fd0-66a3-11e3-8a39-6b0e3f7490f8', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '054946e0-66a3-11e3-a303-cbbb9a30766f'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '05491fd0-66a3-11e3-8a39-6b0e3f7490f8', '054946e0-66a3-11e3-a303-cbbb9a30766f', 'lavaka'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '05491fd0-66a3-11e3-8a39-6b0e3f7490f8'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'luani', 'LUANI', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'LUANI' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '054a3140-66a3-11e3-9f6d-ff10195c1724', 'luani', 'LUANI_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '054a3140-66a3-11e3-9f6d-ff10195c1724'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '054a5850-66a3-11e3-9e9d-df4a9aa047d2', '054a3140-66a3-11e3-9f6d-ff10195c1724', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '054a5850-66a3-11e3-9e9d-df4a9aa047d2'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '054a3140-66a3-11e3-9f6d-ff10195c1724', '054a5850-66a3-11e3-9e9d-df4a9aa047d2', 'luani'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '054a3140-66a3-11e3-9f6d-ff10195c1724'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'maafu', 'MA''AFU', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'MAAFU' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '054bdefa-66a3-11e3-b2f1-2bfd80cf17b5', 'maafu', 'MAAFU_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '054bdefa-66a3-11e3-b2f1-2bfd80cf17b5'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '054c060a-66a3-11e3-8597-ef2ba0d3315f', '054bdefa-66a3-11e3-b2f1-2bfd80cf17b5', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '054c060a-66a3-11e3-8597-ef2ba0d3315f'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '054bdefa-66a3-11e3-b2f1-2bfd80cf17b5', '054c060a-66a3-11e3-8597-ef2ba0d3315f', 'ma''afu'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '054bdefa-66a3-11e3-b2f1-2bfd80cf17b5'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'maatu', 'MA''ATU', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'MAATU' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '054ca24a-66a3-11e3-af3c-f7a24ceb1b0d', 'maatu', 'MAATU_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '054ca24a-66a3-11e3-af3c-f7a24ceb1b0d'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '054cc95a-66a3-11e3-a44a-bbb3a89e309c', '054ca24a-66a3-11e3-af3c-f7a24ceb1b0d', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '054cc95a-66a3-11e3-a44a-bbb3a89e309c'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '054ca24a-66a3-11e3-af3c-f7a24ceb1b0d', '054cc95a-66a3-11e3-a44a-bbb3a89e309c', 'ma''atu'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '054ca24a-66a3-11e3-af3c-f7a24ceb1b0d'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'malupo', 'MALUPO', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'MALUPO' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '054ec534-66a3-11e3-b5f8-7fb852e820e3', 'malupo', 'MALUPO_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '054ec534-66a3-11e3-b5f8-7fb852e820e3'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '054ec534-66a3-11e3-b388-cbbdc6b6fc4c', '054ec534-66a3-11e3-b5f8-7fb852e820e3', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '054ec534-66a3-11e3-b388-cbbdc6b6fc4c'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '054ec534-66a3-11e3-b5f8-7fb852e820e3', '054ec534-66a3-11e3-b388-cbbdc6b6fc4c', 'malupo'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '054ec534-66a3-11e3-b5f8-7fb852e820e3'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'motuapuaka', 'MOTU''APUAKA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'MOTUAPUAKA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '054fd6a4-66a3-11e3-9c34-cbebd45e6c55', 'motuapuaka', 'MOTUAPUAKA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '054fd6a4-66a3-11e3-9c34-cbebd45e6c55'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '054ffdb4-66a3-11e3-b0bf-cf48c2210733', '054fd6a4-66a3-11e3-9c34-cbebd45e6c55', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '054ffdb4-66a3-11e3-b0bf-cf48c2210733'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '054fd6a4-66a3-11e3-9c34-cbebd45e6c55', '054ffdb4-66a3-11e3-b0bf-cf48c2210733', 'motu''apuaka'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '054fd6a4-66a3-11e3-9c34-cbebd45e6c55'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'niukapu', 'NIUKAPU', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'NIUKAPU' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0550c10e-66a3-11e3-8b93-7f8e28785622', 'niukapu', 'NIUKAPU_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0550c10e-66a3-11e3-8b93-7f8e28785622'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '0550c10e-66a3-11e3-9b63-070c20d986ee', '0550c10e-66a3-11e3-8b93-7f8e28785622', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '0550c10e-66a3-11e3-9b63-070c20d986ee'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0550c10e-66a3-11e3-8b93-7f8e28785622', '0550c10e-66a3-11e3-9b63-070c20d986ee', 'niukapu'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0550c10e-66a3-11e3-8b93-7f8e28785622'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'nuku', 'NUKU', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'NUKU' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '05510f2e-66a3-11e3-bb7d-2b29c34b9688', 'nuku', 'NUKU_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '05510f2e-66a3-11e3-bb7d-2b29c34b9688'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '0551363e-66a3-11e3-a62c-dfb3463ed19f', '05510f2e-66a3-11e3-bb7d-2b29c34b9688', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '0551363e-66a3-11e3-a62c-dfb3463ed19f'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '05510f2e-66a3-11e3-bb7d-2b29c34b9688', '0551363e-66a3-11e3-a62c-dfb3463ed19f', 'nuku'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '05510f2e-66a3-11e3-bb7d-2b29c34b9688'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'royal estate', 'ROYAL ESTATE', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'ROYAL ESTATE' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '055247ae-66a3-11e3-b5f8-1b47111aca88', 'royal estate', 'ROYAL ESTATE_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '055247ae-66a3-11e3-b5f8-1b47111aca88'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05526ebe-66a3-11e3-b4bf-8b1f628f420c', '055247ae-66a3-11e3-b5f8-1b47111aca88', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05526ebe-66a3-11e3-b4bf-8b1f628f420c'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '055247ae-66a3-11e3-b5f8-1b47111aca88', '05526ebe-66a3-11e3-b4bf-8b1f628f420c', 'royal estate'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '055247ae-66a3-11e3-b5f8-1b47111aca88'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'royal estate', 'ROYAL ESTATE', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'ROYAL ESTATE' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0556dba2-66a3-11e3-9b97-ab0108ba6ade', 'royal estate', 'ROYAL ESTATE_11', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0556dba2-66a3-11e3-9b97-ab0108ba6ade'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '055702b2-66a3-11e3-b540-f7264cfc641e', '0556dba2-66a3-11e3-9b97-ab0108ba6ade', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '055702b2-66a3-11e3-b540-f7264cfc641e'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0556dba2-66a3-11e3-9b97-ab0108ba6ade', '055702b2-66a3-11e3-b540-f7264cfc641e', 'royal estate'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0556dba2-66a3-11e3-9b97-ab0108ba6ade'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'royal estate', 'ROYAL ESTATE', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'ROYAL ESTATE' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '055afa5c-66a3-11e3-9eca-3b0b6fb9a975', 'royal estate', 'ROYAL ESTATE_21', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '055afa5c-66a3-11e3-9eca-3b0b6fb9a975'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '055b216c-66a3-11e3-8b5d-bb2f6c17c442', '055afa5c-66a3-11e3-9eca-3b0b6fb9a975', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '055b216c-66a3-11e3-8b5d-bb2f6c17c442'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '055afa5c-66a3-11e3-9eca-3b0b6fb9a975', '055b216c-66a3-11e3-8b5d-bb2f6c17c442', 'royal estate'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '055afa5c-66a3-11e3-9eca-3b0b6fb9a975'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tangipa', 'TANGIPA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TANGIPA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '055d1d46-66a3-11e3-82dc-537b5ab30dc8', 'tangipa', 'TANGIPA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '055d1d46-66a3-11e3-82dc-537b5ab30dc8'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '055d4456-66a3-11e3-b2e7-6bcd40c612e8', '055d1d46-66a3-11e3-82dc-537b5ab30dc8', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '055d4456-66a3-11e3-b2e7-6bcd40c612e8'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '055d1d46-66a3-11e3-82dc-537b5ab30dc8', '055d4456-66a3-11e3-b2e7-6bcd40c612e8', 'tangipa'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '055d1d46-66a3-11e3-82dc-537b5ab30dc8'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tuiafitu', 'TU''I''AFITU', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TUIAFITU' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '055de096-66a3-11e3-a34b-ff129abc29b7', 'tuiafitu', 'TUIAFITU_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '055de096-66a3-11e3-a34b-ff129abc29b7'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '055e07b0-66a3-11e3-9026-df81f74b0b1b', '055de096-66a3-11e3-a34b-ff129abc29b7', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '055e07b0-66a3-11e3-9026-df81f74b0b1b'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '055de096-66a3-11e3-a34b-ff129abc29b7', '055e07b0-66a3-11e3-9026-df81f74b0b1b', 'tu''i''afitu'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '055de096-66a3-11e3-a34b-ff129abc29b7'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tuihaangana', 'TU''IHA''ANGANA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TUIHAANGANA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '055f4030-66a3-11e3-ba34-67cc4549822d', 'tuihaangana', 'TUIHAANGANA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '055f4030-66a3-11e3-ba34-67cc4549822d'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '055f4030-66a3-11e3-a0bd-b758961c2ccd', '055f4030-66a3-11e3-ba34-67cc4549822d', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '055f4030-66a3-11e3-a0bd-b758961c2ccd'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '055f4030-66a3-11e3-ba34-67cc4549822d', '055f4030-66a3-11e3-a0bd-b758961c2ccd', 'tu''iha''angana'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '055f4030-66a3-11e3-ba34-67cc4549822d'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tuihaateiho', 'TU''IHA''ATEIHO', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TUIHAATEIHO' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '056078b0-66a3-11e3-b695-1b40d70405ed', 'tuihaateiho', 'TUIHAATEIHO_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '056078b0-66a3-11e3-b695-1b40d70405ed'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05609fc0-66a3-11e3-8e2c-1b94836f2f45', '056078b0-66a3-11e3-b695-1b40d70405ed', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05609fc0-66a3-11e3-8e2c-1b94836f2f45'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '056078b0-66a3-11e3-b695-1b40d70405ed', '05609fc0-66a3-11e3-8e2c-1b94836f2f45', 'tu''iha''ateiho'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '056078b0-66a3-11e3-b695-1b40d70405ed'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tuilakepa', 'TU''ILAKEPA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TUILAKEPA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '056337da-66a3-11e3-a448-f7e1a9d3396e', 'tuilakepa', 'TUILAKEPA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '056337da-66a3-11e3-a448-f7e1a9d3396e'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05635ef4-66a3-11e3-8121-3be2fd973a21', '056337da-66a3-11e3-a448-f7e1a9d3396e', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05635ef4-66a3-11e3-8121-3be2fd973a21'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '056337da-66a3-11e3-a448-f7e1a9d3396e', '05635ef4-66a3-11e3-8121-3be2fd973a21', 'tu''ilakepa'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '056337da-66a3-11e3-a448-f7e1a9d3396e'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tuipelehake', 'TU''IPELEHAKE', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TUIPELEHAKE' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '056533b4-66a3-11e3-90a6-271d5356947a', 'tuipelehake', 'TUIPELEHAKE_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '056533b4-66a3-11e3-90a6-271d5356947a'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05655ac4-66a3-11e3-a81e-27c810359a25', '056533b4-66a3-11e3-90a6-271d5356947a', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05655ac4-66a3-11e3-a81e-27c810359a25'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '056533b4-66a3-11e3-90a6-271d5356947a', '05655ac4-66a3-11e3-a81e-27c810359a25', 'tu''ipelehake'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '056533b4-66a3-11e3-90a6-271d5356947a'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tuita', 'TUITA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TUITA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0566452e-66a3-11e3-b2da-ab9d6d2352be', 'tuita', 'TUITA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0566452e-66a3-11e3-b2da-ab9d6d2352be'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05666c3e-66a3-11e3-bbf3-4712350ddb97', '0566452e-66a3-11e3-b2da-ab9d6d2352be', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05666c3e-66a3-11e3-bbf3-4712350ddb97'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0566452e-66a3-11e3-b2da-ab9d6d2352be', '05666c3e-66a3-11e3-bbf3-4712350ddb97', 'tuita'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0566452e-66a3-11e3-b2da-ab9d6d2352be'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tuivakano', 'TU''IVAKANO', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TUIVAKANO' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '05672f8e-66a3-11e3-96d9-97925782632a', 'tuivakano', 'TUIVAKANO_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '05672f8e-66a3-11e3-96d9-97925782632a'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '0567569e-66a3-11e3-b449-33429362b517', '05672f8e-66a3-11e3-96d9-97925782632a', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '0567569e-66a3-11e3-b449-33429362b517'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '05672f8e-66a3-11e3-96d9-97925782632a', '0567569e-66a3-11e3-b449-33429362b517', 'tu''ivakano'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '05672f8e-66a3-11e3-96d9-97925782632a'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tungi', 'TUNGI', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TUNGI' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0568680e-66a3-11e3-8299-9b6319925356', 'tungi', 'TUNGI_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0568680e-66a3-11e3-8299-9b6319925356'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '05688f1e-66a3-11e3-9bc0-7fb7e6eab41f', '0568680e-66a3-11e3-8299-9b6319925356', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '05688f1e-66a3-11e3-9bc0-7fb7e6eab41f'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0568680e-66a3-11e3-8299-9b6319925356', '05688f1e-66a3-11e3-9bc0-7fb7e6eab41f', 'tungi'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0568680e-66a3-11e3-8299-9b6319925356'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'tuuhetoka', 'TU''UHETOKA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'TUUHETOKA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0569eeb8-66a3-11e3-b35b-47b6869293fc', 'tuuhetoka', 'TUUHETOKA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0569eeb8-66a3-11e3-b35b-47b6869293fc'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '056a15c8-66a3-11e3-a49c-c717fd8a772e', '0569eeb8-66a3-11e3-b35b-47b6869293fc', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '056a15c8-66a3-11e3-a49c-c717fd8a772e'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0569eeb8-66a3-11e3-b35b-47b6869293fc', '056a15c8-66a3-11e3-a49c-c717fd8a772e', 'tu''uhetoka'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0569eeb8-66a3-11e3-b35b-47b6869293fc'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'ulukalala', '''ULUKALALA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'ULUKALALA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '056a63e8-66a3-11e3-b4c6-db929706275b', 'ulukalala', 'ULUKALALA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '056a63e8-66a3-11e3-b4c6-db929706275b'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '056a63e8-66a3-11e3-a4f3-876e33740057', '056a63e8-66a3-11e3-b4c6-db929706275b', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '056a63e8-66a3-11e3-a4f3-876e33740057'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '056a63e8-66a3-11e3-b4c6-db929706275b', '056a63e8-66a3-11e3-a4f3-876e33740057', '''ulukalala'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '056a63e8-66a3-11e3-b4c6-db929706275b'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'vaea', 'VAEA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'VAEA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '056ab208-66a3-11e3-a83d-4f27c9bfbc46', 'vaea', 'VAEA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '056ab208-66a3-11e3-a83d-4f27c9bfbc46'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '056ad918-66a3-11e3-b3e7-bf679d291f1d', '056ab208-66a3-11e3-a83d-4f27c9bfbc46', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '056ad918-66a3-11e3-b3e7-bf679d291f1d'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '056ab208-66a3-11e3-a83d-4f27c9bfbc46', '056ad918-66a3-11e3-b3e7-bf679d291f1d', 'vaea'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '056ab208-66a3-11e3-a83d-4f27c9bfbc46'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'vahai', 'VAHA''I', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'VAHAI' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '056b2738-66a3-11e3-aa28-bfc1ab51219f', 'vahai', 'VAHAI_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '056b2738-66a3-11e3-aa28-bfc1ab51219f'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '056b2738-66a3-11e3-981c-d3d6e3877fc4', '056b2738-66a3-11e3-aa28-bfc1ab51219f', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '056b2738-66a3-11e3-981c-d3d6e3877fc4'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '056b2738-66a3-11e3-aa28-bfc1ab51219f', '056b2738-66a3-11e3-981c-d3d6e3877fc4', 'vaha''i'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '056b2738-66a3-11e3-aa28-bfc1ab51219f'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'veehala', 'VE''EHALA', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'VEEHALA' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '056bea92-66a3-11e3-9678-af6b2d06609f', 'veehala', 'VEEHALA_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '056bea92-66a3-11e3-9678-af6b2d06609f'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '056c11a2-66a3-11e3-b8fd-7b2bb87a4c13', '056bea92-66a3-11e3-9678-af6b2d06609f', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '056c11a2-66a3-11e3-b8fd-7b2bb87a4c13'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '056bea92-66a3-11e3-9678-af6b2d06609f', '056c11a2-66a3-11e3-b8fd-7b2bb87a4c13', 've''ehala'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '056bea92-66a3-11e3-9678-af6b2d06609f'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'veikune', 'VEIKUNE', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'VEIKUNE' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '056cade2-66a3-11e3-a9b2-438598311448', 'veikune', 'VEIKUNE_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '056cade2-66a3-11e3-a9b2-438598311448'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '056cd4f2-66a3-11e3-bde7-ff525c5c5a22', '056cade2-66a3-11e3-a9b2-438598311448', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '056cd4f2-66a3-11e3-bde7-ff525c5c5a22'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '056cade2-66a3-11e3-a9b2-438598311448', '056cd4f2-66a3-11e3-bde7-ff525c5c5a22', 'veikune'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '056cade2-66a3-11e3-a9b2-438598311448'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'veikune', 'VEIKUNE', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'VEIKUNE' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '0570cca6-66a3-11e3-b3c6-e307aeac25dc', 'veikune', 'VEIKUNE_11', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '0570cca6-66a3-11e3-b3c6-e307aeac25dc'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '0570f3b6-66a3-11e3-b6c6-9f1241958987', '0570cca6-66a3-11e3-b3c6-e307aeac25dc', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '0570f3b6-66a3-11e3-b6c6-9f1241958987'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '0570cca6-66a3-11e3-b3c6-e307aeac25dc', '0570f3b6-66a3-11e3-b6c6-9f1241958987', 'veikune'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '0570cca6-66a3-11e3-b3c6-e307aeac25dc'); 
INSERT INTO administrative.ba_unit (id, name_firstpart, name_lastpart, name, type_code, status_code, change_user)
 SELECT 'crown', 'CROWN', 'Estate', '', 'estateUnit', 'current', 'migration'
 WHERE NOT EXISTS (SELECT id FROM administrative.ba_unit WHERE name_firstpart = 'CROWN' AND name_lastpart = 'Estate');
 INSERT INTO administrative.rrr(id, ba_unit_id, nr, type_code, status_code, is_primary, transaction_id, change_user)
  SELECT '057141d6-66a3-11e3-b11f-ffdb0b3ef762', 'crown', 'CROWN_1', 'ownership', 'current', 'true', 'migration', 'migration'
  WHERE NOT EXISTS (SELECT id FROM administrative.rrr WHERE id = '057141d6-66a3-11e3-b11f-ffdb0b3ef762'); 
  INSERT INTO administrative.rrr_share (id, rrr_id, nominator, denominator)
  SELECT '057168e6-66a3-11e3-97bf-7f9e6d907bfe', '057141d6-66a3-11e3-b11f-ffdb0b3ef762', 1, 1
  WHERE NOT EXISTS (SELECT id from administrative.rrr_share WHERE id = '057168e6-66a3-11e3-97bf-7f9e6d907bfe'); 
  INSERT INTO administrative.party_for_rrr (rrr_id, share_id, party_id)
  SELECT '057141d6-66a3-11e3-b11f-ffdb0b3ef762', '057168e6-66a3-11e3-97bf-7f9e6d907bfe', 'crown'
  WHERE NOT EXISTS (SELECT rrr_id FROM administrative.party_for_rrr WHERE rrr_id = '057141d6-66a3-11e3-b11f-ffdb0b3ef762'); 
  
 INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'ahomee', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'ahomee' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'crown', 'eua', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'crown' AND from_ba_unit_id = 'eua');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'royal estate', 'niuatoputapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'royal estate' AND from_ba_unit_id = 'niuatoputapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuihaateiho', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuihaateiho' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tangipa', 'niuatoputapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tangipa' AND from_ba_unit_id = 'niuatoputapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'royal estate', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'royal estate' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fakafanua', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fakafanua' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'lauaki', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'lauaki' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'malupo', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'malupo' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'crown', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'crown' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fulivai', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fulivai' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'luani', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'luani' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fohe', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fohe' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'lavaka', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'lavaka' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'maafu', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'maafu' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuuhetoka', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuuhetoka' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'heir apparent', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'heir apparent' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'ulukalala', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'ulukalala' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'kalaniuvalu', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'kalaniuvalu' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'nuku', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'nuku' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuihaangana', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuihaangana' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuilakepa', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuilakepa' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuita', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuita' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tungi', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tungi' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fotu', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fotu' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'crown', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'crown' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fakatulolo', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fakatulolo' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'heir apparent', 'eua', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'heir apparent' AND from_ba_unit_id = 'eua');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuihaateiho', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuihaateiho' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'motuapuaka', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'motuapuaka' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuipelehake', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuipelehake' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fielakepa', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fielakepa' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'vahai', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'vahai' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'lauaki', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'lauaki' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'niukapu', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'niukapu' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'royal estate', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'royal estate' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuiafitu', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuiafitu' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuivakano', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuivakano' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'akauola', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'akauola' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fakafanua', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fakafanua' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'afu', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'afu' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuita', 'niuatoputapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuita' AND from_ba_unit_id = 'niuatoputapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'vaea', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'vaea' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fotofili', 'niuatoputapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fotofili' AND from_ba_unit_id = 'niuatoputapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fusitua', 'niuatoputapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fusitua' AND from_ba_unit_id = 'niuatoputapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'motuapuaka', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'motuapuaka' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'royal estate', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'royal estate' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'luani', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'luani' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'ahomee', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'ahomee' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'heir apparent', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'heir apparent' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'veehala', 'eua', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'veehala' AND from_ba_unit_id = 'eua');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'malupo', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'malupo' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'lasike', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'lasike' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'royal estate', 'eua', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'royal estate' AND from_ba_unit_id = 'eua');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'fakafanua', 'haapai', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'fakafanua' AND from_ba_unit_id = 'haapai');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuilakepa', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuilakepa' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'crown', 'niuatoputapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'crown' AND from_ba_unit_id = 'niuatoputapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'maatu', 'niuatoputapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'maatu' AND from_ba_unit_id = 'niuatoputapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'veikune', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'veikune' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'lasike', 'eua', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'lasike' AND from_ba_unit_id = 'eua');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuiafitu', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuiafitu' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'veehala', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'veehala' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'veikune', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'veikune' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuihaateiho', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuihaateiho' AND from_ba_unit_id = 'vavau');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'ata', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'ata' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuipelehake', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuipelehake' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'crown', 'tongatapu', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'crown' AND from_ba_unit_id = 'tongatapu');
INSERT INTO administrative.required_relationship_baunit (to_ba_unit_id, from_ba_unit_id, relation_code, change_user)
 SELECT 'tuipelehake', 'vavau', 'island', 'migration'
 WHERE NOT EXISTS (SELECT from_ba_unit_id FROM administrative.required_relationship_baunit WHERE to_ba_unit_id = 'tuipelehake' AND from_ba_unit_id = 'vavau');

 
 INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055247ae-66a3-11e3-9daf-dbcdedd38707', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055247ae-66a3-11e3-9daf-dbcdedd38707');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tungi', '05697988-66a3-11e3-a128-1b638fc98f6f', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tungi' AND spatial_unit_id = '05697988-66a3-11e3-a128-1b638fc98f6f');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055729c2-66a3-11e3-b25e-6f0a299bd613', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055729c2-66a3-11e3-b25e-6f0a299bd613');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tangipa', '055cf636-66a3-11e3-9636-3bcc353c0f19', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tangipa' AND spatial_unit_id = '055cf636-66a3-11e3-9636-3bcc353c0f19');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fusitua', '05406d18-66a3-11e3-8eee-e7c8e40ae53c', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fusitua' AND spatial_unit_id = '05406d18-66a3-11e3-8eee-e7c8e40ae53c');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'ata', '0538a4d4-66a3-11e3-9099-7b18f14fdf5b', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'ata' AND spatial_unit_id = '0538a4d4-66a3-11e3-9099-7b18f14fdf5b');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055a0ffc-66a3-11e3-a58c-1f9680c05de9', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055a0ffc-66a3-11e3-a58c-1f9680c05de9');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuihaangana', '055fdc70-66a3-11e3-9974-ab834f417e5e', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuihaangana' AND spatial_unit_id = '055fdc70-66a3-11e3-9974-ab834f417e5e');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuipelehake', '05650ca4-66a3-11e3-975d-976ffa218a3b', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuipelehake' AND spatial_unit_id = '05650ca4-66a3-11e3-975d-976ffa218a3b');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '056d4a22-66a3-11e3-aee1-2b8d99cb95ed', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '056d4a22-66a3-11e3-aee1-2b8d99cb95ed');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'heir apparent', '0541f3c2-66a3-11e3-b523-4702bc7500fe', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'heir apparent' AND spatial_unit_id = '0541f3c2-66a3-11e3-b523-4702bc7500fe');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuihaateiho', '05629b9a-66a3-11e3-9102-8bfbd0fa51d2', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuihaateiho' AND spatial_unit_id = '05629b9a-66a3-11e3-9102-8bfbd0fa51d2');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'crown', '05725346-66a3-11e3-9be2-9b501bfd73de', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'crown' AND spatial_unit_id = '05725346-66a3-11e3-9be2-9b501bfd73de');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lauaki', '0548aaa0-66a3-11e3-9b31-0339df3b8823', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lauaki' AND spatial_unit_id = '0548aaa0-66a3-11e3-9b31-0339df3b8823');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'niukapu', '055099f4-66a3-11e3-9789-eb2b7ccab069', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'niukapu' AND spatial_unit_id = '055099f4-66a3-11e3-9789-eb2b7ccab069');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055ad34c-66a3-11e3-97ee-d3e1ca82b8ac', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055ad34c-66a3-11e3-97ee-d3e1ca82b8ac');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '05538038-66a3-11e3-9ed0-4fa19648e036', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '05538038-66a3-11e3-9ed0-4fa19648e036');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'heir apparent', '0543535c-66a3-11e3-b915-17e883ba6442', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'heir apparent' AND spatial_unit_id = '0543535c-66a3-11e3-b915-17e883ba6442');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuiafitu', '055e2ec0-66a3-11e3-b7ea-4bd5d168ebc9', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuiafitu' AND spatial_unit_id = '055e2ec0-66a3-11e3-b7ea-4bd5d168ebc9');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'maatu', '054ddaca-66a3-11e3-9abf-f7ecf2eb8c28', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'maatu' AND spatial_unit_id = '054ddaca-66a3-11e3-9abf-f7ecf2eb8c28');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'crown', '0572c876-66a3-11e3-801b-87d59ed88002', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'crown' AND spatial_unit_id = '0572c876-66a3-11e3-801b-87d59ed88002');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fulivai', '053e9858-66a3-11e3-a24f-e745aefd48bb', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fulivai' AND spatial_unit_id = '053e9858-66a3-11e3-a24f-e745aefd48bb');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '0553f568-66a3-11e3-a3d1-5750111ce275', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '0553f568-66a3-11e3-a3d1-5750111ce275');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'kalaniuvalu', '054416ac-66a3-11e3-a8d9-1b4430786c3d', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'kalaniuvalu' AND spatial_unit_id = '054416ac-66a3-11e3-a8d9-1b4430786c3d');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '056c86d2-66a3-11e3-bdc1-4fdebef996e9', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '056c86d2-66a3-11e3-bdc1-4fdebef996e9');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'kalaniuvalu', '05448bdc-66a3-11e3-8296-9fcf59293fad', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'kalaniuvalu' AND spatial_unit_id = '05448bdc-66a3-11e3-8296-9fcf59293fad');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'maatu', '054e28f4-66a3-11e3-afd2-fb4d6a0090c6', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'maatu' AND spatial_unit_id = '054e28f4-66a3-11e3-afd2-fb4d6a0090c6');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lauaki', '05483566-66a3-11e3-8183-538eb2ea5ccb', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lauaki' AND spatial_unit_id = '05483566-66a3-11e3-8183-538eb2ea5ccb');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '05586242-66a3-11e3-8993-cb963230905a', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '05586242-66a3-11e3-8993-cb963230905a');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '05594cac-66a3-11e3-9709-c37c99bb3fbd', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '05594cac-66a3-11e3-9709-c37c99bb3fbd');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lasike', '0545c45c-66a3-11e3-b842-1fddf9f3560b', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lasike' AND spatial_unit_id = '0545c45c-66a3-11e3-b842-1fddf9f3560b');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuihaateiho', '0560c6da-66a3-11e3-bd47-03320f88a6cb', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuihaateiho' AND spatial_unit_id = '0560c6da-66a3-11e3-bd47-03320f88a6cb');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055c32e6-66a3-11e3-852f-ab90a7491cf5', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055c32e6-66a3-11e3-852f-ab90a7491cf5');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'heir apparent', '05413072-66a3-11e3-b444-477e8ec29f64', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'heir apparent' AND spatial_unit_id = '05413072-66a3-11e3-b444-477e8ec29f64');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '0558d77c-66a3-11e3-8458-9bb11d05bff8', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '0558d77c-66a3-11e3-8458-9bb11d05bff8');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuipelehake', '056581d4-66a3-11e3-86fa-0f679921e670', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuipelehake' AND spatial_unit_id = '056581d4-66a3-11e3-86fa-0f679921e670');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'motuapuaka', '054fd6a4-66a3-11e3-8ae3-0f79cea84bec', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'motuapuaka' AND spatial_unit_id = '054fd6a4-66a3-11e3-8ae3-0f79cea84bec');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '0555ca28-66a3-11e3-bf62-bfa03d8b7fa7', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '0555ca28-66a3-11e3-bf62-bfa03d8b7fa7');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veehala', '056bc382-66a3-11e3-a65f-07be1553f4e6', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veehala' AND spatial_unit_id = '056bc382-66a3-11e3-a65f-07be1553f4e6');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tungi', '05692b68-66a3-11e3-99df-f76d8db4d2d2', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tungi' AND spatial_unit_id = '05692b68-66a3-11e3-99df-f76d8db4d2d2');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuivakano', '05672f8e-66a3-11e3-b9f1-f369d7035a43', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuivakano' AND spatial_unit_id = '05672f8e-66a3-11e3-b9f1-f369d7035a43');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lasike', '05463996-66a3-11e3-88be-571b557597b4', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lasike' AND spatial_unit_id = '05463996-66a3-11e3-88be-571b557597b4');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lavaka', '05491fd0-66a3-11e3-895e-bb54f0ee4764', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lavaka' AND spatial_unit_id = '05491fd0-66a3-11e3-895e-bb54f0ee4764');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fohe', '053bb21e-66a3-11e3-8af8-779f0a77c6e3', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fohe' AND spatial_unit_id = '053bb21e-66a3-11e3-8af8-779f0a77c6e3');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'akauola', '05382f9a-66a3-11e3-9ebe-eb267c74f090', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'akauola' AND spatial_unit_id = '05382f9a-66a3-11e3-9ebe-eb267c74f090');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lasike', '0546fce6-66a3-11e3-9b8a-175839e446eb', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lasike' AND spatial_unit_id = '0546fce6-66a3-11e3-9b8a-175839e446eb');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'nuku', '05515d4e-66a3-11e3-bb68-c32dd71d0d31', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'nuku' AND spatial_unit_id = '05515d4e-66a3-11e3-bb68-c32dd71d0d31');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fotofili', '053c274e-66a3-11e3-9b2e-33a75a68c3e6', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fotofili' AND spatial_unit_id = '053c274e-66a3-11e3-9b2e-33a75a68c3e6');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'maafu', '054c2d1a-66a3-11e3-9ab2-83c629a1ad94', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'maafu' AND spatial_unit_id = '054c2d1a-66a3-11e3-9ab2-83c629a1ad94');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'ulukalala', '056a3cd8-66a3-11e3-a802-1f869999d038', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'ulukalala' AND spatial_unit_id = '056a3cd8-66a3-11e3-a802-1f869999d038');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuiafitu', '055db986-66a3-11e3-ad9a-47043818a863', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuiafitu' AND spatial_unit_id = '055db986-66a3-11e3-ad9a-47043818a863');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lasike', '0546aec6-66a3-11e3-ba3d-ff69248a84f0', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lasike' AND spatial_unit_id = '0546aec6-66a3-11e3-ba3d-ff69248a84f0');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fusitua', '0540bb42-66a3-11e3-9eeb-97f8e71dd8a8', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fusitua' AND spatial_unit_id = '0540bb42-66a3-11e3-9eeb-97f8e71dd8a8');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '056fbb2c-66a3-11e3-8507-372d56ecab9c', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '056fbb2c-66a3-11e3-8507-372d56ecab9c');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '056f6d0c-66a3-11e3-afba-873981863150', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '056f6d0c-66a3-11e3-afba-873981863150');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '05530afe-66a3-11e3-8c2b-4fdf7e5ad965', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '05530afe-66a3-11e3-8c2b-4fdf7e5ad965');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fakafanua', '05396824-66a3-11e3-b5ca-2f721b9005df', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fakafanua' AND spatial_unit_id = '05396824-66a3-11e3-b5ca-2f721b9005df');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tungi', '0568b638-66a3-11e3-8641-77a0b9c7d860', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tungi' AND spatial_unit_id = '0568b638-66a3-11e3-8641-77a0b9c7d860');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'malupo', '054f6174-66a3-11e3-8dbb-7b80500ed30d', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'malupo' AND spatial_unit_id = '054f6174-66a3-11e3-8dbb-7b80500ed30d');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'maafu', '054bb7ea-66a3-11e3-9806-2b0b112ef83b', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'maafu' AND spatial_unit_id = '054bb7ea-66a3-11e3-9806-2b0b112ef83b');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fulivai', '053f0d88-66a3-11e3-8578-af7d69159808', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fulivai' AND spatial_unit_id = '053f0d88-66a3-11e3-8578-af7d69159808');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fotofili', '053d5fce-66a3-11e3-84df-6f75910733e9', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fotofili' AND spatial_unit_id = '053d5fce-66a3-11e3-84df-6f75910733e9');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tangipa', '055d6b66-66a3-11e3-bb56-5fab64b4f7b0', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tangipa' AND spatial_unit_id = '055d6b66-66a3-11e3-bb56-5fab64b4f7b0');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fakatulolo', '053ac7b4-66a3-11e3-bbf4-bf2654c88064', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fakatulolo' AND spatial_unit_id = '053ac7b4-66a3-11e3-bbf4-bf2654c88064');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tungi', '0568dd48-66a3-11e3-ae1a-ab2874965518', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tungi' AND spatial_unit_id = '0568dd48-66a3-11e3-ae1a-ab2874965518');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fakafanua', '0539dd54-66a3-11e3-8634-07bc9b81258b', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fakafanua' AND spatial_unit_id = '0539dd54-66a3-11e3-8634-07bc9b81258b');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fakafanua', '053a5284-66a3-11e3-9fc1-ff5ae9876722', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fakafanua' AND spatial_unit_id = '053a5284-66a3-11e3-9fc1-ff5ae9876722');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '05579ef2-66a3-11e3-86e9-1fe62f9f0ff0', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '05579ef2-66a3-11e3-86e9-1fe62f9f0ff0');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'crown', '05711ac6-66a3-11e3-b93e-47deb59e9264', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'crown' AND spatial_unit_id = '05711ac6-66a3-11e3-b93e-47deb59e9264');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'crown', '05720526-66a3-11e3-9d6c-2f32796dc2e0', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'crown' AND spatial_unit_id = '05720526-66a3-11e3-9d6c-2f32796dc2e0');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'ahomee', '0537935a-66a3-11e3-b355-5ffd22e834f8', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'ahomee' AND spatial_unit_id = '0537935a-66a3-11e3-b355-5ffd22e834f8');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lasike', '05454f2c-66a3-11e3-bee0-b380ca3294e7', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lasike' AND spatial_unit_id = '05454f2c-66a3-11e3-bee0-b380ca3294e7');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '056e82ac-66a3-11e3-b63a-3bd99cf6bd84', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '056e82ac-66a3-11e3-b63a-3bd99cf6bd84');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fulivai', '053f82b8-66a3-11e3-86ba-979298dc1a90', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fulivai' AND spatial_unit_id = '053f82b8-66a3-11e3-86ba-979298dc1a90');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuuhetoka', '0569eeb8-66a3-11e3-8856-177d960a3381', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuuhetoka' AND spatial_unit_id = '0569eeb8-66a3-11e3-8856-177d960a3381');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veehala', '056c38b2-66a3-11e3-97f2-cffbf729476e', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veehala' AND spatial_unit_id = '056c38b2-66a3-11e3-97f2-cffbf729476e');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lasike', '0547e746-66a3-11e3-a773-8f720a6059ce', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lasike' AND spatial_unit_id = '0547e746-66a3-11e3-a773-8f720a6059ce');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'afu', '05334d90-66a3-11e3-aee7-ebbb8297d9f8', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'afu' AND spatial_unit_id = '05334d90-66a3-11e3-aee7-ebbb8297d9f8');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'luani', '054af490-66a3-11e3-8cbb-83296bb43380', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'luani' AND spatial_unit_id = '054af490-66a3-11e3-8cbb-83296bb43380');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuilakepa', '05638604-66a3-11e3-9380-cb5ce130bd51', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuilakepa' AND spatial_unit_id = '05638604-66a3-11e3-9380-cb5ce130bd51');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuilakepa', '05649774-66a3-11e3-a408-e784252db708', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuilakepa' AND spatial_unit_id = '05649774-66a3-11e3-a408-e784252db708');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'vahai', '056b4e48-66a3-11e3-be38-5b9a461ad102', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'vahai' AND spatial_unit_id = '056b4e48-66a3-11e3-be38-5b9a461ad102');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '05546a98-66a3-11e3-8b8a-cb425c0e87db', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '05546a98-66a3-11e3-8b8a-cb425c0e87db');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055295ce-66a3-11e3-8432-47a9b044867d', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055295ce-66a3-11e3-8432-47a9b044867d');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuipelehake', '0565cff4-66a3-11e3-ab2f-03538516f8ea', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuipelehake' AND spatial_unit_id = '0565cff4-66a3-11e3-ab2f-03538516f8ea');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'nuku', '0551d27e-66a3-11e3-9ac0-171910a90444', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'nuku' AND spatial_unit_id = '0551d27e-66a3-11e3-9ac0-171910a90444');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055a852c-66a3-11e3-9506-6f27426dd51d', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055a852c-66a3-11e3-9506-6f27426dd51d');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuilakepa', '056310ca-66a3-11e3-a8f1-9f0e52e202d4', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuilakepa' AND spatial_unit_id = '056310ca-66a3-11e3-a8f1-9f0e52e202d4');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'ata', '05391a04-66a3-11e3-9431-d37f2ddae8c7', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'ata' AND spatial_unit_id = '05391a04-66a3-11e3-9431-d37f2ddae8c7');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'vahai', '056b0028-66a3-11e3-a062-cbb752577a14', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'vahai' AND spatial_unit_id = '056b0028-66a3-11e3-a062-cbb752577a14');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '056cfc02-66a3-11e3-b0f6-f760166b1b58', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '056cfc02-66a3-11e3-b0f6-f760166b1b58');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuiafitu', '055ea3f0-66a3-11e3-be04-d74100bdf05b', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuiafitu' AND spatial_unit_id = '055ea3f0-66a3-11e3-be04-d74100bdf05b');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuihaateiho', '0562266a-66a3-11e3-9a7c-970844fe13df', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuihaateiho' AND spatial_unit_id = '0562266a-66a3-11e3-9a7c-970844fe13df');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '05599acc-66a3-11e3-8ad2-973f869730ec', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '05599acc-66a3-11e3-8ad2-973f869730ec');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuita', '05661e1e-66a3-11e3-97b1-13fa1932c56e', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuita' AND spatial_unit_id = '05661e1e-66a3-11e3-97b1-13fa1932c56e');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'heir apparent', '0542de22-66a3-11e3-ab56-0f8d3e4f5718', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'heir apparent' AND spatial_unit_id = '0542de22-66a3-11e3-ab56-0f8d3e4f5718');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuita', '0566ba5e-66a3-11e3-b869-47f08081141e', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuita' AND spatial_unit_id = '0566ba5e-66a3-11e3-b869-47f08081141e');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'kalaniuvalu', '0543a17c-66a3-11e3-85ce-4bac5f94109c', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'kalaniuvalu' AND spatial_unit_id = '0543a17c-66a3-11e3-85ce-4bac5f94109c');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fotu', '053e4a38-66a3-11e3-b47a-9f007a7f5e6e', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fotu' AND spatial_unit_id = '053e4a38-66a3-11e3-b47a-9f007a7f5e6e');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '05563f62-66a3-11e3-b675-73bfe30a1762', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '05563f62-66a3-11e3-b675-73bfe30a1762');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuihaateiho', '0561b13a-66a3-11e3-aafd-df0e405fdce1', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuihaateiho' AND spatial_unit_id = '0561b13a-66a3-11e3-aafd-df0e405fdce1');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '0554dfc8-66a3-11e3-bcc4-eb245be2c3cd', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '0554dfc8-66a3-11e3-bcc4-eb245be2c3cd');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055554f8-66a3-11e3-a78a-1bb68d98334f', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055554f8-66a3-11e3-a78a-1bb68d98334f');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fotofili', '053cea9e-66a3-11e3-8227-3bf26d0daec2', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fotofili' AND spatial_unit_id = '053cea9e-66a3-11e3-8227-3bf26d0daec2');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lavaka', '05496df0-66a3-11e3-a551-1be1cf2fbe03', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lavaka' AND spatial_unit_id = '05496df0-66a3-11e3-a551-1be1cf2fbe03');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '0570305c-66a3-11e3-bfd3-2fcb7cf536ea', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '0570305c-66a3-11e3-bfd3-2fcb7cf536ea');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuihaangana', '055f1920-66a3-11e3-8d49-576b5b0ec6af', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuihaangana' AND spatial_unit_id = '055f1920-66a3-11e3-8d49-576b5b0ec6af');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '056dbf52-66a3-11e3-b96d-7f305e964f78', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '056dbf52-66a3-11e3-b96d-7f305e964f78');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '056e348c-66a3-11e3-8ce1-cfe447aa22b5', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '056e348c-66a3-11e3-8ce1-cfe447aa22b5');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuita', '05666c3e-66a3-11e3-8bd3-5fa97581840c', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuita' AND spatial_unit_id = '05666c3e-66a3-11e3-8bd3-5fa97581840c');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'maatu', '054d659a-66a3-11e3-8677-db5eda80a31a', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'maatu' AND spatial_unit_id = '054d659a-66a3-11e3-8677-db5eda80a31a');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tungi', '0568680e-66a3-11e3-ac8b-8bc5bb1054a6', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tungi' AND spatial_unit_id = '0568680e-66a3-11e3-ac8b-8bc5bb1054a6');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'luani', '054a7f60-66a3-11e3-841d-db2c6a457628', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'luani' AND spatial_unit_id = '054a7f60-66a3-11e3-841d-db2c6a457628');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'ahomee', '05371e2a-66a3-11e3-8b65-37bd44be44ea', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'ahomee' AND spatial_unit_id = '05371e2a-66a3-11e3-8b65-37bd44be44ea');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'crown', '05718ff6-66a3-11e3-a250-77661fe6456c', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'crown' AND spatial_unit_id = '05718ff6-66a3-11e3-a250-77661fe6456c');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lasike', '05477216-66a3-11e3-894b-fb8fbaa086bd', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lasike' AND spatial_unit_id = '05477216-66a3-11e3-894b-fb8fbaa086bd');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'heir apparent', '0541a5a2-66a3-11e3-afa7-8742e895c10d', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'heir apparent' AND spatial_unit_id = '0541a5a2-66a3-11e3-afa7-8742e895c10d');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fotofili', '053dd4fe-66a3-11e3-86af-1310c468b629', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fotofili' AND spatial_unit_id = '053dd4fe-66a3-11e3-86af-1310c468b629');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'luani', '054b42b0-66a3-11e3-90b0-33cc0f58b279', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'luani' AND spatial_unit_id = '054b42b0-66a3-11e3-90b0-33cc0f58b279');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuivakano', '0567cbce-66a3-11e3-9e00-bb4c930a55f5', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuivakano' AND spatial_unit_id = '0567cbce-66a3-11e3-9e00-bb4c930a55f5');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuilakepa', '05642244-66a3-11e3-b9a2-138b48f7d0ba', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuilakepa' AND spatial_unit_id = '05642244-66a3-11e3-b9a2-138b48f7d0ba');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'motuapuaka', '055024c4-66a3-11e3-b300-dbd112512c03', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'motuapuaka' AND spatial_unit_id = '055024c4-66a3-11e3-b300-dbd112512c03');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '0570a58c-66a3-11e3-b96e-433875b5710d', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '0570a58c-66a3-11e3-b96e-433875b5710d');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fielakepa', '053b3ce4-66a3-11e3-8dba-3f22c0c9e41a', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fielakepa' AND spatial_unit_id = '053b3ce4-66a3-11e3-8dba-3f22c0c9e41a');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'veikune', '056ef7dc-66a3-11e3-8794-37e4417b0549', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'veikune' AND spatial_unit_id = '056ef7dc-66a3-11e3-8794-37e4417b0549');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'nuku', '0550e81e-66a3-11e3-a8b9-cbebf7770b4e', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'nuku' AND spatial_unit_id = '0550e81e-66a3-11e3-a8b9-cbebf7770b4e');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '0556b492-66a3-11e3-a8e5-3faba763afec', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '0556b492-66a3-11e3-a8e5-3faba763afec');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuivakano', '056819ee-66a3-11e3-b4c2-63db63e26890', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuivakano' AND spatial_unit_id = '056819ee-66a3-11e3-b4c2-63db63e26890');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuihaateiho', '05613c0a-66a3-11e3-b423-039c396ada4d', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuihaateiho' AND spatial_unit_id = '05613c0a-66a3-11e3-b423-039c396ada4d');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055b487c-66a3-11e3-96ce-d3feb1c7a12c', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055b487c-66a3-11e3-96ce-d3feb1c7a12c');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'heir apparent', '054268f2-66a3-11e3-993d-b7baeaa2e8c5', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'heir apparent' AND spatial_unit_id = '054268f2-66a3-11e3-993d-b7baeaa2e8c5');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuihaateiho', '056051a0-66a3-11e3-b135-87a412e5e69b', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuihaateiho' AND spatial_unit_id = '056051a0-66a3-11e3-b135-87a412e5e69b');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fusitua', '053ff7e8-66a3-11e3-97d2-fb5cd385dc6b', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fusitua' AND spatial_unit_id = '053ff7e8-66a3-11e3-97d2-fb5cd385dc6b');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'fotofili', '053c756e-66a3-11e3-9231-5f1c76b30a0a', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'fotofili' AND spatial_unit_id = '053c756e-66a3-11e3-9231-5f1c76b30a0a');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'maatu', '054cf06a-66a3-11e3-a151-db606990c1cc', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'maatu' AND spatial_unit_id = '054cf06a-66a3-11e3-a151-db606990c1cc');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'maatu', '054ca24a-66a3-11e3-a508-43d0e5bf7245', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'maatu' AND spatial_unit_id = '054ca24a-66a3-11e3-a508-43d0e5bf7245');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'malupo', '054e9e24-66a3-11e3-831c-33b6284badb9', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'malupo' AND spatial_unit_id = '054e9e24-66a3-11e3-831c-33b6284badb9');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuivakano', '05677dae-66a3-11e3-a883-ab7fc3cd021e', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuivakano' AND spatial_unit_id = '05677dae-66a3-11e3-a883-ab7fc3cd021e');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'vaea', '056a8af8-66a3-11e3-b5e9-cf3f2c80296c', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'vaea' AND spatial_unit_id = '056a8af8-66a3-11e3-b5e9-cf3f2c80296c');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055bbdb6-66a3-11e3-a321-6357c2a75bdd', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055bbdb6-66a3-11e3-a321-6357c2a75bdd');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'malupo', '054eec44-66a3-11e3-9940-27184f0361f2', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'malupo' AND spatial_unit_id = '054eec44-66a3-11e3-9940-27184f0361f2');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '055c8106-66a3-11e3-876c-f70736d9050a', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '055c8106-66a3-11e3-876c-f70736d9050a');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'tuihaangana', '055f6740-66a3-11e3-bda2-7f2a4b93c638', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'tuihaangana' AND spatial_unit_id = '055f6740-66a3-11e3-bda2-7f2a4b93c638');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'lasike', '0545010c-66a3-11e3-b8ae-1bd235b6f001', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'lasike' AND spatial_unit_id = '0545010c-66a3-11e3-b8ae-1bd235b6f001');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'royal estate', '05581422-66a3-11e3-8541-d7792da3c66d', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'royal estate' AND spatial_unit_id = '05581422-66a3-11e3-8541-d7792da3c66d');
INSERT INTO administrative.ba_unit_contains_spatial_unit (ba_unit_id, spatial_unit_id, change_user)
 SELECT 'luani', '054a0a30-66a3-11e3-a2b7-bf2ec7e573a5', 'migration'
 WHERE NOT EXISTS (SELECT ba_unit_id FROM administrative.ba_unit_contains_spatial_unit  WHERE ba_unit_id = 'luani' AND spatial_unit_id = '054a0a30-66a3-11e3-a2b7-bf2ec7e573a5');

  
  

