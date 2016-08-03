@echo off
REM SOLA Backup Script
REM
REM Author: Andrew McDowell 
REM Date: 24 Nov 2012
REM Modified: 14 Aug 2013, 19 Apr 2016
REM 
REM This script uses the postgres pg_dump utility to create a backup 
REM of the SOLA database. It can create 3 different dumps;
REM 
REM Main (M) > Includes all data except for the _historic tables
REM History (H) > Only includes the _historic tables
REM Training/Test (T) > Includes all data except the _historic tables and
REM       dumps the system.appuser table separately. This backup
REM       can be restored into the training/test environment without
REM       overwriting user passwords. 
REM  
REM The frequency of the dump can also be indicated by setting the
REM name of the subfolder to create the backup in as the third 
REM parameter (e.g. 02-Hourly or 03-Daily).  Note that how 
REM frequently this script runs is controlled through a 
REM Windows Scheduled Task. 
REM 
REM The _historic tables are backed up separately to try and ensure the
REM backup for the main SOLA tables remains small so that the backup
REM can run very quickly  (i.e. < 1 minute). 
REM  
REM Examples:
REM 1) To produce an hourly backup excluding _historic tables 
REM    > BackupSOLA.cmd <password> M 02-Hourly soladb
REM 2) To produce a backup containing ONLY _historic tables 
REM    > BackupSOLA.cmd <password> H 03-Daily soladb
REM 3) To produce a backup for the Training/Test environment 
REM    > BackupSOLA.cmd <password> T 03-Daily soladb
REM
REM Note that the output from the training backup will be copied 
REM automatically to a shared folder on the Test server for 
REM immediate restore. 
REM 
REM 
REM Restoring the SOLA database after an incident
REM
REM To restore the SOLA database, create an empty database and restore the 
REM latest M backup file )(from the 02-Hourly folder) followed by a 
REM restore of the latest H backup (from the 03-Daily folder). 
REM Note that this may result in some lost history records depending 
REM on how frequently the historic backup is run. 
REM
REM This script should be scheduled to run as a Windows task to ensure
REM regular backups of the main SOLA database. It can also run interactively 
REM and will prompt for password and backup type

REM Check the password parameter
set pword=?
set type=M
set frequency=02-Hourly
set db_name=sola_prod
REM set sharePword=?
IF [%1] EQU [] (
    REM Prompt user for the password if not set
	set /p pword= Password [%pword%] :
	set /p type= What type of backup - M Main, H History, T Training [%type%] :
	set /p frequency= Set frequency subdirectory - 02-Hourly or 03-Daily [%frequency%] :
	set /p db_name= Database name [%db_name%] :
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

REM Default DB connection values
set host=localhost
set port=5432
set username=postgres


REM Set location of pg_dump, backup file location and database name
set pg_dump_exe="C:\Program Files\PostgreSQL\9.2\bin\pg_dump.exe"  
set base_backup_dir=C:\Work\source\Tonga_\database\scripts\winos\backup\
REM R: should be a share to the D:\Restore directory of the target server
REM set training_backup="R:\training.backup"
REM set training_users_backup="R:\training_users.sql"

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
set BACKUP_FILE="%base_backup_dir%%frequency%\sola_%type%_%datestr%.backup"
set BACKUP_LOG="%base_backup_dir%%frequency%\sola_%type%_%datestr%.log"
set BACKUP_FILE_USERS="%base_backup_dir%%frequency%\sola_%type%_users_%datestr%.sql"
set BACKUP_FILE_HIST="%base_backup_dir%%frequency%\sola_%type%_hist_%datestr%.backup"

REM get the password from the command line and set the
REM PGPASSWORD environ variable
REM echo pword=%pword%...
SET PGPASSWORD=%pword%


echo Starting backup %time%
echo Starting backup %time% > %BACKUP_LOG% 2>&1
echo Backup File=%BACKUP_FILE%
echo Backup File=%BACKUP_FILE% >> %BACKUP_LOG% 2>&1

IF [%type%] EQU [H] (
	echo Dump History...
    echo Dump History... >> %BACKUP_LOG% 2>&1
	
	%pg_dump_exe% -i -h %host% -p %port% -U %username% ^
                  -F c -b -v -N document -t *.*_historic -f ^
				  %BACKUP_FILE% %db_name% >> %BACKUP_LOG% 2>&1
	
) ELSE (
    IF [%type%] EQU [T] (
		echo Dump Training...
		echo Dump Training... >> %BACKUP_LOG% 2>&1 
		REM Needs to be on one line as the continuation character ^ causes issues for pg_dump when interpreting the -T values
		%pg_dump_exe% -i -h %host% -p %port% -U %username% -F c -b -v -N document -T system.appuser -T system.setting -T *.*_historic -f %BACKUP_FILE% %db_name% >> %BACKUP_LOG% 2>&1
		
		echo Dump Training History...
		echo Dump Training History... >> %BACKUP_LOG% 2>&1 
		REM Dump the application_historic and service_historic tables separately so the lodgement report can be accurately generated. 
		%pg_dump_exe% -i -h %host% -p %port% -U %username% -F c -b -v -t application.application_historic -t application.service_historic -f %BACKUP_FILE_HIST% %db_name% >> %BACKUP_LOG% 2>&1
		
		echo Dump Training Users...
		echo Dump Training Users... >> %BACKUP_LOG% 2>&1 	
		REM Dump a plain text copy of the app user table to pickup any new users (i.e. as Insert statements)
		%pg_dump_exe% -i -h %host% -p %port% -U %username% -F p -a -b -v ^
					--column-inserts --disable-dollar-quoting --disable-triggers --inserts ^
					-t system.appuser -f %BACKUP_FILE_USERS% %db_name% >> %BACKUP_LOG% 2>&1	
			
			
		REM echo Moving backups to %training_backup%...
		REM echo Moving backups to %training_backup%... >> %BACKUP_LOG% 2>&1
		REM Configure a network share to the server hosting the test/training system
        REM net use R: \\<Server>\Restore /user:<Server>\SolaShare %sharePword% >> %BACKUP_LOG% 2>&1
		REM move /Y %BACKUP_FILE% %training_backup% >> %BACKUP_LOG% 2>&1
		REM move /Y %BACKUP_FILE_USERS% %training_users_backup% >> %BACKUP_LOG% 2>&1
		REM move /Y %BACKUP_FILE_HIST% %training_hist_backup% >> %BACKUP_LOG% 2>&1
		
	) ELSE (
	    REM Run the dump excluding history tables. The document schema is excluded 
		REM because it contains approx 50Gb of data. Use the BackupSOLADocuments.cmd
		REM to perform a partial backup of the documents table. 
		echo Dumping Main...
		echo Dumping Main... >> %BACKUP_LOG% 2>&1
		%pg_dump_exe% -i -h %host% -p %port% -U %username% ^
					  -F c -b -v -N document -T *.*_historic -f ^
					  %BACKUP_FILE% %db_name% >> %BACKUP_LOG% 2>&1 
					 
	)
)

echo Finished at %time%
echo Finished at %time% >> %BACKUP_LOG% 2>&1
