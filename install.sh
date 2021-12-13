#!/bin/bash

function link(){
  if [[ -L "$HOME/$2" && -d "$(readlink $HOME/$2)" ]]; then
    echo ">> Removed file or symlink"
    rm -f $HOME/$2
  fi

  echo ">> Install: $1 to $2"
  ln -sf $PWD/$1 $HOME/$2
}

# Desktop Environment
link desktop-environment/herbstluftwm .config/herbstluftwm
link desktop-environment/polybar .config/polybar
link desktop-environment/dunst .config/dunst
link desktop-environment/rofi .config/rofi
link desktop-environment/x11/.xinitrc .xinitrc
link desktop-environment/x11/.Xresources .Xresources

# Editors
link editors/nvim .config/nvim

# Shells
link shells/zsh/.zshrc .zshrc

# Terminals
link terminals/alacritty .config/alacritty

# VCS
link vcs/git .config/git

# Scripts
link scripts .scripts
