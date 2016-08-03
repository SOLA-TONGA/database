@echo off
REM SOLA Remove Backups Script
REM
REM Author: Andrew McDowell 
REM Date: 24 Nov 2012
REM Modified: 15 Aug 2012
REM 
REM This script is used to remove any old backup files that are no 
REM longer relevant. For detailed usage of the forfiles command
REM use forfiles /? from a command prompt.
REM 

REM set sharePword=?
REM IF [%1] EQU [] (
    REM Prompt user for the password if not set
	REM set /p sharePword= Restore file share password [%sharePword%] :
REM ) ELSE (
    REM set sharePword=%1
	REM )
REM )

SET backup_file_path=C:\Work\source\Tonga_\database\scripts\winos\backup\
SET hourly_backups="%backup_file_path%02-Hourly" 
SET daily_backups="%backup_file_path%03-Daily"
SET dev_backups="%backup_file_path%04-Development"
SET train_backups="%backup_file_path%05-Train"  
REM SET training="R:" 

REM Deletes any files older than 2 days from todays date
forfiles /P %hourly_backups%  /M *.backup /D -2 /C "cmd /c del @PATH"
forfiles /P %hourly_backups%  /M *.log /D -2 /C "cmd /c del @PATH" 

REM Deletes any files older than 15 days from todays date
forfiles /P %daily_backups%  /M *.backup /D -14 /C "cmd /c del @PATH"
forfiles /P %daily_backups%  /M *.log /D -14 /C "cmd /c del @PATH"

REM Deletes any files older than 8 days from todays date
forfiles /P %dev_backups%  /M *.backup /D -7 /C "cmd /c del @PATH"
forfiles /P %dev_backups%  /M *.log /D -7 /C "cmd /c del @PATH"

REM Deletes any files older than 8 days from todays date
forfiles /P %train_backups%  /M *.backup /D -7 /C "cmd /c del @PATH"
forfiles /P %train_backups%  /M *.log /D -7 /C "cmd /c del @PATH"

REM Deletes any restore log files older than 7 days from todays date
REM Setup a network share first to access the Restore folder on DBMSMain
REM net use R: \\DBMSMain\Restore /user:DBMSMain\SolaShare %sharePword%
REM forfiles /P %training%  /M *.log /D -7 /C "cmd /c del @PATH"