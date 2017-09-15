#!/usr/bin/env bash

userName=$USER
machineName=`uname -n`
timestamp=`date +%Y%m%d-%H%M`

sourceDirectory=$1
nameDirectory=$2
destinationDirectory="/run/media/tomascayuelas/c0d3r_extra/Backups/${machineName}"

fileName="${machineName}-${nameDirectory}"

developmentFolder=""
documentsFolder=""
imagesFolder=""
musicFolder=""

# Array declarations for remove
allFolderToClean=( $tmpPath $varTmpPath $downloadsPath )

# Cleaning
for i in ${allFolderToClean[@]}; do

# let's create a variable for the log file, let's also name the log file with the filename and timestamp it
logFile="${HOME}/log/$fileName-$timestamp.log"

# start the backup, create a log file which will record any messages run by this script
echo -e "Starting backup of $userName $sourceDirectory directory" >> ${logFile}

# compress the directory and files, direct the tar.gz file to your destination directory
tar -vczf ${destinationDirectory}/${fileName}-${timestamp}.tar.gz ${sourceDirectory} >> ${logFile}

# end the backup, append to log file created by this script
echo -e "Ending backup of $userName $sourceDirectory" >> ${logFile}

done
