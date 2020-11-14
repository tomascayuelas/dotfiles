#!/usr/bin/env bash

export DOTFILES_PATH="${HOME}/Development/dotfiles"

function checker()
{
    local ORIG=$1
    local DEST=$2

    if [[ -d "${DEST}" || -f "${DEST}" || -L "${DEST}" ]]; then
	echo "> ${DEST} already exists, what do you want?" 
	echo " b. Backup"
	echo " r. Replace"

	read -n 1 -p "> What do you want: " selected
	echo -e "\n"

	case "$selected" in
	    "b")
		tar -cvpzf ${DEST}-backup.tar.gz ${DEST}
		;;
	    "r")
		rm -fr ${DEST}
		return 0
	        ;;	
	    *)
		echo "Invalid input, try again... :cross_finger:"
		checker $ORIG $DEST
		;;
	esac
    fi
}

function lnCommand()
{
    local ORIG=${DOTFILES_PATH}/$1
    local DEST=${HOME}/$2

    checker $ORIG $DEST
    ln -sf $ORIG $DEST
}

function git()
{
    lnCommand git/.gitconfig .gitconfig
    lnCommand git/.gitignore_global .gitignore_global
    lnCommand git/.gitattributes .gitattributes
}

function nvim()
{
  lnCommand nvim .config/nvim
}

function tig()
{
    lnCommand tig/.tigrc .tigrc
}

git
nvim
tig
