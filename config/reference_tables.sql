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

SET search_path = administrative, pg_catalog;

--
-- Data for Name: ba_unit_rel_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE ba_unit_rel_type DISABLE TRIGGER ALL;

INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('town', 'Town', NULL, 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('estate', 'Estate', NULL, 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('allotment', 'Allotment', NULL, 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('lease', 'Lease', NULL, 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('sublease', 'Sublease', NULL, 'c');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('priorTitle', 'Prior Title', 'Prior Title', 'x');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('rootTitle', 'Root of Title', 'Root of Title', 'x');
INSERT INTO ba_unit_rel_type (code, display_value, description, status) VALUES ('island', 'Island', NULL, 'x');


ALTER TABLE ba_unit_rel_type ENABLE TRIGGER ALL;

--
-- Data for Name: ba_unit_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE ba_unit_type DISABLE TRIGGER ALL;

INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('leasedUnit', 'Lease', NULL, 'c');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('basicPropertyUnit', 'Basic Property Unit::::Unita base Proprieta', 'This is the basic property unit that is used by default', 'x');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('propertyRightUnit', 'Property Right Unit::::Unita Diritto Proprieta', NULL, 'x');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('administrativeUnit', 'Administrative Unit', NULL, 'x');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('estateUnit', 'Estate', NULL, 'c');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('taxUnit', 'Tax Allotment', NULL, 'c');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('townAllotmentUnit', 'Town Allotment', NULL, 'c');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('islandUnit', 'Island', NULL, 'c');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('townUnit', 'Town', NULL, 'c');
INSERT INTO ba_unit_type (code, display_value, description, status) VALUES ('subleaseUnit', 'Sublease', NULL, 'c');


ALTER TABLE ba_unit_type ENABLE TRIGGER ALL;

--
-- Data for Name: condition_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE condition_type DISABLE TRIGGER ALL;

INSERT INTO condition_type (code, display_value, description, status) VALUES ('c1', 'Condition 1', 'Unless the Minister directs otherwise the Lessee shall fence the boundaries of the land within 6 (six) months of the date of the grant and the Lessee shall maintain the fence to the satisfaction of the Commissioner.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c2', 'Condition 2', 'Unless special written authority is given by the Commissioner, the Lessee shall commence development of the land within 5 years of the date of the granting of a lease. This shall also apply to further development of the land held under a lease during the term of the lease.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c3', 'Condition 3', 'Within a period of the time to be fixed by the planning authority, the Lessee shall provide at his own expense main drainage or main sewerage connections from the building erected on the land as the planning authority may require.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c4', 'Condtion 4', 'The Lessee shall use the land comprised in the lease only for the purpose specified in the lease or in any variation made to the original lease.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c5', 'Condition 5', 'Save with the written authority of the planning authority, no electrical power or telephone pole or line or water, drainage or sewer pipe being upon or passing through, over or under the land and no replacement thereof, shall be moved or in any way be interfered with and reasonable access thereto shall be preserved to allow for inspection, maintenance, repair, renewal and replacement.', 'c');
INSERT INTO condition_type (code, display_value, description, status) VALUES ('c6', 'Condition 6', 'The interior and exterior of any building erected on the land and all building additions thereto and all other buildings at any time erected or standing on the land and walls, drains and other appurtenances, shall be kept by the Lessee in good repair and tenantable condition to the satisfaction of the planning authority.', 'c');


ALTER TABLE condition_type ENABLE TRIGGER ALL;

--
-- Data for Name: mortgage_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE mortgage_type DISABLE TRIGGER ALL;

INSERT INTO mortgage_type (code, display_value, description, status) VALUES ('levelPayment', 'Level Payment::::Livello Pagamento', NULL, 'c');
INSERT INTO mortgage_type (code, display_value, description, status) VALUES ('linear', 'Linear::::Lineare', NULL, 'c');
INSERT INTO mortgage_type (code, display_value, description, status) VALUES ('microCredit', 'Micro Credit::::Micro Credito', NULL, 'c');


ALTER TABLE mortgage_type ENABLE TRIGGER ALL;

--
-- Data for Name: rrr_group_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE rrr_group_type DISABLE TRIGGER ALL;

INSERT INTO rrr_group_type (code, display_value, description, status) VALUES ('rights', 'Rights::::Diritti', NULL, 'c');
INSERT INTO rrr_group_type (code, display_value, description, status) VALUES ('restrictions', 'Restrictions::::Restrizioni', NULL, 'c');
INSERT INTO rrr_group_type (code, display_value, description, status) VALUES ('responsibilities', 'Responsibilities::::Responsabilita', NULL, 'x');


ALTER TABLE rrr_group_type ENABLE TRIGGER ALL;

--
-- Data for Name: rrr_type; Type: TABLE DATA; Schema: administrative; Owner: postgres
--

ALTER TABLE rrr_type DISABLE TRIGGER ALL;

INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('agriActivity', 'rights', 'Agriculture Activity::::Attivita Agricola', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('commonOwnership', 'rights', 'Common Ownership::::Proprieta Comune', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('customaryType', 'rights', 'Customary Right::::Diritto Abituale', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('firewood', 'rights', 'Firewood Collection::::Collezione legna da ardere', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('fishing', 'rights', 'Fishing Right::::Diritto di Pesca', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('grazing', 'rights', 'Grazing Right::::Diritto di Pascolo', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('informalOccupation', 'rights', 'Informal Occupation::::Occupazione informale', false, false, false, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('occupation', 'rights', 'Occupation::::Occupazione', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('ownershipAssumed', 'rights', 'Ownership Assumed::::Proprieta Assunta', true, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('superficies', 'rights', 'Superficies::::Superficie', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('tenancy', 'rights', 'Tenancy::::Locazione', true, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('usufruct', 'rights', 'Usufruct::::Usufrutto', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('waterrights', 'rights', 'Water Right::::Servitu di Acqua', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('adminPublicServitude', 'restrictions', 'Administrative Public Servitude::::Servitu  Amministrazione Pubblica', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('monument', 'restrictions', 'Monument::::Monumento', false, true, true, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('noBuilding', 'restrictions', 'Building Restriction::::Restrizione di Costruzione', false, false, false, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('servitude', 'restrictions', 'Servitude::::Servitu', false, false, false, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('monumentMaintenance', 'responsibilities', 'Monument Maintenance::::Mantenimento Monumenti', false, false, false, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('waterwayMaintenance', 'responsibilities', 'Waterway Maintenance::::Mantenimento Acqurdotti', false, false, false, NULL, 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('apartment', 'rights', 'Apartment Ownership::::Proprieta Appartamento', true, true, true, 'Extension to LADM', 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('stateOwnership', 'rights', 'State Ownership::::Proprieta di Stato', true, false, false, 'Extension to LADM', 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('historicPreservation', 'restrictions', 'Historic Preservation::::Conservazione Storica', false, false, false, 'Extension to LADM', 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('limitedAccess', 'restrictions', 'Limited Access (to Road)::::Accesso limitato (su strada)', false, false, false, 'Extension to LADM', 'x');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('mortgage', 'restrictions', 'Mortgage::::Ipoteca', false, true, true, NULL, 'c');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('caveat', 'restrictions', 'Caveat::::Ammonizione', false, true, true, 'Extension to LADM', 'c');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('lease', 'rights', 'Lease::::Affitto', true, true, true, NULL, 'c');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('lifeEstate', 'rights', 'Life Estate::::Patrimonio vita', false, true, true, 'Extension to LADM', 'c');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('ownership', 'rights', 'Landholder', true, true, true, NULL, 'c');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('sublease', 'rights', 'Sublease', true, false, true, 'Indicates the property is subject to sublease', 'c');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('easement', 'rights', 'Easement', false, false, false, 'Indicates the property is subject to an easement as the servient tenement or that the property has been granted rights to an easement over another property as the dominant tenement.', 'c');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('trustee', 'responsibilities', 'Trustee', false, false, true, 'Trustee(s) appointed by the King to act for the lawful successor of an allotment where the successor is a minor (i.e. has not attained the age of 21).', 'c');
INSERT INTO rrr_type (code, rrr_group_type_code, display_value, is_primary, share_check, party_required, description, status) VALUES ('surrender', 'restrictions', 'Surrender', false, false, true, 'Identifies that an allotment has been surrendered in part or whole. The surrendered part of the allotment can only be claimed after it has been surrendered for 12 months.', 'c');


ALTER TABLE rrr_type ENABLE TRIGGER ALL;

SET search_path = application, pg_catalog;

--
-- Data for Name: application_status_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE application_status_type DISABLE TRIGGER ALL;

INSERT INTO application_status_type (code, display_value, status, description) VALUES ('lodged', 'Lodged::::Registrata', 'c', 'Application has been lodged and officially received by land office::::La pratica registrata e formalmente ricevuta da ufficio territoriale');
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('approved', 'Approved::::Approvato', 'c', NULL);
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('annulled', 'Annulled::::Anullato', 'c', NULL);
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('completed', 'Completed::::Completato', 'c', NULL);
INSERT INTO application_status_type (code, display_value, status, description) VALUES ('requisitioned', 'On Hold', 'c', NULL);


ALTER TABLE application_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: application_action_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE application_action_type DISABLE TRIGGER ALL;

INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('lodge', 'Lodgement Notice Prepared::::Ricevuta della Registrazione Preparata', 'lodged', 'c', 'Lodgement notice is prepared (action is automatically logged when application details are saved for the first time::::La ricevuta della registrazione pronta');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('addDocument', 'Add document::::Documenti scannerizzati allegati alla pratica', NULL, 'c', 'Scanned Documents linked to Application (action is automatically logged when a new document is saved)::::Documenti scannerizzati allegati alla pratica');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('withdraw', 'Withdraw application::::Pratica Ritirata', 'annulled', 'c', 'Application withdrawn by Applicant (action is manually logged)::::Pratica Ritirata dal Richiedente');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('cancel', 'Cancel application::::Pratica cancellata', 'annulled', 'c', 'Application cancelled by Land Office (action is automatically logged when application is cancelled)::::Pratica cancellata da Ufficio Territoriale');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('requisition', 'Requisition:::Ulteriori Informazioni domandate dal richiedente', 'requisitioned', 'c', 'Further information requested from applicant (action is manually logged)::::Ulteriori Informazioni domandate dal richiedente');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('validateFailed', 'Quality Check Fails::::Controllo Qualita Fallito', NULL, 'c', 'Quality check fails (automatically logged when a critical business rule failure occurs)::::Controllo Qualita Fallito');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('validatePassed', 'Quality Check Passes::::Controllo Qualita Superato', NULL, 'c', 'Quality check passes (automatically logged when business rules are run without any critical failures)::::Controllo Qualita Superato');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('approve', 'Approve::::Approvata', 'approved', 'c', 'Application is approved (automatically logged when application is approved successively)::::Pratica approvata');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('archive', 'Archive::::Archiviata', 'completed', 'c', 'Paper application records are archived (action is manually logged)::::I fogli della pratica sono stati archiviati');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('dispatch', 'Dispatch::::Inviata', NULL, 'c', 'Application documents and new land office products are sent or collected by applicant (action is manually logged)::::I documenti della pratica e i nuovi prodotti da Ufficio Territoriale sono stati spediti o ritirati dal richiedente');
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('lapse', 'Lapse::::Decadimento', 'annulled', 'c', NULL);
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('assign', 'Assign::::Assegna', NULL, 'c', NULL);
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('unAssign', 'Unassign::::Dealloca', NULL, 'c', NULL);
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('resubmit', 'Resubmit::::Reinvia', 'lodged', 'c', NULL);
INSERT INTO application_action_type (code, display_value, status_to_set, status, description) VALUES ('validate', 'Validate::::Convalida', NULL, 'c', 'The action validate does not leave a mark, because validateFailed and validateSucceded will be used instead when the validate is completed.');


ALTER TABLE application_action_type ENABLE TRIGGER ALL;

--
-- Data for Name: checklist_group; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE checklist_group DISABLE TRIGGER ALL;

INSERT INTO checklist_group (code, display_value, description, status) VALUES ('agricultural', 'Agricultural', 'Land used for farming and raising livestock.', 'c');
INSERT INTO checklist_group (code, display_value, description, status) VALUES ('residential', 'Residential', 'Land used for residence.', 'c');
INSERT INTO checklist_group (code, display_value, description, status) VALUES ('commercial', 'Commercial', 'Land or buildings used to generate a profit.', 'c');
INSERT INTO checklist_group (code, display_value, description, status) VALUES ('government', 'Government Ministries', 'Land used by Government Ministries.', 'c');


ALTER TABLE checklist_group ENABLE TRIGGER ALL;

--
-- Data for Name: checklist_item; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE checklist_item DISABLE TRIGGER ALL;

INSERT INTO checklist_item (code, display_value, description, status) VALUES ('contact', 'Contact Detail', 'Telephone, Mobile, Residential Address, Mailing Address, Email', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('id', 'Identification', 'National Identification Card, Passport, Driver License', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('powerOfAttorney', 'Power of Attorney', 'If person other than the Landowner', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('businessName', 'Business Registration and Business Name', 'Registered Business', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('businessLicense', 'Business License', 'License of the Registered Business', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('foreignInvestment', 'Foreign Investment', 'Foreign Investment', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('businessPlan', 'Business Plan', 'Business plan for commercial applications only', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('fund', 'Proof of Funds', 'Letter from Bank, Bank Statements, etc.', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('existingLease', 'Existing Leases', 'Natural Name and Business', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('permit', 'Permit to Hold, Reside or Occupy Land', 'Permit to Hold, Reside or Occupy Land', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('termAndCondition', 'Terms and Conditions of Lease or Supplementary agreements (if any)', 'Terms and Conditions Agreement', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('environmentImpact', 'Environment Impact Assessment', 'Impact of Application on Enviroment', 'c');
INSERT INTO checklist_item (code, display_value, description, status) VALUES ('visa', 'Visa (Foreigners only)', 'Resident, Work Visa, Business Visa, etc. This only applies to Foreigners', 'c');


ALTER TABLE checklist_item ENABLE TRIGGER ALL;

--
-- Data for Name: checklist_item_in_group; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE checklist_item_in_group DISABLE TRIGGER ALL;

INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('agricultural', 'contact');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('agricultural', 'id');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('agricultural', 'powerOfAttorney');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('agricultural', 'fund');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('agricultural', 'existingLease');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('agricultural', 'permit');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('agricultural', 'termAndCondition');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('agricultural', 'environmentImpact');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('agricultural', 'visa');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('government', 'contact');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('government', 'existingLease');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('government', 'termAndCondition');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('government', 'environmentImpact');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('residential', 'contact');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('residential', 'id');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('residential', 'powerOfAttorney');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('residential', 'existingLease');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('residential', 'permit');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('residential', 'termAndCondition');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('residential', 'environmentImpact');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('residential', 'visa');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'contact');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'id');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'powerOfAttorney');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'businessName');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'businessLicense');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'foreignInvestment');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'businessPlan');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'fund');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'existingLease');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'permit');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'termAndCondition');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'environmentImpact');
INSERT INTO checklist_item_in_group (checklist_group_code, checklist_item_code) VALUES ('commercial', 'visa');


ALTER TABLE checklist_item_in_group ENABLE TRIGGER ALL;

--
-- Data for Name: request_category_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE request_category_type DISABLE TRIGGER ALL;

INSERT INTO request_category_type (code, display_value, description, status) VALUES ('registrationServices', 'Registration Services::::Servizi di Registrazione', NULL, 'c');
INSERT INTO request_category_type (code, display_value, description, status) VALUES ('informationServices', 'Information Services::::Servizi Informativi', NULL, 'c');
INSERT INTO request_category_type (code, display_value, description, status) VALUES ('applicationServices', 'Application Services', 'Services used to support application processing', 'c');
INSERT INTO request_category_type (code, display_value, description, status) VALUES ('docRegServices', 'Document Registration Services', 'Services used to support document registration processing', 'c');


ALTER TABLE request_category_type ENABLE TRIGGER ALL;

--
-- Data for Name: type_action; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE type_action DISABLE TRIGGER ALL;

INSERT INTO type_action (code, display_value, description, status) VALUES ('new', 'New::::Nuovo', NULL, 'c');
INSERT INTO type_action (code, display_value, description, status) VALUES ('vary', 'Vary::::Variazione', NULL, 'c');
INSERT INTO type_action (code, display_value, description, status) VALUES ('cancel', 'Cancel::::Cancellazione', NULL, 'c');


ALTER TABLE type_action ENABLE TRIGGER ALL;

--
-- Data for Name: request_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE request_type DISABLE TRIGGER ALL;

INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('documentCopy', 'informationServices', 'Document Copy::::Copia Documento', NULL, 'x', 1, 0.50, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('newFreehold', 'registrationServices', 'New Freehold Title::::Nuovo Titolo', NULL, 'x', 5, 5.00, 0.00, 0.00, 1, 'Fee Simple Estate', NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('serviceEnquiry', 'informationServices', 'Service Enquiry::::Richiesta Servizio', NULL, 'x', 1, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('regnDeeds', 'registrationServices', 'Deed Registration::::Registrazione Atto', NULL, 'x', 3, 1.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('varyMortgage', 'registrationServices', 'Variation of Mortgage::::TONGAN', 'Can be used to change the amount, interest rate or the term of the mortgage', 'c', 5, 23.00, 0.00, 0.00, 1, 'Variation of mortgage', 'mortgage', 'vary', 'Mortgage', 205);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('regnOnTitle', 'registrationServices', 'Registration on Title::::Registrazione di Titolo', NULL, 'x', 5, 5.00, 0.00, 0.01, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('regnStandardDocument', 'registrationServices', 'Registration of Standard Document::::Documento di Documento Standard', NULL, 'x', 3, 5.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('titleSearch', 'informationServices', 'Title Search::::Ricerca Titolo', NULL, 'x', 1, 5.00, 0.00, 0.00, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('surveyPlanCopy', 'informationServices', 'Survey Plan Copy::::Copia Piano Perizia', NULL, 'x', 1, 1.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cadastrePrint', 'informationServices', 'Cadastre Print::::Stampa Catastale', NULL, 'x', 1, 0.50, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cadastreExport', 'informationServices', 'Cadastre Export::::Export Catastale', NULL, 'x', 1, 0.00, 0.10, 0.00, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cadastreBulk', 'informationServices', 'Cadastre Bulk Export::::Export Carico Catastale', NULL, 'x', 5, 5.00, 0.10, 0.00, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('noteOccupation', 'registrationServices', 'Occupation Noted::::Nota occupazione', NULL, 'x', 5, 5.00, 0.00, 0.01, 1, 'Occupation by <name> recorded', NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('newOwnership', 'registrationServices', 'Change of Ownership::::Cambio proprieta', NULL, 'x', 5, 5.00, 0.00, 0.02, 1, 'Transfer to <name>', 'ownership', 'vary', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('usufruct', 'registrationServices', 'Register Usufruct::::Registrazione usufrutto', NULL, 'x', 5, 5.00, 0.00, 0.00, 1, '<usufruct> right granted to <name>', 'usufruct', 'new', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('waterRights', 'registrationServices', 'Register Water Rights::::Registrazione diritti di acqua''', NULL, 'x', 5, 5.00, 0.01, 0.00, 1, 'Water Rights granted to <name>', 'waterrights', 'new', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('buildingRestriction', 'registrationServices', 'Register Building Restriction::::Registrazione restrizioni edificabilita', NULL, 'x', 5, 5.00, 0.00, 0.00, 1, 'Building Restriction', 'noBuilding', 'new', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('servitude', 'registrationServices', 'Register Servitude::::registrazione servitu', NULL, 'x', 5, 5.00, 0.00, 0.00, 1, 'Servitude over <parcel1> in favour of <parcel2>', 'servitude', 'new', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('newApartment', 'registrationServices', 'New Apartment Title::::Nuovo Titolo', NULL, 'x', 5, 5.00, 0.00, 0.02, 1, 'Apartment Estate', 'apartment', 'new', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('newState', 'registrationServices', 'New State Title::::Nuovo Titolo', NULL, 'x', 5, 0.00, 0.00, 0.00, 1, 'State Estate', NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('historicOrder', 'registrationServices', 'Register Historic Preservation Order::::Registrazione ordine storico di precedenze', NULL, 'x', 5, 5.00, 0.00, 0.00, 1, 'Historic Preservation Order', 'noBuilding', 'new', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('limitedRoadAccess', 'registrationServices', 'Register Limited Road Access::::registrazione limitazione accesso stradale', NULL, 'x', 5, 5.00, 0.00, 0.00, 1, 'Limited Road Access', 'limitedAccess', NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('varyRight', 'registrationServices', 'Vary Right (General)::::Modifica diritto (generico)', NULL, 'x', 5, 5.00, 0.00, 0.00, 1, 'Variation of <right> <reference>', NULL, 'vary', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('removeRight', 'registrationServices', 'Remove Right (General)::::Rimozione diritto (generico)', NULL, 'x', 5, 5.00, 0.00, 0.00, 1, '<right> <reference> cancelled', NULL, 'cancel', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('newDigitalTitle', 'registrationServices', 'Convert to Digital Title::::Nuovo Titolo Digitale', NULL, 'x', 5, 0.00, 0.00, 0.00, 1, 'Title converted to digital format', NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('newDigitalProperty', 'registrationServices', 'New Digital Property::::Nuova Proprieta Digitale', NULL, 'x', 5, 0.00, 0.00, 0.00, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cancelProperty', 'registrationServices', 'Cancel title::::Cancella prioprieta', NULL, 'x', 5, 5.00, 0.00, 0.00, 1, '', NULL, 'cancel', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cnclStandardDocument', 'registrationServices', 'Withdraw Standard Document', 'To withdraw from use any standard document (such as standard mortgage or standard lease)', 'x', 1, 5.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('systematicRegn', 'registrationServices', 'Systematic Registration Claim::::Registrazione Sistematica', NULL, 'x', 90, 50.00, 0.00, 0.00, 1, 'Title issued at completion of systematic registration', 'ownership', 'new', NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('lodgeObjection', 'registrationServices', 'Lodge Objection::::Obiezioni', NULL, 'x', 90, 5.00, 0.00, 0.00, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('checklist', 'applicationServices', 'Checklist::::TONGAN', 'Checklist Service applicable for different types of applications', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 5);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('siteInspection', 'applicationServices', 'Site Inspection::::TONGAN', 'Indicates the application will require a site inspection', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 10);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('ministerBriefing', 'applicationServices', 'Ministerial Briefing Preparation::::TONGAN', 'Preparing the briefing for the Minister of Lands to gain approval for the application', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 15);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('hodReview', 'applicationServices', 'Head of Division Review::::TONGAN', 'Review of the documentation prepared for the Ministerial Briefing', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 17);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('ministerDecision', 'applicationServices', 'Ministerial Decision::::TONGAN', 'Captures the decision by the minister as to whether to proceed with the transaction or not.', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 18);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cabinetSubmission', 'applicationServices', 'Cabinet Submission::::TONGAN', 'Submission to cabinet for thier approval of the application. Includes notifying application
	of the cabinet decision', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 20);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('itemNumber', 'applicationServices', 'Issue Item Number::::TONGAN', 'Issues an item number to track teh application as is progresses through the Mapping and Survey 
	department.', 'c', 2, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 25);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('survey', 'applicationServices', 'Survey::::TONGAN', 'Ministry to conduct survey of the lease or allotment area', 'c', 90, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 30);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('draftDeed', 'applicationServices', 'Draft Deed::::TONGAN', 'Draft Deed of Grant or Deed of Lease including a diagram of the allotment or lease', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 35);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('varyLease', 'registrationServices', 'Transfer Lease::::TONGAN', 'Transfer lease details', 'c', 5, 14.00, 0.00, 0.00, 1, 'Transfer lease of nn years to <name>', 'lease', 'vary', 'Lease', 105);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('mortgage', 'registrationServices', 'Register Mortgage::::TONGAN', 'Register new mortgage details', 'c', 5, 23.00, 0.00, 0.00, 1, 'Mortgage to <lender>', 'mortgage', 'new', 'Mortgage', 200);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('removeRestriction', 'registrationServices', 'Discharge of Mortgage::::TONGAN', 'Discharge of mortgage', 'c', 5, 10.50, 0.00, 0.00, 1, 'Discharge', 'mortgage', 'cancel', 'Mortgage', 210);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('caveat', 'registrationServices', 'Register Caveat', 'Register new caveat on lease or sublease', 'c', 5, 0.00, 0.00, 0.00, 1, 'Caveat in the name of <name>', 'caveat', 'new', 'Other', 400);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('varyCaveat', 'registrationServices', 'Variation to Caveat', 'Record a variation to a caveat.', 'c', 5, 0.00, 0.00, 0.00, 1, '<Caveat> <reference>', 'caveat', 'vary', 'Other', 405);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('removeCaveat', 'registrationServices', 'Remove Caveat', 'Remove a caveat.', 'c', 5, 0.00, 0.00, 0.00, 1, 'Caveat <reference> removed', 'caveat', 'cancel', 'Other', 410);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('regnPowerOfAttorney', 'docRegServices', 'Register Power of Attorney', 'Register Power of Attorney', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Permits and Power of Attorney', 520);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cnclPowerOfAttorney', 'docRegServices', 'Cancel Power of Attorney', 'Cancel Power of Attorney', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, 'cancel', 'Permits and Power of Attorney', 525);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('signDeed', 'applicationServices', 'Sign Deed::::TONGAN', 'Organise individuals to attend and sign the lease with the minister and initial payment
	of registration fee and annual rental', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 40);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('taxapi', 'registrationServices', 'Register Tax Alloment::::TONGAN', 'Used to register a new tax ''api.', 'c', 5, 7.00, 0.00, 0.00, 0, 'Register allotment to <name>', 'ownership', 'new', 'Allotment', 300);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('townapi', 'registrationServices', 'Register Town Allotment::::TONGAN', 'Used to register a new town ''api.', 'c', 5, 3.50, 0.00, 0.00, 0, 'Register allotment to <name>', 'ownership', 'new', 'Allotment', 305);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('apiSurrender', 'registrationServices', 'Surrender Allotment::::TONGAN', 'Used to surrender all or part of an allotment', 'c', 5, 0.00, 0.00, 0.00, 0, 'Surrender allotment to <name>', 'surrender', 'new', 'Allotment', 310);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('apiExchange', 'registrationServices', 'Transfer Allotment - Exchange::::TONGAN', 'Used to transfer an ''api to another person due to an exchange of land', 'c', 5, 0.00, 0.00, 0.00, 0, 'Exchange allotment with <name>', 'ownership', 'vary', 'Allotment', 315);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('apiEjectment', 'registrationServices', 'Transfer Allotment - Ejectment::::TONGAN', 'Used to transfer an ''api to the estate holder as a result of ejectment', 'c', 5, 0.00, 0.00, 0.00, 0, 'Transfered because of ejectment', 'ownership', 'vary', 'Allotment', 320);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cancelApi', 'registrationServices', 'Cancel Allotment::::TONGAN', 'Used to cancel an ''Api. Used when an ''Api is subdivided or destroyed', 'c', 5, 0.00, 0.00, 0.00, 0, 'Cancelled', NULL, 'cancel', 'Allotment', 325);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('registerLease', 'registrationServices', 'Register Lease::::TONGAN', 'Register the new lease details', 'c', 5, 21.00, 0.00, 0.00, 1, 'Lease of nn years to <name>', NULL, NULL, 'Lease', 100);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('leaseInPossession', 'registrationServices', 'Transfer Lease - Mortgagee in Possession::::TONGAN', 'Used to to transfer a lease to the bank or a new mortgagor in the case where the original mortgagor is in default', 'c', 5, 14.00, 0.00, 0.00, 0, 'Mortgagee in possession', 'lease', 'vary', 'Lease', 110);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('leaseProbate', 'registrationServices', 'Transfer Lease - Probate::::TONGAN', 'Used to to transfer a lease to new lessee(s) under probate.', 'c', 5, 14.00, 0.00, 0.00, 0, 'Probate', 'lease', 'vary', 'Lease', 115);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('leaseDocument', 'registrationServices', 'Register Document Affecting Leasehold Title::::TONGAN', 'Used to register a document affecting a Lease', 'c', 5, 1.80, 0.00, 0.00, 0, 'Register document', 'lease', 'vary', 'Lease', 120);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('renewLease', 'registrationServices', 'Variation of Lease::::TONGAN', 'Renew or vary lease', 'c', 5, 0.00, 0.00, 0.00, 0, 'Renew or vary', 'lease', 'vary', 'Lease', 125);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('surrenderLease', 'registrationServices', 'Surrender Lease::::TONGAN', 'Surrender lease', 'c', 5, 0.00, 0.00, 0.00, 0, 'Surrender', NULL, 'cancel', 'Lease', 130);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('terminateLease', 'registrationServices', 'Terminate Lease::::TONGAN', 'Terminate lease', 'c', 5, 0.00, 0.00, 0.00, 0, 'Termination', NULL, 'cancel', 'Lease', 135);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('registerSublease', 'registrationServices', 'Register Sublease::::TONGAN', 'Register new sublease details', 'c', 5, 10.50, 0.00, 0.00, 0, 'Sublease of nn years to <name>', 'sublease', 'new', 'Sublease', 150);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('varySublease', 'registrationServices', 'Variation of Sublease::::TONGAN', 'Variation of sublease', 'c', 5, 7.00, 0.00, 0.00, 0, 'Variation', 'sublease', 'vary', 'Sublease', 153);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('transferSublease', 'registrationServices', 'Transfer Sublease::::TONGAN', 'Transfer sublease', 'c', 5, 7.00, 0.00, 0.00, 0, 'Transfer sublease of nn years to <name>', 'sublease', 'vary', 'Sublease', 155);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('subleaseInPossession', 'registrationServices', 'Transfer Sublease - Mortgagee in Possession::::TONGAN', 'Used to to transfer a sublease to the bank or a new mortgagor in the case where the original mortgagor is in default', 'c', 5, 7.00, 0.00, 0.00, 0, 'Mortgagee in possession', 'sublease', 'vary', 'Sublease', 160);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('subleaseProbate', 'registrationServices', 'Transfer Sublease - Probate::::TONGAN', 'Used to to transfer a sublease to new lessee(s) under probate.', 'c', 5, 7.00, 0.00, 0.00, 0, 'Probate', 'sublease', 'vary', 'Sublease', 165);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('surrenderSublease', 'registrationServices', 'Surrender Sublease::::TONGAN', 'Surrender sublease', 'c', 5, 0.00, 0.00, 0.00, 0, 'Surrender', NULL, 'cancel', 'Sublease', 170);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('terminateSublease', 'registrationServices', 'Terminate Sublease::::TONGAN', 'Terminate sublease', 'c', 5, 0.00, 0.00, 0.00, 0, 'Termination', NULL, 'cancel', 'Sublease', 175);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('assignMortgage', 'registrationServices', 'Assign Mortgage::::TONGAN', 'Can be used to assign (i.e. transfer) the mortgage to a new mortgagee.', 'c', 5, 0.00, 0.00, 0.00, 0, 'Assign mortgage to <lender>', 'mortgage', 'vary', 'Mortgage', 215);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('mortgageDocument', 'registrationServices', 'Register Document Affecting a Mortgage::::TONGAN', 'Used to register a document affecting a Mortgage', 'c', 5, 2.00, 0.00, 0.00, 0, 'Register document', 'mortgage', 'vary', 'Mortgage', 220);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('lifeEstate', 'registrationServices', 'Register Life Estate', 'Register new life estate on an allotment', 'c', 5, 0.00, 0.00, 0.00, 1, 'Life Estate for <name1> with Remainder Estate in <name2, name3>', 'lifeEstate', 'new', 'Other', 415);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('varyLifeEstate', 'registrationServices', 'Variation of Life Estate::::TONGAN', 'Used to change the details of a life estate', 'c', 5, 0.00, 0.00, 0.00, 0, 'Life estate', 'lifeEstate', 'vary', 'Other', 420);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('removeLifeEstate', 'registrationServices', 'Remove Life Estate::::TONGAN', 'Used to remove a life estate from an allotment', 'c', 5, 0.00, 0.00, 0.00, 0, 'Life estate', 'lifeEstate', 'cancel', 'Other', 425);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('easement', 'registrationServices', 'Register Easement::::TONGAN', 'Register easement', 'c', 5, 0.00, 0.00, 0.00, 1, 'Servient <easement type> over <parcel1> in favour of <parcel2> / Dominant <easement type>
	in favour of <parcel1> over <parcel2>', 'easement', 'new', 'Other', 430);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('varyEasement', 'registrationServices', 'Variation of Easement::::TONGAN', 'Change easement', 'c', 5, 0.00, 0.00, 0.00, 1, 'Easement <reference> changed', 'easement', 'vary', 'Other', 432);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('removeEasement', 'registrationServices', 'Cancel Easement::::TONGAN', 'Cancel easement', 'c', 5, 0.00, 0.00, 0.00, 1, 'Easement <reference> cancelled', 'easement', 'cancel', 'Other', 435);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('trustee', 'registrationServices', 'Register Trustee::::TONGAN', 'Register trustee', 'c', 5, 0.00, 0.00, 0.00, 1, 'Trustee <name>', 'trustee', 'new', 'Other', 440);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('varyTrustee', 'registrationServices', 'Variation to Trustee::::TONGAN', 'Change trustee', 'c', 5, 0.00, 0.00, 0.00, 1, 'Trustee <name> changed', 'trustee', 'vary', 'Other', 445);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('removeTrustee', 'registrationServices', 'Cancel Trustee::::TONGAN', 'Cancel/remove trustee from property', 'c', 5, 0.00, 0.00, 0.00, 1, 'Trustee <name> cancelled', 'trustee', 'cancel', 'Other', 450);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('permit', 'docRegServices', 'Register Permit::::TONGAN', 'Registration of permit for occupation by alien(s), removal of Sand, etc.', 'c', 5, 21.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Permits and Power of Attorney', 510);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cancelPermit', 'docRegServices', 'Cancel Permit::::TONGAN', 'Cancellation of permit for occupation by alien(s), removal of Sand, etc.', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Permits and Power of Attorney', 515);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('correctRegistry', 'registrationServices', 'Correct Registry::::TONGAN', 'Allows corrections to the registered information to be made.', 'c', 1, 2.00, 0.00, 0.00, 0, 'Registry Correction', NULL, NULL, 'Corrections', 600);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('correctRegistryRem', 'registrationServices', 'Correct Registry (Remove Right)::::TONGAN', 'Allows corrections to the registered information to be made by removing rights.', 'c', 1, 2.00, 0.00, 0.00, 0, 'Registry Correction', NULL, 'cancel', 'Corrections', 605);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('drafting', 'applicationServices', 'Drafting::::TONGAN', 'Service to allow capture of details relevant for Drafting', 'c', 5, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, 'Workflow', 33);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('cadastreChange', 'registrationServices', 'Change to Cadastre::::Cambio del Catasto', NULL, 'c', 30, 25.00, 0.10, 0.00, 1, NULL, NULL, NULL, 'Cadastral', 700);
INSERT INTO request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, display_group_name, display_order) VALUES ('redefineCadastre', 'registrationServices', 'Redefine Cadastre::::Redefinizione catasto', NULL, 'c', 30, 25.00, 0.10, 0.00, 1, NULL, NULL, NULL, 'Cadastral', 705);


ALTER TABLE request_type ENABLE TRIGGER ALL;

--
-- Data for Name: service_status_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE service_status_type DISABLE TRIGGER ALL;

INSERT INTO service_status_type (code, display_value, status, description) VALUES ('lodged', 'Lodged::::Registrata', 'c', 'Application for a service has been lodged and officially received by land office::::La pratica per un servizio, registrata e formalmente ricevuta da ufficio territoriale');
INSERT INTO service_status_type (code, display_value, status, description) VALUES ('completed', 'Completed::::Completata', 'c', NULL);
INSERT INTO service_status_type (code, display_value, status, description) VALUES ('pending', 'Pending::::Pendente', 'c', NULL);
INSERT INTO service_status_type (code, display_value, status, description) VALUES ('cancelled', 'Cancelled::::Cancellato', 'c', NULL);


ALTER TABLE service_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: service_action_type; Type: TABLE DATA; Schema: application; Owner: postgres
--

ALTER TABLE service_action_type DISABLE TRIGGER ALL;

INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('lodge', 'Lodge::::Registrata', 'lodged', 'c', 'Application for service(s) is officially received by land office (action is automatically logged when application is saved for the first time)::::La pratica per i servizi formalmente ricevuta da ufficio territoriale');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('start', 'Start::::Comincia', 'pending', 'c', 'Provisional RRR Changes Made to Database as a result of application (action is automatically logged when a change is made to a rrr object)::::Apportate Modifiche Provvisorie di tipo RRR al Database come risultato della pratica');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('cancel', 'Cancel::::Cancella la pratica', 'cancelled', 'c', 'Service is cancelled by Land Office (action is automatically logged when a service is cancelled)::::Pratica cancellata da Ufficio Territoriale');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('complete', 'Complete::::Completa', 'completed', 'c', 'Application is ready for approval (action is automatically logged when service is marked as complete::::Pratica pronta per approvazione');
INSERT INTO service_action_type (code, display_value, status_to_set, status, description) VALUES ('revert', 'Revert::::Ripristino', 'pending', 'c', 'The status of the service has been reverted to pending from being completed (action is automatically logged when a service is reverted back for further work)::::Lo stato del servizio riportato da completato a pendente (azione automaticamente registrata quando un servizio viene reinviato per ulteriori adempimenti)');


ALTER TABLE service_action_type ENABLE TRIGGER ALL;

SET search_path = cadastre, pg_catalog;

--
-- Data for Name: area_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE area_type DISABLE TRIGGER ALL;

INSERT INTO area_type (code, display_value, description, status) VALUES ('calculatedArea', 'Calculated Area::::Area calcolata', NULL, 'c');
INSERT INTO area_type (code, display_value, description, status) VALUES ('nonOfficialArea', 'Non-official Area::::Area Non ufficiale', NULL, 'c');
INSERT INTO area_type (code, display_value, description, status) VALUES ('officialArea', 'Official Area::::Area Ufficiale', NULL, 'c');
INSERT INTO area_type (code, display_value, description, status) VALUES ('surveyedArea', 'Surveyed Area::::Area Sorvegliata', NULL, 'c');


ALTER TABLE area_type ENABLE TRIGGER ALL;

--
-- Data for Name: building_unit_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE building_unit_type DISABLE TRIGGER ALL;

INSERT INTO building_unit_type (code, display_value, description, status) VALUES ('individual', 'Individual::::Individuale', NULL, 'c');
INSERT INTO building_unit_type (code, display_value, description, status) VALUES ('shared', 'Shared::::Condiviso', NULL, 'c');


ALTER TABLE building_unit_type ENABLE TRIGGER ALL;

--
-- Data for Name: cadastre_object_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE cadastre_object_type DISABLE TRIGGER ALL;

INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('parcel', 'Parcel::::Particella', NULL, 'c', true);
INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('buildingUnit', 'Building Unit::::Unita Edile', NULL, 'x', false);
INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('utilityNetwork', 'Utility Network::::Rete Utilita', NULL, 'x', false);
INSERT INTO cadastre_object_type (code, display_value, description, status, in_topology) VALUES ('estate', 'Estate::::TONGAN', NULL, 'c', false);


ALTER TABLE cadastre_object_type ENABLE TRIGGER ALL;

--
-- Data for Name: dimension_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE dimension_type DISABLE TRIGGER ALL;

INSERT INTO dimension_type (code, display_value, description, status) VALUES ('0D', '0D::::0D', NULL, 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('1D', '1D::::1D', NULL, 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('2D', '2D::::sD', NULL, 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('3D', '3D::::3D', NULL, 'c');
INSERT INTO dimension_type (code, display_value, description, status) VALUES ('liminal', 'Liminal', NULL, 'x');


ALTER TABLE dimension_type ENABLE TRIGGER ALL;

--
-- Data for Name: hierarchy_level; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE hierarchy_level DISABLE TRIGGER ALL;

INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('0', 'Hierarchy 0', NULL, 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('1', 'Hierarchy 1', NULL, 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('2', 'Hierarchy 2', NULL, 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('3', 'Hierarchy 3', NULL, 'c');
INSERT INTO hierarchy_level (code, display_value, description, status) VALUES ('4', 'Hierarchy 4', NULL, 'c');


ALTER TABLE hierarchy_level ENABLE TRIGGER ALL;

--
-- Data for Name: land_use_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE land_use_type DISABLE TRIGGER ALL;

INSERT INTO land_use_type (code, display_value, description, status) VALUES ('commercial', 'Commercial::::ITALIANO', NULL, 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('industrial', 'Industrial::::ITALIANO', NULL, 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('agricultural', 'Agricultural::::ITALIANO', NULL, 'c');
INSERT INTO land_use_type (code, display_value, description, status) VALUES ('residential', 'Residential::::''Api Kolo', NULL, 'c');


ALTER TABLE land_use_type ENABLE TRIGGER ALL;

--
-- Data for Name: level_content_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE level_content_type DISABLE TRIGGER ALL;

INSERT INTO level_content_type (code, display_value, description, status) VALUES ('building', 'Building::::Costruzione', NULL, 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('customary', 'Customary::::Consueto', NULL, 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('informal', 'Informal::::Informale', NULL, 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('mixed', 'Mixed::::Misto', NULL, 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('network', 'Network::::Rete', NULL, 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('primaryRight', 'Primary Right::::Diritto Primario', NULL, 'c');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('responsibility', 'Responsibility::::Responsabilita', NULL, 'x');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('restriction', 'Restriction::::Restrizione', NULL, 'c');
INSERT INTO level_content_type (code, display_value, description, status) VALUES ('geographicLocator', 'Geographic Locators::::Locatori Geografici', 'Extension to LADM', 'c');


ALTER TABLE level_content_type ENABLE TRIGGER ALL;

--
-- Data for Name: register_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE register_type DISABLE TRIGGER ALL;

INSERT INTO register_type (code, display_value, description, status) VALUES ('all', 'All::::Tutti', NULL, 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('forest', 'Forest::::Forestale', NULL, 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('mining', 'Mining::::Minerario', NULL, 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('publicSpace', 'Public Space::::Spazio Pubblico', NULL, 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('rural', 'Rural::::Rurale', NULL, 'c');
INSERT INTO register_type (code, display_value, description, status) VALUES ('urban', 'Urban::::Urbano', NULL, 'c');


ALTER TABLE register_type ENABLE TRIGGER ALL;

--
-- Data for Name: structure_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE structure_type DISABLE TRIGGER ALL;

INSERT INTO structure_type (code, display_value, description, status) VALUES ('point', 'Point::::Punto', NULL, 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('polygon', 'Polygon::::Poligono', NULL, 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('sketch', 'Sketch::::Schizzo', NULL, 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('text', 'Text::::Testo', NULL, 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('topological', 'Topological::::Topologico', NULL, 'c');
INSERT INTO structure_type (code, display_value, description, status) VALUES ('unStructuredLine', 'UnstructuredLine::::LineanonDefinita', NULL, 'c');


ALTER TABLE structure_type ENABLE TRIGGER ALL;

--
-- Data for Name: surface_relation_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE surface_relation_type DISABLE TRIGGER ALL;

INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('above', 'Above::::Sopra', NULL, 'x');
INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('below', 'Below::::Sotto', NULL, 'x');
INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('mixed', 'Mixed::::Misto', NULL, 'x');
INSERT INTO surface_relation_type (code, display_value, description, status) VALUES ('onSurface', 'On Surface::::Sulla Superficie', NULL, 'c');


ALTER TABLE surface_relation_type ENABLE TRIGGER ALL;

--
-- Data for Name: utility_network_status_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE utility_network_status_type DISABLE TRIGGER ALL;

INSERT INTO utility_network_status_type (code, display_value, description, status) VALUES ('inUse', 'In Use::::In uso', NULL, 'c');
INSERT INTO utility_network_status_type (code, display_value, description, status) VALUES ('outOfUse', 'Out of Use::::Fuori uso', NULL, 'c');
INSERT INTO utility_network_status_type (code, display_value, description, status) VALUES ('planned', 'Planned::::Pianificato', NULL, 'c');


ALTER TABLE utility_network_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: utility_network_type; Type: TABLE DATA; Schema: cadastre; Owner: postgres
--

ALTER TABLE utility_network_type DISABLE TRIGGER ALL;

INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('chemical', 'Chemicals::::Cimica', NULL, 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('electricity', 'Electricity::::Elettricita', NULL, 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('gas', 'Gas::::Gas', NULL, 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('heating', 'Heating::::Riscaldamento', NULL, 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('oil', 'Oil::::Carburante', NULL, 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('telecommunication', 'Telecommunication::::Telecomunicazione', NULL, 'c');
INSERT INTO utility_network_type (code, display_value, description, status) VALUES ('water', 'Water::::Acqua', NULL, 'c');


ALTER TABLE utility_network_type ENABLE TRIGGER ALL;

SET search_path = party, pg_catalog;

--
-- Data for Name: communication_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE communication_type DISABLE TRIGGER ALL;

INSERT INTO communication_type (code, display_value, status, description) VALUES ('eMail', 'e-Mail::::E-mail', 'c', NULL);
INSERT INTO communication_type (code, display_value, status, description) VALUES ('post', 'Post::::Posta', 'c', NULL);
INSERT INTO communication_type (code, display_value, status, description) VALUES ('phone', 'Phone::::Telefono', 'c', NULL);
INSERT INTO communication_type (code, display_value, status, description) VALUES ('fax', 'Fax::::Fax', 'x', NULL);
INSERT INTO communication_type (code, display_value, status, description) VALUES ('courier', 'Courier::::Corriere', 'x', NULL);


ALTER TABLE communication_type ENABLE TRIGGER ALL;

--
-- Data for Name: gender_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE gender_type DISABLE TRIGGER ALL;

INSERT INTO gender_type (code, display_value, status, description) VALUES ('male', 'Male', 'c', NULL);
INSERT INTO gender_type (code, display_value, status, description) VALUES ('female', 'Female', 'c', NULL);


ALTER TABLE gender_type ENABLE TRIGGER ALL;

--
-- Data for Name: group_party_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE group_party_type DISABLE TRIGGER ALL;

INSERT INTO group_party_type (code, display_value, status, description) VALUES ('tribe', 'Tribe::::Tribu', 'x', NULL);
INSERT INTO group_party_type (code, display_value, status, description) VALUES ('association', 'Association::::Associazione', 'c', NULL);
INSERT INTO group_party_type (code, display_value, status, description) VALUES ('family', 'Family::::Famiglia', 'c', NULL);
INSERT INTO group_party_type (code, display_value, status, description) VALUES ('baunitGroup', 'Basic Administrative Unit Group::::Unita Gruppo Amministrativo di Base', 'x', NULL);


ALTER TABLE group_party_type ENABLE TRIGGER ALL;

--
-- Data for Name: id_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE id_type DISABLE TRIGGER ALL;

INSERT INTO id_type (code, display_value, status, description) VALUES ('nationalID', 'National ID::::Carta Identita Nazionale', 'c', 'The main person ID that exists in the country::::Il principale documento identificativo nel paese');
INSERT INTO id_type (code, display_value, status, description) VALUES ('nationalPassport', 'National Passport::::Passaporto Nazionale', 'c', 'A passport issued by the country::::Passaporto fornito dal paese');
INSERT INTO id_type (code, display_value, status, description) VALUES ('otherPassport', 'Other Passport::::Altro Passaporto', 'c', 'A passport issued by another country::::Passaporto Fornito da un altro paese');


ALTER TABLE id_type ENABLE TRIGGER ALL;

--
-- Data for Name: party_role_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE party_role_type DISABLE TRIGGER ALL;

INSERT INTO party_role_type (code, display_value, status, description) VALUES ('bank', 'Bank::::Banca', 'c', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('lodgingAgent', 'Lodging Agent::::Richiedente Registrazione', 'c', 'Extension to LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('conveyor', 'Conveyor::::Trasportatore', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('notary', 'Notary::::Notaio', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('writer', 'Writer::::Autore', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('surveyor', 'Surveyor::::Perito', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('certifiedSurveyor', 'Licenced Surveyor::::Perito con Licenza', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('moneyProvider', 'Money Provider::::Istituto Credito', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('employee', 'Employee::::Impiegato', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('farmer', 'Farmer::::Contadino', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('citizen', 'Citizen::::Cittadino', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('stateAdministrator', 'Registrar / Approving Surveyor::::Cancelleriere/ Perito Approvatore/', 'x', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('landOfficer', 'Land Officer::::Ufficiale del Registro Territoriale', 'x', 'Extension to LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('powerOfAttorney', 'Power of Attorney::::Procuratore', 'x', 'Extension to LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('transferee', 'Transferee (to)::::Avente Causa', 'x', 'Extension to LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('transferor', 'Transferor (from)::::Dante Causa', 'x', 'Extension to LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('applicant', 'Applicant', 'x', 'Extension to LADM');
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('lawyer', 'Lawyer::::TONGAN', 'c', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('noble', 'Noble::::TONGAN', 'c', NULL);
INSERT INTO party_role_type (code, display_value, status, description) VALUES ('king', 'King::::TONGAN', 'c', NULL);


ALTER TABLE party_role_type ENABLE TRIGGER ALL;

--
-- Data for Name: party_type; Type: TABLE DATA; Schema: party; Owner: postgres
--

ALTER TABLE party_type DISABLE TRIGGER ALL;

INSERT INTO party_type (code, display_value, status, description) VALUES ('naturalPerson', 'Natural Person::::Persona Naturale', 'c', NULL);
INSERT INTO party_type (code, display_value, status, description) VALUES ('nonNaturalPerson', 'Non-natural Person::::Persona Giuridica', 'c', NULL);
INSERT INTO party_type (code, display_value, status, description) VALUES ('baunit', 'Basic Administrative Unit::::Unita Amministrativa di Base', 'c', NULL);
INSERT INTO party_type (code, display_value, status, description) VALUES ('group', 'Group::::Gruppo', 't', NULL);


ALTER TABLE party_type ENABLE TRIGGER ALL;

SET search_path = source, pg_catalog;

--
-- Data for Name: administrative_source_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE administrative_source_type DISABLE TRIGGER ALL;

INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('leaseApplication', 'Lease Application', 'c', 'Application for lease of a tax or town allotment', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('subleaseApp', 'Sublease Application', 'c', 'Application for sublease of a tax or town allotment', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('cabinetSubmission', 'Cabinet Submission', 'c', 'Submission to cabinet for thier approval of a lease or related land transaction', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('cabinetDecision', 'Cabinet Decision', 'c', 'Document summarising the decision by cabinet for a lease or related land transaction', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('caveat', 'Caveat', 'c', 'A document that identifies the person lodging the caveat (the caveator) has a priority interest in the property. Any dealings on the property require the caveator to be notified.', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('checklist', 'Checklist', 'c', 'A copy of a checklist that has been signed or marked to show the land transaction complies with the checklist items', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('memoBrief', 'Internal Memo Briefing (English)', 'c', 'An internal memo summarising the land transaction details for the Minister in English', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('memo', 'Internal Memo (Tongan)', 'c', 'An internal memo describing the land transaction details for the Minister and the applicant in Tongan', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('other', 'Miscellaneous', 'c', 'Miscellaneous document type that does not fit within another category', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('notificationLetter', 'Notification Letter', 'c', 'Letter sent to the applicant advising them of the decision for their land transaction', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('cadastralSurvey', 'Plan', 'c', 'Illustration of one or more allotments showing survey details', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('powerOfAttorney', 'Power of Attorney', 'c', 'Document that vests power for one person (attorney) to act on behalf of another for legal transactions', true);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('note', 'Office Note', 'c', 'Document created by a staff member to note information or points of interest related to a given application', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('idVerification', 'Proof of Identity', 'c', 'Document that proves the identity of a person (e.g. birth certificate, passport, driver license, etc)', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('savingram', 'Savingram', 'c', '', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('templateForm', 'Template Form', 'c', 'Template for an official form such as an application form', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('siteInspectionForm', 'Site Inspection', 'c', 'Document that details a site inspection that has been done', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('ministerBriefing', 'Ministerial Briefing', 'c', 'Document sent to the Minister detailing an application being lodged', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('deedOfLease', 'Deed of Lease', 'c', 'A scanned copy of the Deed of Lease', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('deedOfGrant', 'Deed of Grant', 'c', 'A scanned copy of a Deed of Grant for an allotment', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('deedOfSublease', 'Deed of Sublease', 'c', 'A scanned copy of a Deed of Sublease', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('mortgageDoc', 'Mortgage Document', 'c', 'Represents a document such as an Assignation, Grant of Probate, Notification of Default, etc, that can be registered to a mortgage.', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('will', 'Probated Will', 'c', 'A legal declaration that names the benefactors of a deceased person’s estate along with those responsible for administering the estate. The Will must be probated and legally enforceable by the executor.', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('permit', 'Permit', 'c', 'Document type that can be registered to indicates the holder(s) of the permit have been granted the rights described by the permit. e.g. Occupation by alien(s), Removal of Sand, etc.', true);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('clientRequest', 'Client Request', 'c', 'Document or cover letter provided by client describing the reasons for a registration transaction', false);
INSERT INTO administrative_source_type (code, display_value, status, description, is_for_registration) VALUES ('surrenderDocs', 'Surrender Documents', 'c', 'Documents supporting surrender of an allotment', false);


ALTER TABLE administrative_source_type ENABLE TRIGGER ALL;

--
-- Data for Name: availability_status_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE availability_status_type DISABLE TRIGGER ALL;

INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('archiveConverted', 'Converted::::Convertito', 'c', NULL);
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('archiveDestroyed', 'Destroyed::::Distrutto', 'x', NULL);
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('incomplete', 'Incomplete::::Incompleto', 'c', NULL);
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('archiveUnknown', 'Unknown::::Sconosciuto', 'c', NULL);
INSERT INTO availability_status_type (code, display_value, status, description) VALUES ('available', 'Available', 'c', 'Extension to LADM');


ALTER TABLE availability_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: presentation_form_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE presentation_form_type DISABLE TRIGGER ALL;

INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('documentDigital', 'Digital Document::::Documento Digitale', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('documentHardcopy', 'Hardcopy Document::::Documento in Hardcopy', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('imageDigital', 'Digital Image::::Immagine Digitale', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('imageHardcopy', 'Hardcopy Image::::Immagine in Hardcopy', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('mapDigital', 'Digital Map::::Mappa Digitale', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('mapHardcopy', 'Hardcopy Map::::Mappa in Hardcopy', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('modelDigital', 'Digital Model::::Modello Digitale'',', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('modelHarcopy', 'Hardcopy Model::::Modello in Hardcopy', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('profileDigital', 'Digital Profile::::Profilo Digitale', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('profileHardcopy', 'Hardcopy Profile::::Profilo in Hardcopy', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('tableDigital', 'Digital Table::::Tabella Digitale', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('tableHardcopy', 'Hardcopy Table::::Tabella in Hardcopy', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('videoDigital', 'Digital Video::::Video Digitale'',', 'c', NULL);
INSERT INTO presentation_form_type (code, display_value, status, description) VALUES ('videoHardcopy', 'Hardcopy Video::::Video in Hardcopy', 'c', NULL);


ALTER TABLE presentation_form_type ENABLE TRIGGER ALL;

--
-- Data for Name: spatial_source_type; Type: TABLE DATA; Schema: source; Owner: postgres
--

ALTER TABLE spatial_source_type DISABLE TRIGGER ALL;

INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('fieldSketch', 'Field Sketch::::Schizzo Campo', 'c', NULL);
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('gnssSurvey', 'GNSS (GPS) Survey::::Rilevamento GNSS (GPS)', 'c', NULL);
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('orthoPhoto', 'Orthophoto::::Foto Ortopanoramica', 'c', NULL);
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('relativeMeasurement', 'Relative Measurements::::Misure relativa', 'c', NULL);
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('topoMap', 'Topographical Map::::Mappa Topografica', 'c', NULL);
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('video', 'Video::::Video', 'c', NULL);
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('cadastralSurvey', 'Cadastral Survey::::Perizia Catastale', 'c', 'Extension to LADM');
INSERT INTO spatial_source_type (code, display_value, status, description) VALUES ('surveyData', 'Survey Data (Coordinates)::::Rilevamento Data', 'c', 'Extension to LADM');


ALTER TABLE spatial_source_type ENABLE TRIGGER ALL;

SET search_path = system, pg_catalog;

--
-- Data for Name: approle; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE approle DISABLE TRIGGER ALL;

INSERT INTO approle (code, display_value, status, description) VALUES ('ManageBR', 'Admin - Business Rules', 'c', 'Allows system administrators to manage (edit and save) business rules.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ChangePassword', 'Admin - Change Password', 'c', 'Allows a user to change their password and edit thier user name. This role should be included in every security group. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('NoPasswordExpiry', 'Admin - No Password Expiry', 'c', 'Users with this role will not be subject to a password expiry if one is in place. This role can be assigned to user accounts used by other systems to integrate with the SOLA web services. Note that password expiry can be configured using the pword-expiry-days system.setting');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageRefdata', 'Admin - Reference Data', 'c', 'Allows system administrators to manage (edit and save) reference data details.  Users with this role will be able to login to the SOLA Admin application. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageSettings', 'Admin - System Settings', 'c', 'Allows system administrators to manage (edit and save) system setting details. Users with this role will be able to login to the SOLA Admin application. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ManageSecurity', 'Admin - Users and Security', 'c', 'Allows system administrators to manage (edit and save) users, groups and roles. Users with this role will be able to login to the SOLA Admin application. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnAssignOthers', 'Application - Assign to Other Users', 'c', 'Allows a user to assign an application to any other user in the same security groups they are in. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnAssignSelf', 'Application - Assign to Self', 'c', 'Allows a user to assign an application to themselves.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnEdit', 'Application - Edit & Save', 'c', 'Allows application details to be edited and saved. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnCreate', 'Application - Lodge', 'c', 'Allows new application details to be created (lodged). ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnView', 'Application - Search & View', 'c', 'Allows users to search and view application details.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnStatus', 'Application - Status Report', 'c', 'Allows the user to print a status report for the application.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnUnassignOthers', 'Application - Unassign from Others', 'c', 'Allows the user to unassign an application from any user. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnUnassignSelf', 'Application - Unassign from Self', 'c', 'Allows a user to unassign an application from themselves. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnApprove', 'Appln Action - Approval', 'c', 'Required to perform the Approve applicaiton action. The Approve action transitions the application into the Approved state. 
All services on the application must be completed before this action is available. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnArchive', 'Appln Action - Archive', 'c', 'Required to perform the Archive applicaiton action. The Archive action transitions the application into the Completed state.  ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnReject', 'Appln Action - Cancel', 'c', 'Required to perform the Cancel applicaiton action. The Cancel action transitions the application into the Annulled state.  ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnDispatch', 'Appln Action - Dispatch', 'c', 'Required to perform the Dispatch application action. Used to indicate that documents have been dispatched to applicant along with any certificates/reports/map prints requested by applicant');
INSERT INTO approle (code, display_value, status, description) VALUES ('lifeEstate', 'Service - Register Life Estate', 'c', 'Registration Service. Allows the Register Life Estate service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('apiSurrender', 'Service - Transfer Allotment - Surrender', 'c', 'Registration Service. Allows the Transfer Allotment - Surrender service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('apiExchange', 'Service - Transfer Allotment - Exchange', 'c', 'Registration Service. Allows the Transfer Allotment - Exchange service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('apiEjectment', 'Service - Transfer Allotment - Ejectment', 'c', 'Registration Service. Allows the Transfer Allotment - Ejectment service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cancelApi', 'Service - Cancel Allotment', 'c', 'Registration Service. Allows the Cancel Allotment service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('leaseInPossession', 'Service - Transfer Lease - Mortgagee in Possession', 'c', 'Registration Service. Allows the Transfer Lease - Mortgagee in Possession service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('leaseProbate', 'Service - Transfer Lease - Probate', 'c', 'Registration Service. Allows the Transfer Lease - Probate service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('renewLease', 'Service - Renew Lease', 'c', 'Registration Service. Allows the Renew Lease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('surrenderLease', 'Service - Surrender Lease', 'c', 'Registration Service. Allows the Surrender Lease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('terminateLease', 'Service - Terminate Lease', 'c', 'Registration Service. Allows the Terminate Lease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('subleaseInPossession', 'Service - Transfer Sublease - Mortgagee in Possession', 'c', 'Registration Service. Allows the Transfer Sublease - Mortgagee in Possession service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('subleaseProbate', 'Service - Transfer Sublease - Probate', 'c', 'Registration Service. Allows the Transfer Sublease - Probate service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('surrenderSublease', 'Service - Surrender Sublease', 'c', 'Registration Service. Allows the Surrender Sublease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('terminateSublease', 'Service - Terminate Sublease', 'c', 'Registration Service. Allows the Terminate Sublease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('assignMortgage', 'Service - Assign Mortgage', 'c', 'Registration Service. Allows the Assign Mortgage service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyLifeEstate', 'Service - Variation of Life Estate', 'c', 'Registration Service. Allows the Variation of Life Estate service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeLifeEstate', 'Service - Remove Life Estate', 'c', 'Registration Service. Allows the Remove Life Estate service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('easement', 'Service - Register Easement', 'c', 'Registration Service. Allows the Register Easement service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyEasement', 'Service - Variation of Easement', 'c', 'Registration Service. Allows the Variation of Easement service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeEasement', 'Service - Cancel Easement', 'c', 'Registration Service. Allows the Cancel Easement service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('trustee', 'Service - Register Trustee', 'c', 'Registration Service. Allows the Register Trustee service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyTrustee', 'Service - Variation to Trustee', 'c', 'Registration Service. Allows the Variation to Trustee service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeTrustee', 'Service - Cancel Trustee', 'c', 'Registration Service. Allows the Cancel Trustee service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('permit', 'Service - Register Permit', 'c', 'Registration Service. Allows the Register Permit service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cancelPermit', 'Service - Cancel Permit', 'c', 'Registration Service. Allows the Cancel Permit service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('transferSublease', 'Service - Transfer Sublease', 'c', 'Registration Service. Allows the Transfer Sublease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ViewProtectedFields', 'Property - View Protected Fields', 'c', 'Allows user to view details of protected fields such as the mortgage amount.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnRequisition', 'Appln Action - Requisition', 'c', 'Required to perform the Requisition applicaiton action. The Requisition action transitions the application into the Requisitioned state. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnResubmit', 'Appln Action - Resubmit', 'c', 'Required to perform the Resubmit applicaiton action. The Resubmit action transitions the application into the Lodged state if it is currently On Hold. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnValidate', 'Appln Action - Validate', 'c', 'Required to perform the Validate applicaiton action. Allows the user to manually run the validation rules against the application. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ApplnWithdraw', 'Appln Action - Withdraw', 'c', 'Required to perform the Withdraw applicaiton action. The Withdraw action transitions the application into the Annulled state.  ');
INSERT INTO approle (code, display_value, status, description) VALUES ('BulkApplication', 'Bulk Operations - Login ', 'c', 'Allows the user to login and use the Bulk Operations application. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('DashbrdViewAssign', 'Dashboard - View Assigned', 'c', 'Allows the user to view applications assigned to them in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Unassigned role. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('DashbrdViewUnassign', 'Dashboard - View Unassigned', 'c', 'Allows the user to view all unassigned applications in the Dashboard. To hide the Dashboard from the user, remove both this role and the Dashboard - View Assigned role. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('TransactionCommit', 'Doc Registration - Save', 'c', 'Allows documents for registration such as Power of Attorney and Standard Documents to be saved on the Document Registration screen. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('SourcePrint', 'Document - Print', 'c', 'Allows users to print documents directly from SOLA. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('SourceSave', 'Document - Save', 'c', 'Allows document details to be edited and saved');
INSERT INTO approle (code, display_value, status, description) VALUES ('SourceSearch', 'Document - Search & View', 'c', 'Allows users to search for documents.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ParcelSave', 'Parcel - Edit & Save', 'c', 'Allows parcel details to be edited and saved.');
INSERT INTO approle (code, display_value, status, description) VALUES ('PartySave', 'Party - Edit & Save', 'c', 'Allows party details to be edited and saved unless the party is a rightholder. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('RHSave', 'Party - Save Rightholder', 'c', 'Allows parties that are rightholders to be edited and saved.');
INSERT INTO approle (code, display_value, status, description) VALUES ('PartySearch', 'Party - Search & View', 'c', 'Allows user to search and view party details.');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitSave', 'Property - Edit & Save', 'c', 'Allows property details to be edited and saved.');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitCertificate', 'Property - Print Certificate', 'c', 'Allows the user to generate a property certificate. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('BaunitSearch', 'Property - Search', 'c', 'Allows users to search for properties. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('ReportGenerate', 'Reporting - Management Reports', 'c', 'Allows users to generate and view management reports (e.g. Lodgement Report)');
INSERT INTO approle (code, display_value, status, description) VALUES ('cabinetSubmission', 'Service - Cabinet Submission', 'c', 'Application Service. Allows the Cabinet Submission service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cnclPowerOfAttorney', 'Service - Cancel Power of Attorney', 'c', 'Registration Service. Allows the Cancel Power of Attorney service to be started');
INSERT INTO approle (code, display_value, status, description) VALUES ('checklist', 'Service - Checklist', 'c', 'Application Service. Allows the Checklist service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('correctRegistry', 'Service - Correct Registry', 'c', 'Application Service. Allows the Correct Registry service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('correctRegistryRem', 'Service - Correct Registry (Remove Right)', 'c', 'Application Service. Allows the Correct Registry (Remove Right) service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeRestriction', 'Service - Discharge Mortgage', 'c', 'Registration Service. Allows the Discharge Mortgage service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('draftDeed', 'Service - Draft Deed', 'c', 'Application Service. Allows the Draft Deed service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('itemNumber', 'Service - Issue Item Number', 'c', 'Application Service. Allows the Issue Item Number service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ministerBriefing', 'Service - Ministerial Briefing Prepartion', 'c', 'Application Service. Allows the Ministerial Briefing service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ministerDecision', 'Service - Ministerial Decision', 'c', 'Application Service. Allows the Ministerial Decision service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('hodReview', 'Service - Head of Division Review', 'c', 'Application Service. Allows the Head of Division Review service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('mortgageDocument', 'Service - Register Document Affecting a Mortgage', 'c', 'Registration Service. Allows the Register Document Affecting a Mortgage service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('leaseDocument', 'Service - Register Document Affecting a Leasehold Title', 'c', 'Registration Service. Allows the Register Document Affecting a Leasehold Title service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('registerLease', 'Service - Register Lease', 'c', 'Registration Service. Allows the Register Lease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('mortgage', 'Service - Register Mortgage', 'c', 'Registration Service. Allows the Register Mortgage service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('registerSublease', 'Service - Register Sublease', 'c', 'Registration Service. Allows the Register Sublease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('regnPowerOfAttorney', 'Service - Registration of Power of Attorney', 'c', 'Registration Service. Allows the Registration of Power of Attorney service to be started. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('signDeed', 'Service - Sign Deed', 'c', 'Application Service. Allows the Sign Deed service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('siteInspection', 'Service - Site Inspection', 'c', 'Application Service. Allows the Site Inspection service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('survey', 'Service - Survey', 'c', 'Application Service. Allows the Survey service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyLease', 'Service - Transfer Lease', 'c', 'Registration Service. Allows the Transfer Lease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varySublease', 'Service - Variation of Sublease', 'c', 'Registration Service. Allows the Variation of Sublease service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyMortgage', 'Service - Variation of Mortgage', 'c', 'Registration Service. Allows the Variation of Mortgage service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('CancelService', 'Service Action - Cancel', 'c', 'Allows any service to be cancelled.');
INSERT INTO approle (code, display_value, status, description) VALUES ('CompleteService', 'Service Action - Complete', 'c', 'Allows any service to be completed');
INSERT INTO approle (code, display_value, status, description) VALUES ('RevertService', 'Service Action - Revert', 'c', 'Allows any completed service to be reverted to a Pending status for further action. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('StartService', 'Service Action - Start', 'c', 'Allows any user to click the Start action. Note that the user must also have the appropraite Service role as well before they can successfully start the service. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('CashierImport', 'Import - Cashier Import', 'c', 'Allows user to open the Cashier Import form ');
INSERT INTO approle (code, display_value, status, description) VALUES ('taxapi', 'Service - Register Tax Allotment', 'c', 'Registration Service. Allows the Register Tax Allotment service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('townapi', 'Service - Register Town Allotment', 'c', 'Registration Service. Allows the Register Town Allotment service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('caveat', 'Service - Register Caveat', 'c', 'Registration Service. Allows the Register Caveat service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('varyCaveat', 'Service - Variation to Caveat', 'c', 'Registration Service. Allows the Variation to Caveat service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('removeCaveat', 'Service - Remove Caveat', 'c', 'Registration Service. Allows the Remove Caveat service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('ViewMap', 'Map - View', 'c', 'Allows the user to view the map. ');
INSERT INTO approle (code, display_value, status, description) VALUES ('drafting', 'Service - drafting', 'c', 'Application Service. Allows the Drafting service to be started.');
INSERT INTO approle (code, display_value, status, description) VALUES ('DraftingSearch', 'Drafting - Drafting Search', 'c', 'Allows users to search for items from the migrated drafting database.');
INSERT INTO approle (code, display_value, status, description) VALUES ('DraftingEdit', 'Drafting - Drafting Edit', 'c', 'Allows users to add and modify items in migrated drafting database.');
INSERT INTO approle (code, display_value, status, description) VALUES ('DraftingRemove', 'Drafting - Drafting Remove', 'c', 'Allows users to remove items from the migrated drafting database.');
INSERT INTO approle (code, display_value, status, description) VALUES ('MinisterEdit', 'Minister - Edit', 'c', 'Allows users to add and modify items in the ministers database.');
INSERT INTO approle (code, display_value, status, description) VALUES ('MinisterSearch', 'Minister - Search', 'c', 'Allows users to search for items from the migrated minister database.');
INSERT INTO approle (code, display_value, status, description) VALUES ('cadastreChange', 'Service - Change to Cadastre', 'c', 'Registration Service - Capture new cadastral surveys');
INSERT INTO approle (code, display_value, status, description) VALUES ('redefineCadastre', 'Service - Redefine Cadastre', 'c', 'Registration Service - Modify existing cadastral parcels');


ALTER TABLE approle ENABLE TRIGGER ALL;

--
-- Data for Name: br_severity_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_severity_type DISABLE TRIGGER ALL;

INSERT INTO br_severity_type (code, display_value, status, description) VALUES ('critical', 'Critical', 'c', NULL);
INSERT INTO br_severity_type (code, display_value, status, description) VALUES ('medium', 'Medium', 'c', NULL);
INSERT INTO br_severity_type (code, display_value, status, description) VALUES ('warning', 'Warning', 'c', NULL);


ALTER TABLE br_severity_type ENABLE TRIGGER ALL;

--
-- Data for Name: br_technical_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_technical_type DISABLE TRIGGER ALL;

INSERT INTO br_technical_type (code, display_value, status, description) VALUES ('sql', 'SQL::::SQL', 'c', 'The rule definition is based in sql and it is executed by the database engine.');
INSERT INTO br_technical_type (code, display_value, status, description) VALUES ('drools', 'Drools::::Drools', 'c', 'The rule definition is based on Drools engine.');


ALTER TABLE br_technical_type ENABLE TRIGGER ALL;

--
-- Data for Name: br_validation_target_type; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE br_validation_target_type DISABLE TRIGGER ALL;

INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('application', 'Application::::Pratica', 'c', 'The target of the validation is the application. It accepts one parameter {id} which is the application id.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('service', 'Service::::Servizio', 'c', 'The target of the validation is the service. It accepts one parameter {id} which is the service id.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('rrr', 'Right or Restriction::::Diritto o Rstrizione', 'c', 'The target of the validation is the rrr. It accepts one parameter {id} which is the rrr id. ');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('ba_unit', 'Administrative Unit::::Unita Amministrativa', 'c', 'The target of the validation is the ba_unit. It accepts one parameter {id} which is the ba_unit id.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('source', 'Source::::Sorgente', 'c', 'The target of the validation is the source. It accepts one parameter {id} which is the source id.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('cadastre_object', 'Cadastre Object::::Oggetto Catastale', 'c', 'The target of the validation is the transaction related with the cadastre change. It accepts one parameter {id} which is the transaction id.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('bulkOperationSpatial', 'BUlk operation', 'c', 'The target of the validation is the transaction related with the bulk operations.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('public_display', 'Public display', 'c', 'The target of the validation is the set of cadastre objects/ba units that belong to a certain last part. It accepts one parameter {lastPart} which is the last part.');
INSERT INTO br_validation_target_type (code, display_value, status, description) VALUES ('spatial_unit_group', 'Spatial unit group', 'c', 'The target of the validation are the spatial unit groups');


ALTER TABLE br_validation_target_type ENABLE TRIGGER ALL;

--
-- Data for Name: language; Type: TABLE DATA; Schema: system; Owner: postgres
--

ALTER TABLE language DISABLE TRIGGER ALL;

INSERT INTO language (code, display_value, active, is_default, item_order) VALUES ('en', 'English::::Fakapalagi', true, true, 1);
INSERT INTO language (code, display_value, active, is_default, item_order) VALUES ('to', 'Tongan::::Fakatonga', true, false, 2);


ALTER TABLE language ENABLE TRIGGER ALL;

SET search_path = transaction, pg_catalog;

--
-- Data for Name: reg_status_type; Type: TABLE DATA; Schema: transaction; Owner: postgres
--

ALTER TABLE reg_status_type DISABLE TRIGGER ALL;

INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('current', 'Current', NULL, 'c');
INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('pending', 'Pending', NULL, 'c');
INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('historic', 'Historic', NULL, 'c');
INSERT INTO reg_status_type (code, display_value, description, status) VALUES ('previous', 'Previous', NULL, 'c');


ALTER TABLE reg_status_type ENABLE TRIGGER ALL;

--
-- Data for Name: transaction_status_type; Type: TABLE DATA; Schema: transaction; Owner: postgres
--

ALTER TABLE transaction_status_type DISABLE TRIGGER ALL;

INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('approved', 'Approved::::Approvata', NULL, 'c');
INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('cancelled', 'CancelledApproved::::Cancellata', NULL, 'c');
INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('pending', 'Pending::::In Attesa', NULL, 'c');
INSERT INTO transaction_status_type (code, display_value, description, status) VALUES ('completed', 'Completed::::Completato', NULL, 'c');


ALTER TABLE transaction_status_type ENABLE TRIGGER ALL;

--
-- PostgreSQL database dump complete
--

