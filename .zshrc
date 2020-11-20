# Path to your oh-my-zsh installation.
export ZSH="/Users/anthonyyarbrough/.oh-my-zsh"
export GIT_EDITOR=nvim
export ZSH_DISABLE_COMPFIX="true"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  vi-mode
)

alias sl="exa"
alias ls="exa"
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh
