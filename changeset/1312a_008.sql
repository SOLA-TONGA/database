-- #8 Add new app role to control display of protected fields
INSERT INTO system.approle (code, display_value, status, description)
   SELECT 'ViewProtectedFields', 'Property - View Protected Fields', 'c', 'Allows user to view details of protected fields such as the mortgage amount.'
   WHERE NOT EXISTS (SELECT code FROM system.approle WHERE code = 'ViewProtectedFields');
   
INSERT INTO system.appgroup (id, name, description) VALUES ('protected-id', 'View Protected Fields', 'This group allows selected users to view protected fields ush as the mortgage amount.');

INSERT INTO system.approle_appgroup (approle_code, appgroup_id) VALUES ('ViewProtectedFields','protected-id');