@echo off
REM SOLA Documents Backup Script
REM
REM Author: Andrew McDowell 
REM Date: 24 Nov 2012
REM Modified: 20 Aug 2013, 19 Apr 2016
REM 
REM This script uses the PostgreSQL pg_dump utility to create a backup 
REM of documents in the SOLA database. The document table can grow large
REM very quickly and a full backup of this table can take several hours.
REM To avoid extended backup times, this script supports a partial 
REM backup of the documents table by copying all new documents added to 
REM SOLA since the last full backup into the document_backup table
REM and then runs a backup of that table only. 
REM The three backup types supported by this script are;
REM 
REM Full (F)     > Creates a backup of all content in the document.document
REM                table. WARNING - This backup may take several hours to
REM                complete. It is recommended that full backups occur
REM                at regular intervals, e.g. once a month. 
REM Partial (P)  > Creates a backup of only those documents that have 
REM                been added to the database since the last full 
REM                document backup. Note the timestamp for the last
REM                full backup is automatically recorded by this 
REM                script for use with subsequent partial backups. 
REM
REM
REM Examples:
REM  1) To produce a full backup of the documents table 
REM     > BackupSOLADocuments.cmd <password> F 01-Base soladb
REM  2) To produce a partial backup of the documents table 
REM     > BackupSOLADocuments.cmd <password> P 03-Daily soladb
REM  3) To run the script in interactive mode
REM     > BackupSOLADocuments.cmd
REM
REM NOTE: This script is dependent on the existence of the 
REM document_backup table in the document schema. The
REM document_backup table must have the same columns as the
REM document table. 
REM
REM Restoring the SOLA documents table after an incident
REM
REM To restore the SOLA documents table, restore the most recent full
REM backup into the new database followed by the most recent partial 
REM backup. You will also need to manually transfer the documents from
REM the document backup table into the document table. 
REM 

REM Check the password parameter
set pword=?
set type=P
set frequency=03-Daily
set db_name=sola_prod
REM set sharePword=?
IF [%1] EQU [] (
    REM Prompt user for the password if not set
	set /p pword= Password [%pword%] :
	set /p type= Type of backup - F Full or P Partial !WARNING A full backup may take serveral hours [%type%] :
	set /p frequency= Set frequency subdirectory - 01-Base, 03-Daily, etc. [%frequency%] :
	set /p db_name= Database [%db_name%] :
    REM set /p sharePword= Restore file share password [%sharePword%] :
) ELSE (
    set pword=%1
	IF [%2] NEQ [] (
	   set type=%2
	)
   IF [%3] NEQ [] (
	   set frequency=%3
	)
    IF [%4] NEQ [] (
  	   set db_name=%4
  	)
)

REM Set location of pg_dump, backup file location and database name
set pg_dump_exe="C:\Program Files\PostgreSQL\9.2\bin\pg_dump.exe"
set psql_exe="C:\Program Files\PostgreSQL\9.2\bin\psql" 
set backup_file_path=C:\Work\source\Tonga_\database\scripts\winos\backup\
REM The file to contain the timestamp of the most recent full backup. 
set timestamp_file="%backup_file_path%/backup_docs_timestamp"
REM R: should be a share to the E:\Restore directory on DBMSMAIN
REM set training_backup="R:\training_docs.backup"
REM Alter the default timestamp value as required. Format for 
REM date depends on the OS regional settings. Either Day-Month-Year 
REM or Month-Day-Year
set default_timestamp=01-04-2016 05:00

REM Default DB connection values
set host=localhost
set port=5432
set username=postgres


REM Parse out the current date and time. May need to swap
REM day and month if regional settings have month before day. 
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
 set dow=%%i
 set day=%%j
 REM set month=%%j
 set month=%%k
 REM set day=%%k
 set year=%%l
)

set hr=%TIME: =0%
set hr=%hr:~0,2%
set min=%TIME:~3,2%

set datestr=%year%%month%%day%_%hr%%min%

