# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="amuse"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git fzf aws kubectl docker z nvm)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

scriptsPath="${HOME}/.scripts"
cargoBinPath="${HOME}/.cargo/bin"
localBinPath="${HOME}/.local/bin"
rubyBinPath="${HOME}/.gem/ruby/2.7.0/bin"

# User configuration
export LANG=en_US.UTF-8
export PATH=$rubyBinPath:$scriptsPath:$cargoBinPath:$localBinPath:$PATH
export JAVA_HOME=/usr/lib/jvm/default
export WIRELESS="wlp2s0"
export ETHERNET="enp0s20f0u1u3"
export SBT_NATIVE_CLIENT=true

# Aliases
alias vim="lvim"
alias e="lvim"
alias nvim="lvim"
alias ls="exa"
alias ll="exa -lhag -snew --icons"
alias catp="bat -p"
alias cat="bat"
alias htop="btop"
alias docker-compose="docker compose"
alias edotfiles="nvim $HOME/Sources/dotfiles"

alias luamake=/home/tomascayuelas/.config/nvim/lua/nvim/plugins/lua-language-server/3rd/luamake/luamake

function aws-profile() {
    PRF=$(cat $HOME/.aws/credentials|grep "^\["|sed "s/\[//"|sed "s/]$//"|percol --prompt='<green>Select the aws enviroment:</green> %q')
    export AWS_PROFILE=$PRF
    export AWS_DEFAULT_REGION=us-east-1
}

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
