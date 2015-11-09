@ECHO off
REM 6 Feb 2014
REM Windows batch script that uses the PostgreSQL pg_dump utility
REM to extract table data from the SOLA database into plain text 
REM SQL files. The SQL files are then compressed using 7z. The 7z 
REM file can then be used to load the other sola databases with 
REM test data using the create_database script.  
REM 
REM 7z supports password encryption and this script can be modified
REM to password encrypt the 7z archive if requried.
REM
REM The documents table can grow to be extremely large which may
REM cause this script to take a very long time to complete. The 
REM user is given the option to extract documents or not. By 
REM default, the document table is skipped. 
REM
REM Configure variables to use for script
SET current_dir=%~dp0
SET pg_dump="%current_dir%\bin\psql\pg_dump"
SET data_path=%current_dir%..\..\data\
SET zip_exe="%current_dir%bin\7z\7z.exe"
SET EXTRACT_LOG="%current_dir%data.log"
SET host=localhost
SET port=5432
SET db_name=sola
SET username=postgres
SET dumpdocs=N

REM Prompt the user for variable override values
SET /p host= Host name [%host%] :
SET /p port= Port [%port%] :
SET /p db_name= Database name [%db_name%] :
SET /p username= Username [%username%] :
SET /p pword= DB Password [?] :
SET /p dumpdocs= Do you want to extract the document table? (Y/N) [%dumpdocs%] :

REM If the 7z data archive requires password encryption, prompt the user 
REM for the password.
REM DO NOT RECORD THE PASSWORD AS A DEFAULT VALUE IN THIS BATCH FILE!
SET /p archive_password= Test Data Archive Password [?] :

REM Set the PGPASSWORD environ variable
SET PGPASSWORD=%pword%

REM Start the Extract
echo.
echo.
echo Starting Extract at %time%
echo Starting Extract at %time% > %EXTRACT_LOG% 2>&1

REM Dump data from each schema into a plain text SQL file
echo Dumping address tables...
echo ### Dumping address tables... >> %EXTRACT_LOG% 2>&1 
%pg_dump% -h %host% -p %port% -U %username% -a -b -F p ^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
    -t address.address ^
	-f "%data_path%01_address.sql" %db_name% >> %EXTRACT_LOG% 2>&1

echo Dumping party tables...
echo ### Dumping party tables... >> %EXTRACT_LOG% 2>&1 
%pg_dump% -h %host% -p %port% -U %username% -a -b -F p ^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
    -t party.party  -t party.party_role ^
	-f "%data_path%02_party.sql" %db_name% >> %EXTRACT_LOG% 2>&1

REM Skip dumping documents unless the user has explicity choosen to do so 
IF /I "%dumpdocs%"=="N" GOTO SKIP_DOCUMENTS
	
echo Dumping document tables...
echo ### Dumping document tables... >> %EXTRACT_LOG% 2>&1 
%pg_dump% -h %host% -p %port% -U %username% -a -b ^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
    -t document.document ^
	-f "%data_path%03_document.sql" %db_name% >> %EXTRACT_LOG% 2>&1

:SKIP_DOCUMENTS

echo Dumping transaction tables...
echo ### Dumping transaction tables... >> %EXTRACT_LOG% 2>&1 
%pg_dump% -h %host% -p %port% -U %username% -a -b ^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
    -t transaction.transaction -t transaction.transaction_source ^
	-f "%data_path%04_transaction.sql" %db_name% >> %EXTRACT_LOG% 2>&1
	
echo Dumping source tables...
echo ### Dumping source tables... >> %EXTRACT_LOG% 2>&1 
%pg_dump% -h %host% -p %port% -U %username% -a -b ^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
	-t source.archive -t source.source -t application.application_uses_source ^
	-t administrative.source_describes_rrr -t source.power_of_attorney ^
    -t administrative.source_describes_ba_unit -t source.spatial_source ^
    -t source.spatial_source_measurement ^
    -f "%data_path%05_source.sql" %db_name% >> %EXTRACT_LOG% 2>&1
	
echo Dumping cadastre tables...
echo ### Dumping cadastre tables... >> %EXTRACT_LOG% 2>&1
%pg_dump% -h %host% -p %port% -U %username% -a -b -F p^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
    -t cadastre.cadastre_object -t cadastre.spatial_unit ^
	-t cadastre.spatial_value_area -t cadastre.spatial_unit_group ^
	-t cadastre.spatial_unit_in_group -t cadastre.cadastre_object_node_target ^
    -t cadastre.cadastre_object_target -t cadastre.spatial_unit_address ^
    -t cadastre.survey_point ^
	-f "%data_path%06_cadastre.sql" %db_name% >> %EXTRACT_LOG% 2>&1
	
echo Dumping administrative tables...
echo ### Dumping administrative tables... >> %EXTRACT_LOG% 2>&1 
%pg_dump% -h %host% -p %port% -U %username% -a -b ^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
    -t administrative.ba_unit -t administrative.required_relationship_baunit ^
    -t administrative.ba_unit_area -t administrative.rrr -t administrative.rrr_share ^
    -t administrative.party_for_rrr -t administrative.notation ^
    -t administrative.ba_unit_contains_spatial_unit -t administrative.ba_unit_as_party ^
    -t administrative.ba_unit_target -t administrative.condition_for_rrr ^
    -t administrative.mortgage_isbased_in_rrr ^
	-f "%data_path%07_administrative.sql" %db_name% >> %EXTRACT_LOG% 2>&1
	
echo Dumping application tables...
echo ### Dumping application tables... >> %EXTRACT_LOG% 2>&1
%pg_dump% -h %host% -p %port% -U %username% -a -b ^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
	-t application.application -t application.application_property ^
	-t application.service -t application.application_spatial_unit ^
	-t application.service_checklist_item -t application.drafting ^
	-t application.minister_application -t application.minister_inward ^
	-t application.minister_lease ^
    -f "%data_path%08_application.sql" %db_name% >> %EXTRACT_LOG% 2>&1	
	
echo Dumping bulk operation tables...
echo ### Dumping bulk operation tables... >> %EXTRACT_LOG% 2>&1 
%pg_dump% -h %host% -p %port% -U %username% -a -b ^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
    -t bulk_operation.spatial_unit_temporary ^
	-f "%data_path%09_bulk_operation.sql" %db_name% >> %EXTRACT_LOG% 2>&1
	
echo Dumping Drafting and Minister tables...
echo ### Dumping Drafting and Minister tables... >> %EXTRACT_LOG% 2>&1 
%pg_dump% -h %host% -p %port% -U %username% -a -b ^
    --column-inserts --disable-dollar-quoting --disable-triggers ^
    -t application.drafting -t application.minister_application ^
	-t application.minister_inward -t application.minister_lease ^
	-f "%data_path%10_drafting_minister.sql" %db_name% >> %EXTRACT_LOG% 2>&1
		
REM Compress the test/demo data using 7z. 
echo Compressing data files...
echo ### Compressing data files... >> %EXTRACT_LOG% 2>&1
REM %zip_exe% a -y "%data_path%tonga.7z" "%data_path%*.sql" >> %EXTRACT_LOG% 2>&1
REM Use -p option if the archive needs to be password protected as follows
%zip_exe% a -y -p%archive_password% "%data_path%tonga.7z" "%data_path%*.sql" >> %EXTRACT_LOG% 2>&1

REM Report the finish time
echo Finished at %time% - Check data.log for errors!
echo Finished at %time% >> %EXTRACT_LOG% 2>&1
pause