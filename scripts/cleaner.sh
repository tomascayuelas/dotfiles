#!/bin/bash
# title			: cleaner.sh
# description   : Cleaner your trash files
# author		: Tomas Cayuelas @tomascayuelas
# date			: 2013-13-02
# version		: 0.1
# usage			: ./cleaner

# Messages
MSG_01="Cleaned!"
USER="$HOME"

# Directories to clean
DOWNLOADS="${FOLDER_USER}/Descargas"
TMP="/tmp"

# Array declarations for remove
FOLDERS=( $DOWNLOADS $TMP )

# Cleaning
for i in ${FOLDERS[@]}; do
	sudo rm -fr $i/*
	echo "--> ${i} ${MSG_01}"
done