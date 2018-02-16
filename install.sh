#!/bin/bash


function checkDotfilePathEnv()
{
    messageDotfileNotFound="DotfilePath not found"
    if [[ ! -v "DOTFILES_PATH" ]]; then
      echo $messageDotfileNotFound
      exit
    fi
}

checkDotfilePathEnv
dotfilesPath="$DOTFILES_PATH"

i3PathOrigin="${dotfilesPath}/i3"
gitPathOrigin="${dotfilesPath}/git"
intellijPathOrigin="${dotfilesPath}/intellij"

# I3WM
ln -sf $i3PathOrigin/config $HOME/.config/i3/config
ln -sf $i3PathOrigin/i3blocks.conf $HOME/.config/i3/i3blocks.conf
ln -sf $i3PathOrigin/scripts $HOME/.config/i3/scripts


# Git (DVCS)
ln -sf ${gitPathOrigin}/.gitconfig        $HOME/.gitconfig
ln -sf ${gitPathOrigin}/.gitignore_global $HOME/.gitignore_global
ln -sf ${gitPathOrigin}/.gitattributes     $HOME/.gitattributes

# IntelliJ
# sudo ln -s -i ${intellijPathOrigin}/idea.vmoptions $HOME/IntelliJIdea2016.3/idea.vmoptions
