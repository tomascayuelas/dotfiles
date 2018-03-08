#!/bin/bash

function directories()
{
  alias p='pwd'
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ....='cd ../../..'
  alias .2='cd ../..'
  alias .3='cd ../../..'
  alias .4='cd ../../../..'
  alias ll='exa -l'
  alias lo='exa -l --sort=old'
  alias la='exa -la'
  alias lf='ls -d */'
  alias ctree='exa -T'

  alias tmp='cd /tmp'
  alias own='cd ~/Development/Sources/Own'
  alias dotfiles='cd ~/Development/Sources/Own/dotfiles'
}

function utils()
{
  alias aux='ps aux'
  alias editdotfiles='atom ~/Development/Sources/Own/dotfiles'
}

function php()
{
  alias phprepl='psysh'
  alias phpunit='./vendor/bin/phpunit --colors'
  alias pf='./vendor/bin/phpunit --filter'
  alias behat='./vendor/bin/behat'
  alias bf='./vendor/bin/behat --tags=~skip --tags=~skip -p'
  alias bfp='./vendor/bin/behat --tags=~skip --format=progress -vvv --tags=~skip -p'
}

function git()
{
  alias ga='git add -A'
  alias gc='git c'
  alias gn='git n'
  alias gam='git amend'
  alias gco='git checkout'
  alias gd='git diff --color'
  alias gl='git log --graph --pretty=format:"%Cred%h%Creset %C(yellow)%d%Creset %an: %s - %Creset %Cgreen(%cr, %cd)%Creset" --abbrev-commit --date=iso'
  alias gs='git status -sb'
  alias gf='git fetch --all -p'
  alias gp='git push'
  alias gfp='git push -f'
  alias gpl='git pull'
  alias gmm='git merge master'
  alias gpom='git pull origin master'
  alias gpum='git pull upstream master'
  alias gb='git branch'
  alias gdb='git branch -D'
}

directories
utils
php
git
