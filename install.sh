#!/bin/bash

export DOTFILES_PATH="${HOME}/Development/Own/dotfiles"

function git()
{
  ln -s -i ${DOTFILES_PATH}/git/.gitconfig $HOME/.gitconfig
  ln -s -i ${DOTFILES_PATH}/git/.gitignore_global $HOME/.gitignore_global
  ln -s -i ${DOTFILES_PATH}/git/.gitattributes $HOME/.gitattributes
}

function i3wm()
{
  rm -irfv ${HOME}/.config/i3
  ln -s -i ${DOTFILES_PATH}/i3 $HOME/.config/i3
}

function nvim()
{
  ln -s -i $DOTFILES_PATH/nvim $HOME/.config/nvim
}

function xresources()
{
  ln -s -i ${DOTFILES_PATH}/X/.Xresources.d $HOME/
  ln -s -i ${DOTFILES_PATH}/X/.Xresources $HOME/.Xresources
}

function karabiner()
{
  ln -s -i ${DOTFILES_PATH}/mac/karabiner $HOME/.config/karabiner
}

git
nvim
