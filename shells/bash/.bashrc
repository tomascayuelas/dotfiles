#!/bin/bash

PROMPT_COMMAND="cool_theme"

FIRST_CHARACTER="(O_o)$>"

cool_theme() {
  current_dir=$(pwd)

  export PS1="${FIRST_CHARACTER} ${current_dir} "
}

source ${DOTFILES_PATH}/shells/env/alias.sh
source ${DOTFILES_PATH}/shells/env/exports.sh
