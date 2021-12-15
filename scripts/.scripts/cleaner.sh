#!/usr/bin/env bash

downloadsPath="${HOME}/Downloads/"
tmpPath="/tmp/"

# Array declarations for remove
allFolderToClean=( $tmpPath $downloadsPath )

# Cleaning
for i in ${allFolderToClean[@]}; do
	sudo rm -fr $i/*
	echo ">> Cleaned [${i}]"
done