REM Set the file names
set BACKUP_FILE="%backup_file_path%%frequency%\sola_docs_%type%_%datestr%.backup" 
set BACKUP_LOG="%backup_file_path%%frequency%\sola_docs_%type%_%datestr%.log"
set SQL_FILE="%backup_file_path%%frequency%\docs.sql"

REM get the password from the command line and set the
REM PGPASSWORD environ variable
REM echo pword=%pword%...
SET PGPASSWORD=%pword%

echo Starting backup %time%
echo Starting backup %time% > %BACKUP_LOG% 2>&1
echo Backup File=%BACKUP_FILE% 
echo Backup File=%BACKUP_FILE% >> %BACKUP_LOG% 2>&1

IF [%type%] EQU [F] (

	REM First create a timestamp to indicate the date/time the last
	REM full backup occurred. Do this before the backup runs as it
	REM could take several hours during which time new documents may 
	REM be added. 
    set newtimestamp=%day%^-%month%^-%year% %hr%^:%min%
	echo New timestamp: %newtimestamp%
	echo New timestamp: %newtimestamp% >> %BACKUP_LOG% 2>&1
	echo %newtimestamp% > %timestamp_file%
	
	echo Dumping all of the document table...
    echo Dumping all of the document table... >> %BACKUP_LOG% 2>&1
	
	%pg_dump_exe% -i -h %host% -p %port% -U %username% ^
				  -F c -b -v -t document.document -f ^
				  %BACKUP_FILE% %db_name% >> %BACKUP_LOG% 2>&1
				  
   REM Clear the document_backup table using a psql command
   echo Clearing document_backup...
   echo Clearing document_backup... >> %BACKUP_LOG% 2>&1
   %psql_exe% --host=%host% --port=%port% --username=%username% --dbname=%db_name% -w -c "DELETE FROM document.document_backup;" >> %BACKUP_LOG% 2>&1
   
) ELSE (

    REM Attempt to read the timestamp from the timestamp_file. If the timestamp_file
	REM does not exist, use the default timestamp value. 
	IF EXIST %timestamp_file% (
		 set /p timestamp=<%timestamp_file%
	) ELSE (
	     set timestamp=%default_timestamp%
	)
	echo Using timestamp %timestamp%
    echo Using timestamp %timestamp% >> %BACKUP_LOG% 2>&1
	
   REM Copy documents to the document_backup table using a psql command
   echo INSERT INTO document.document_backup ^(id, nr, extension, body, description, rowidentifier, rowversion, change_action, change_user, change_time^) > %SQL_FILE%
   echo SELECT id, nr, extension, body, description, rowidentifier, rowversion, change_action, change_user, change_time >> %SQL_FILE% 
   echo FROM document.document d WHERE d.change_time ^> ^'%timestamp%^' AND NOT EXISTS ^(SELECT id FROM document.document_backup WHERE id = d.id^)^;  >> %SQL_FILE% 

   echo Copy to document_backup...
   echo Copy to document_backup... >> %BACKUP_LOG% 2>&1
   %psql_exe% --host=%host% --port=%port% --username=%username% --dbname=%db_name% --file="%SQL_FILE%" >> %BACKUP_LOG% 2>&1
	
	echo Dumping document_backup table...
    echo Dumping document_backup table...>> %BACKUP_LOG% 2>&1
	%pg_dump_exe% -i -h %host% -p %port% -U %username% ^
				  -F c -b -v -t document.document_backup -f ^
				  %BACKUP_FILE% %db_name% >> %BACKUP_LOG% 2>&1
	
	REM echo Copying file to %training_backup%...
	REM echo Copying file to %training_backup%... >> %BACKUP_LOG% 2>&1
	REM Configure a network share to the server hosting the training system
    REM net use R: \\DBMSMain\Restore /user:DBMSMain\SolaShare %sharePword% >> %BACKUP_LOG% 2>&1
	REM copy /B /Y %BACKUP_FILE% %training_backup% >> %BACKUP_LOG% 2>&1
)
echo Finished at %time%
echo Finished at %time% >> %BACKUP_LOG% 2>&1
