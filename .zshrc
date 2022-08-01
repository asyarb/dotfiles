# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/asyarb/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Make some CLI commands less horrific to use
alias mkdir="mkdir -pv"
alias cd..="cd .."
alias wget="wget -c"

# Modern CLI tool equivalents
alias sl="exa"
alias ls="exa"
alias bat="batcat"
alias fd="fdfind"

# Custom commands
alias open="explorer.exe"
alias trash="rm -rf"

alias termconf="nvim /mnt/c/Users/Anthony/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json"

# ZSH stuff
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# SSH aliases
alias wwssh="ssh -i ~/.ssh/ww_id_rsa"
alias wwssh2="ssh -i ~/.ssh/ww_id_rsa_old"

# PATH additions because... this is how I know to do it
export NPM_GLOBAL="/home/asyarb/.npm-global/bin"
export RBENV="/home/asyarb/.rbenv/bin"
GO="/usr/local/go/bin"

export PATH="$NPM_GLOBAL:$GO:$RBENV:$PATH"

# RBEnv polluting my config
eval "$(rbenv init - zsh)"

# FZF
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
