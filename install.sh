#!/bin/bash

export DOTFILES_PATH="${HOME}/Development/Own/dotfiles"

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
  rm -irfv ${HOME}/.config/i3
  ln -s -i ${DOTFILES_PATH}/i3 $HOME/.config/i3
}

function xinitrc()
{
  ln -s -i ${DOTFILES_PATH}/X/.xinitrc $HOME/.xinitrc
}

<<<<<<< HEAD
function xresources()
{
  ln -s -i ${DOTFILES_PATH}/X/.Xresources.d $HOME/
  ln -s -i ${DOTFILES_PATH}/X/.Xresources $HOME/.Xresources
}

function karabiner()
{
  ln -s -i ${DOTFILES_PATH}/mac/karabiner $HOME/.config/karabiner
}

=======
>>>>>>> fe8d7fd31d7f5c276849abf503d32b52a24db2ac
bash
vimEditor
git
i3wm
xinitrc
karabiner
