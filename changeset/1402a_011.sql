-- #11 Version Number table
CREATE TABLE system.version
(
  version_num character varying(50) NOT NULL, -- Identifier/name for the setting
  CONSTRAINT version_pkey PRIMARY KEY (version_num)
);

COMMENT ON TABLE system.version
  IS 'Identifies all changesets that have been applied to the SOLA database. The latest changeset applied to the database will indicate the current version of the SOLA database and code. Changesets are named using the year, month and a sequence character. E.g. The first changeset in Feb 2014 is 1402a, the second changeset in Feb 2014 is 1402b, etc. The sequence character must restart for each new month. E.g. in March 2014 the first changeset is 1403a. 
Tags: FLOSS SOLA Extension, System Configuration';
COMMENT ON COLUMN system.version.version_num IS 'The version number for the changeset.';

-- Add the previous changesets into the version table along with the version number for this current changeset (1402a). 
INSERT INTO system.version SELECT '1311a' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1311a');
INSERT INTO system.version SELECT '1312a' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1312a');
INSERT INTO system.version SELECT '1312b' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1312b');
INSERT INTO system.version SELECT '1312c' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1312c');
INSERT INTO system.version SELECT '1402a' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1402a');