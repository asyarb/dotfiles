# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
zinit ice depth=1; 

# Add in zsh plugins
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Aliases
alias mkdir="mkdir -pv"
alias cd..="cd .."
alias ..="cd .."
alias wget="wget -c"
alias ls="eza --icons"
alias sl="eza --icons"
alias wwssh="ssh -i ~/.ssh/ww_id_rsa"
alias wwssh2="ssh -i ~/.ssh/ww_id_rsa_old"
alias dc='docker compose'
alias open="explorer.exe"
alias trash="rm -rf"
alias termconf="nvim /mnt/c/Users/Anthony/AppData/Local/Packages/Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe/LocalState/settings.json"
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons $realpath'

# Path stuff
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/home/asyarb/go/bin:$PATH"
export PATH="/home/asyarb/.turso:$PATH"
export PATH=/home/asyarb/.sst/bin:$PATH
export PATH="/opt/nvim-linux64/bin:$PATH"
export PNPM_HOME="/home/asyarb/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Local postgres stuff
alias pg="sudo -u postgres psql"
alias pg-start="sudo service postgresql start"
alias pg-stop="sudo service postgresql stop"
alias pg-restart="sudo service postgresql restart"
alias pg-status="sudo service postgresql status"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/asyarb/.bun/_bun" ] && source "/home/asyarb/.bun/_bun"

