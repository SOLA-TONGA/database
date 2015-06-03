-- SQL Script for creating new Drafting table

-- This script may be rerun multiple times so use remove any data the script creates
-- before inserting the data. 
DELETE FROM transaction.transaction WHERE from_service_id IN 
(SELECT id from application.service WHERE  request_type_code IN ('drafting'));
DELETE FROM application.service where request_type_code IN ('drafting');
DELETE FROM application.request_type WHERE code IN ('drafting');
DELETE FROM system.approle WHERE code IN ('drafting', 'DraftingSearch', 'DraftingEdit', 'DraftingRemove');
DELETE FROM system.appuser_appgroup WHERE  appgroup_id IN ( 'drafting-id', 'drafting-remove-id')
AND  appuser_id IN (SELECT id FROM system.appuser WHERE username IN ('andrew', 'semisi')); 
DELETE FROM system.appgroup WHERE id = 'drafting-remove-id'; 

-- Add a new Security Group to manage removal of Drafting items. 
INSERT INTO system.appgroup (id, name, description)
VALUES ('drafting-remove-id', 'Drafting Remove', 'This group allows drafting staff to remove drafting items from the database' ); 

-- Add new Drafting workflow service. display_order of 33 will ensure Drafting
-- service is shown between Survey and Draft Deed services in the Add Services dialog. 
INSERT INTO application.request_type(code, request_category_code, display_value, 
            status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, 
            nr_properties_required, notation_template, rrr_type_code, type_action_code, 
            description, display_order, display_group_name)
    VALUES ('drafting','applicationServices','Drafting::::TONGAN','c',5,0.00,0.00,0.00,0,
	null,null,null,'Service to allow capture of details relevant for Drafting', 33, 'Workflow');
	
-- Add a security role for the drafting service that can be used to control which users can Start the service.
-- the approle.code must match exactly the request_type.code for the service.
INSERT INTO system.approle (code, display_value, status, description)
VALUES ('drafting', 'Service - Drafting', 'c', 'Application Service. Allows the Drafting service to be started.');
   
-- Add the Drafting security Role to the Drafting security Group
INSERT INTO system.approle_appgroup (approle_code, appgroup_id) VALUES ('drafting','drafting-id'); 

-- Add a security role for DraftingSearch to control which users see the Drafting search
INSERT INTO system.approle (code, display_value, status, description)
VALUES ('DraftingSearch', 'Drafting - Drafting Search', 'c', 'Allows users to search for items from the migrated drafting database.');
INSERT INTO system.approle_appgroup (approle_code, appgroup_id) VALUES ('DraftingSearch','drafting-id'); 

-- Add a security role for DraftingEdit to control which users can edit the drafting database.
INSERT INTO system.approle (code, display_value, status, description)
VALUES ('DraftingEdit', 'Drafting - Drafting Edit', 'c', 'Allows users to add and modify items in migrated drafting database.');
INSERT INTO system.approle_appgroup (approle_code, appgroup_id) VALUES ('DraftingEdit','drafting-id'); 

-- Add a security role for DraftingRemove to control which users can remove the drafting records from the database.
INSERT INTO system.approle (code, display_value, status, description)
VALUES ('DraftingRemove', 'Drafting - Drafting Remove', 'c', 'Allows users to remove items from the migrated drafting database.');
INSERT INTO system.approle_appgroup (approle_code, appgroup_id) VALUES ('DraftingRemove','drafting-remove-id'); 

-- Make sure andrew and semisi have the Drafting Security Group so they can test the new functionality. 
INSERT INTO system.appuser_appgroup (appuser_id, appgroup_id) 
SELECT id, 'drafting-id' FROM system.appuser WHERE username IN ('andrew', 'semisi');

INSERT INTO system.appuser_appgroup (appuser_id, appgroup_id) 
SELECT id, 'drafting-remove-id' FROM system.appuser WHERE username IN ('andrew', 'semisi');

-- *** Drop and create the drafting tables
DROP TABLE IF EXISTS application.drafting;
DROP TABLE IF EXISTS application.drafting_historic;

