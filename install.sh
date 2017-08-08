#!/bin/sh

dotfilesPath="${HOME}/Development/Sources/Own/dotfiles"

i3PathOrigin="${dotfilesPath}/i3"
gitPathOrigin="${dotfilesPath}/git"
intellijPathOrigin="${dotfilesPath}/intellij"

# I3WM
ln -s -i $i3PathOrigin $HOME/.config/i3

# Git (DVCS)
ln -s -i ${gitPathOrigin}.gitconfig        $HOME/.gitconfig
ln -s -i ${gitPathOrigin}.gitignore_global $HOME/.gitignore_global
ln -s -i ${gitPathOrigin}.giattributes     $HOME/.giattributes

# IntelliJ
# sudo ln -s -i ${intellijPathOrigin}/idea.vmoptions $HOME/IntelliJIdea2016.3/idea.vmoptions
