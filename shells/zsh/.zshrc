# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="pmcgee"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git fzf)

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
export WHEREIAM=$(whereiam)
export SBT_NATIVE_CLIENT=true

# Aliases
alias vim="nvim"
alias e="nvim"
alias ls="exa"
alias ll="exa -lhag -snew --icons"
alias cat="bat"
alias edotfiles="nvim $HOME/Sources/dotfiles" 

alias luamake=/home/tomascayuelas/.config/nvim/lua/nvim/plugins/lua-language-server/3rd/luamake/luamake

function aws-profile() {
    PRF=$(cat $HOME/.aws/credentials|grep "^\["|sed "s/\[//"|sed "s/]$//"|percol --prompt='<green>Select the aws enviroment:</green> %q')
    export AWS_PROFILE=$PRF
    export AWS_DEFAULT_REGION=us-east-1
}
