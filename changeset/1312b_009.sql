-- Fix up some of the duplicate towns that reference more than one island (#9)
 DELETE FROM administrative.required_relationship_baunit 
 WHERE to_ba_unit_id = 'bbdb3040-44c4-11e3-8593-875ca87bd276'
 AND from_ba_unit_id = 'tongatapu'; 
 
 DELETE FROM administrative.required_relationship_baunit 
 WHERE to_ba_unit_id = 'bbd7d4d6-44c4-11e3-a72c-13d551afbf49'
 AND from_ba_unit_id = 'vavau'; 

  DELETE FROM administrative.required_relationship_baunit 
 WHERE to_ba_unit_id = 'bbcde99e-44c4-11e3-980f-23bbd9dc06ae'
 AND from_ba_unit_id IN ('tongatapu', 'eua'); 

  DELETE FROM administrative.required_relationship_baunit 
 WHERE to_ba_unit_id = 'bbce10ae-44c4-11e3-83fd-0b727ee3912f'
 AND from_ba_unit_id = 'haapai'; 