CREATE TABLE application.drafting
(
  id character varying(40) NOT NULL,
  service_id  character varying(40), 
  item_number character varying(40), 
  date_received timestamp without time zone, 
  item_firstname character varying(250),
  item_lastname character varying(250),
  nature_of_survey character varying(100),
  location character varying(250),
  trace_by  character varying(100),
  trace_date timestamp without time zone,
  sent_to character varying(100),
  send_date timestamp without time zone,
  return_date timestamp without time zone,
  draw_deed character varying(100),
  deed_number character varying(100),
  plotting_by character varying(100),
  plotting_date timestamp without time zone,
  plan_number character varying(100),
  refer_info character varying(500),
  comment TEXT,
  rowidentifier character varying(40) NOT NULL DEFAULT uuid_generate_v1(), 
  rowversion integer NOT NULL DEFAULT 0, 
  change_action character(1) NOT NULL DEFAULT 'i'::bpchar, 
  change_user character varying(50), 
  change_time timestamp without time zone NOT NULL DEFAULT now(), 
  CONSTRAINT drafting_pkey PRIMARY KEY (id),
  CONSTRAINT drafting_service_id_fkey FOREIGN KEY (service_id)
      REFERENCES application.service (id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE RESTRICT
)
WITH (
  OIDS=FALSE
);


COMMENT ON TABLE application.drafting
  IS 'Contains data migrated from the Drafting section Item Number database as well as new drafting records created via SOLA Tonga. 
Tags: SOLA Tonga Extension, Change History';
COMMENT ON COLUMN application.drafting.id IS 'Identifier for the draugthing record.';
COMMENT ON COLUMN application.drafting.service_id  IS 'Identifier for the service that created this drafting record. NULL if the record was migrated from the Item Number databse or was created without using a service.';
COMMENT ON COLUMN application.drafting.item_number IS 'The item number from the application';
COMMENT ON COLUMN application.drafting.date_received IS 'The date received at drafting';
COMMENT ON COLUMN application.drafting.item_firstname IS 'The first name of the applicant';
COMMENT ON COLUMN application.drafting.item_lastname IS 'The last name of the applicant';
COMMENT ON COLUMN application.drafting.nature_of_survey IS 'Description of the survey undertaken prior to drafting';
COMMENT ON COLUMN application.drafting.location IS 'The town or island where the land is located';
COMMENT ON COLUMN application.drafting.trace_by  IS 'The name of the tracer';
COMMENT ON COLUMN application.drafting.trace_date IS 'The date of tracing';
COMMENT ON COLUMN application.drafting.sent_to IS 'The person the application was sent to in Survey';
COMMENT ON COLUMN application.drafting.send_date IS 'The date the application was sent to Survey';
COMMENT ON COLUMN application.drafting.return_date IS 'The date the application was returned from survey ready for drafting';
COMMENT ON COLUMN application.drafting.draw_deed IS 'The name of the person that drew the deed';
COMMENT ON COLUMN application.drafting.deed_number IS 'The number for the deed of grant this record relates to';
COMMENT ON COLUMN application.drafting.plotting_by IS 'The name of the plotter';
COMMENT ON COLUMN application.drafting.plotting_date IS 'The date of plotting';
COMMENT ON COLUMN application.drafting.plan_number IS 'The survey plan number';
COMMENT ON COLUMN application.drafting.refer_info IS 'A list of any item numbers referring to this record.';
COMMENT ON COLUMN application.drafting.comment IS 'General comments relating to the record';
COMMENT ON COLUMN application.drafting.rowidentifier IS 'Identifies the all change records for the row in the drafting_historic table';
COMMENT ON COLUMN application.drafting.rowversion IS 'Sequential value indicating the number of times this row has been modified.';
COMMENT ON COLUMN application.drafting.change_action IS 'Indicates if the last data modification action that occurred to the row was insert (i), update (u) or delete (d).';
COMMENT ON COLUMN application.drafting.change_user IS 'The user id of the last person to modify the row.';
COMMENT ON COLUMN application.drafting.change_time IS 'The date and time the row was last modified.';

-- Indexes & Triggers
CREATE INDEX drafting_service_id_idx
  ON application.drafting
  USING btree
  (service_id COLLATE pg_catalog."default");

CREATE INDEX drafting_index_on_rowidentifier
  ON application.drafting
  USING btree
  (rowidentifier COLLATE pg_catalog."default");

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON application.drafting
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();

CREATE TRIGGER __track_history
  AFTER UPDATE OR DELETE
  ON application.drafting
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_history();

CREATE TABLE application.drafting_historic
(
  id character varying(40),
  service_id  character varying(40), 
  item_number character varying(40), 
  date_received timestamp without time zone, 
  item_firstname character varying(250),
  item_lastname character varying(250),
  nature_of_survey character varying(100),
  location character varying(250),
  trace_by  character varying(100),
  trace_date timestamp without time zone,
  sent_to character varying(100),
  send_date timestamp without time zone,
  return_date timestamp without time zone,
  draw_deed character varying(100),
  deed_number character varying(100),
  plotting_by character varying(100),
  plotting_date timestamp without time zone,
  plan_number character varying(100),
  refer_info character varying(500),
  comment TEXT,
  rowidentifier character varying(40), 
  rowversion integer, 
  change_action character(1),
  change_user character varying(50), 
  change_time timestamp without time zone, 
  change_time_valid_until timestamp without time zone NOT NULL DEFAULT now());
