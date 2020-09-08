#!/bin/bash

export DOTFILES_PATH="${HOME}/Development/dotfiles"

function git()
{
  ln -s -i ${DOTFILES_PATH}/git/.gitconfig $HOME/.gitconfig
  ln -s -i ${DOTFILES_PATH}/git/.gitignore_global $HOME/.gitignore_global
  ln -s -i ${DOTFILES_PATH}/git/.gitattributes $HOME/.gitattributes
}

function nvim()
{
  ln -s -i $DOTFILES_PATH/nvim $HOME/.config/nvim
}

git
nvim
