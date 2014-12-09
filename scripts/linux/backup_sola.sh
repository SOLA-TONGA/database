#!/bin/bash
#                       SOLA Backup Script (Linux)
#
# Author: Andrew McDowell 
# Date: 03 Mar 2014
# 
# This script uses the PostgreSQL pg_dump utility to create a backup 
# of the SOLA database. It can create 3 different dumps;
# 
# Main (M) > Includes all data except for the _historic tables
# History (H) > Only includes the _historic tables
# Training/Test (T) > Includes all data except the _historic tables and
#       the system.setting table. A second backup is also created that
#       contains the application_historic and service_historic tables.
#       These backups can be restored into the training/test environment.  
#  
# The frequency of the dump can also be indicated by setting the
# name of the subfolder to create the backup in as the third 
# parameter (e.g. 02-Hourly or 03-Daily).  Note that how 
# frequently this script runs is controlled through a scheduled 
# task or cron job. 
# 
# The _historic tables are backed up separately to try and ensure the
# backup for the main SOLA tables remains small so that the backup
# can run very quickly  (i.e. < 1 minute). 
#
# The script will prompt the user (interactive mode) if the -p
# option is provided. The command
# options recognized are 
#   -t: Type of dump (M, H or T)
#   -f: Frequency of dump (01-Base, 02-Hourly, 03-Daily,  
#       04-Development or 05-Train)
#   -p: Runs the script in interactive mode
#   -d: Name of the database to dump
#  
# Examples:
# 1) To produce an hourly backup excluding _historic tables 
#    > ./backup_sola.sh  -t M -f 02-Hourly
# 2) To produce a backup containing ONLY _historic tables 
#    > ./backup_sola.sh -t H -f 03-Daily
# 3) To produce a backup for the Training/Test environment 
#    > ./backup_sola.sh -t T -f 05-Train
# 4) To run the script in interactive mode
#    > ./backup_sola.sh -p
# 
# DATABASE PASSWORD
# PGPASSWORD and PGPASSFILE are no longer accepted by
# postgresql so the only way to authenticate with the 
# database is to use a .pgpass file. The .pgpass file
# must be located in the Home directory of the user running
# the script. The script will notify the user and stop if 
# the .pgpass file does not exist.
#
# The format for each line in the .pgpass file is  
#        host:port:database:username:password
# * can be used as a wildcard.  e.g.
#       locahost:5432:*:postgres:<DB Password>
# The .pgpass file must have rw permissions for the user ONLY!
# e.g. chmod 0600 .pgpass 

# Restoring the SOLA database after an incident
#
# To restore the SOLA database, create an empty database (with PostGIS
# and ossp-uuid extensions installed) and restore the latest
# M backup file (from the 02-Hourly folder) followed by a 
# restore of the latest H backup (from the 03-Daily folder). 
# Note that this may result in some lost history records depending 
# on how frequently the historic backup is run. 
# Documents will also need to be restored - refer to the 
# backup_sola_docs.sh script for details on restoring documents.
#


# Configure variables to use for script:

# The current directory where this command has been executed from
# current_dir=$(pwd) 
current_dir="/opt/sola/backup/scripts"
# Root directory for the database backups 
backup_root_dir="$current_dir/../"
# Default install location for pg_dump on linux/Debian. This location
# may need to be modified if a different version of postgresql
# is being used and/or it is installed in a custom location.
pg_dump="/usr/lib/postgresql/9.3/bin/pg_dump"

# Default DB connection values
host=localhost
port=5432
dbname=sola_prod
username=postgres

prompt=N
type=M
frequency=02-Hourly

# Capture options from the command line
OPTIND=1 # Reset for getopts in case it was used previously.
while getopts "ht:f:pd:" opt; do
  case $opt in
    t) type=$OPTARG
       ;;
    f) frequency=$OPTARG
       ;;
    h) echo "Valid options: -t <type> -f <frequency> -d <database name>" 
       exit 0
       ;;
    p) prompt=Y
       ;;
    d) dbname=$OPTARG
       ;;
    \?) echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    :) echo "Option -$OPTARG requires an argument." >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND-1)) # Shift off the options and optional --.

# Check if the script should run interactively
if [ $prompt == "Y" ]; then
   read -p "What type of backup? - M Main, H History, T Training [$type] : " input
   type=${input:-$type}
   read -p "Set frequency subdirectory - 02-Hourly or 03-Daily [$frequency] : " input
   frequency=${input:-$frequency}
fi

# Obtain a formatted date to use in the file names
datestr=$(date +"%Y%m%d_%H%M")

BACKUP_FILE="$backup_root_dir$frequency/sola-$type-$datestr.backup"
BACKUP_LOG="$backup_root_dir$frequency/sola-$type-$datestr.log"
BACKUP_FILE_TRAIN="$backup_root_dir$frequency/sola-$type-main.backup"
BACKUP_FILE_HIST="$backup_root_dir$frequency/sola-$type-hist.backup"
PGPASS="$HOME/.pgpass"
 
 # Start the backup
echo
echo 
echo "Starting Backup at $(date)"
echo "Starting Backup at $(date)" > $BACKUP_LOG 2>&1
echo "Backup File = $BACKUP_FILE"
echo "Backup File = $BACKUP_FILE" >> $BACKUP_LOG 2>&1

# Determine if the .pgpass file exists.
if [ ! -f  $PGPASS]; then
   echo "$PGPASS does not exist! - Exiting"
   echo "$PGPASS does not exist! - Exiting" >> $BACKUP_LOG 2>&1
   exit 1
fi

if [ $type == "M" ]; then
   # Dump all tables except the document schema tables
   # and any _historic tables.
   echo "Dumping Main..."
   echo "Dumping Main..." >> $BACKUP_LOG 2>&1

   $pg_dump -h $host -p $port -U $username -d $dbname -F c -b -v \
            -N document -T *.*_historic -f $BACKUP_FILE >> $BACKUP_LOG 2>&1

fi

if [ $type == "H" ]; then
   # Dump all _historic tables except those in the document schema
   echo "Dumping History..."
   echo "Dumping History..." >> $BACKUP_LOG 2>&1

    $pg_dump -h $host -p $port -U $username -d $dbname -F c -b -v \
             -N document -t *.*_historic -f $BACKUP_FILE >> $BACKUP_LOG 2>&1  
fi 

if [ $type == "T" ]; then
   # Dump all tables except the document schema tables,
   # _historic tables and system.setting
   echo "Dumping Training..."
   echo "Dumping Training..." >> $BACKUP_LOG 2>&1
   $pg_dump -h $host -p $port -U $username -d $dbname -F c -b -v \
            -N document -T *.*_historic -T system.setting \
            -f $BACKUP_FILE_TRAIN >> $BACKUP_LOG 2>&1  

   # Dump the two _historic tables used for generation of
   # the lodgement report in training
   echo "Dumping Training History..."
   echo "Dumping Training History..." >> $BACKUP_LOG 2>&1
   $pg_dump -h $host -p $port -U $username -d $dbname -F c -b -v \
            -t application.application_historic -t application.service_historic \
            -f $BACKUP_FILE_HIST >> $BACKUP_LOG 2>&1 
   
fi 

# Report the finish time
echo "Finished at $(date)"
echo "Finished at $(date)" >> $BACKUP_LOG 2>&1


