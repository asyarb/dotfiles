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
alias wwssh="ssh -i ~/.ssh/ww_id_rsa"
alias wwssh2="ssh -i ~/.ssh/ww_id_rsa_old"

# Commands to run at start
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path additions
export GO_HOME=/Users/anthonyyarbrough/go/bin

# Export Path
export PATH=$GO_HOME:$PATH
