#!/usr/bin/env bash

export DOTFILES_PATH="${HOME}/Development/dotfiles"

stow -t $HOME git
stow -t $HOME nvim
stow -t $HOME tig
stow -t $HOME qtile
