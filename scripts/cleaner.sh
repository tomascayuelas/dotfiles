#!/usr/bin/env bash
# title: cleaner.sh
# description: Cleaner your trash files
# author: Tomas Cayuelas @tomascayuelas
# date: 2013-13-02
# version 0.1
# usage: ./cleaner

# Directories to clean
downloadsPath="${HOME}/Downloads/"
tmpPath="/tmp/"
varTmpPath="/var/tmp/"

# Array declarations for remove
allFolderToClean=( $tmpPath $varTmpPath $downloadsPath )

# Cleaning
for i in ${allFolderToClean[@]}; do
	sudo rm -fr $i/*
	echo ">> Cleaned [${i}]"
done