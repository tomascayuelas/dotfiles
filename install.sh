#!/bin/bash

DOTFILES_PATH="${HOME}/Development/Sources/Own/dotfiles"

function checkDotfilePathEnv()
{
    messageDotfileNotFound="DotfilePath not found"
    if [[ ! -v "DOTFILES_PATH" ]]; then
      echo $messageDotfileNotFound
      exit
    fi
}

function bash()
{
  ln -s -i ${DOTFILES_PATH}/shells/bash/.bashrc $HOME/.bashrc
  ln -s -i ${DOTFILES_PATH}/shells/bash/.bash_profile $HOME/.bash_profile
}

function vimEditor()
{
  ln -s -i ${DOTFILES_PATH}/editors/vim/.vimrc $HOME/.vimrc
}

function git()
{
  ln -s -i ${DOTFILES_PATH}/git/.gitconfig $HOME/.gitconfig
  ln -s -i ${DOTFILES_PATH}/git/.gitignore_global $HOME/.gitignore_global
  ln -s -i ${DOTFILES_PATH}/git/.gitattributes $HOME/.gitattributes
}

function i3wm()
{
  ln -s -i ${DOTFILES_PATH}/i3 $HOME/.config/
}

function xinitrc()
{
  ln -s -i ${DOTFILES_PATH}/X/.xinitrc $HOME/.xinitrc
}

function xresources()
{
  ln -s -i ${DOTFILES_PATH}/X/.Xresources.d $HOME/.Xresources.d
  ln -s -i ${DOTFILES_PATH}/X/.Xresources $HOME/.Xresources
}

bash
vimEditor
git
i3wm
xresources
xinitrc
