export ZSH="/Users/anthonyyarbrough/.oh-my-zsh"
export ZSH_DISABLE_COMPFIX=true
export GIT_EDITOR=nvim

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    vi-mode
)

source $ZSH/oh-my-zsh.sh

alias sl="exa"
alias ls="exa"
alias cd..="cd .."
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias dc="docker-compose"

# Commands to run at start
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path additions
export PATH=/Users/anthonyyarbrough/go/bin:$PATH
