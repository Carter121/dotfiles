# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
#####################################################################
# DO NOT TOUCH ANYTHING ABOVE THIS LINE!
#####################################################################

# Lang stuff
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load completions
autoload -U compinit && compinit

# Keybinds
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '`' autosuggest-accept

# Aliases
alias ls="ls --color"
alias vim="nvim"
alias restart-powerdevil="systemctl --user restart plasma-powerdevil.service"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUPE=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Poetry (Python packages)
export PATH="/home/carter/.local/bin:$PATH"

# Fli.Io
export FLYCTL_INSTALL="/home/carter/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Bundler (Gem/Ruby)
export GEM_HOME=$HOME/.gem
  
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Git
export GIT_EDITOR=nvim

# pnpm
export PNPM_HOME="/home/carter/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Ruby
export PATH="/home/carter/.gem/ruby/3.3.0/bin:$PATH"

# Canvas
export CANVAS_SKIP_DOCKER_USERMOD=1

# Use nvim as visual editor
export VISUAL="nvim"

# Spoofdpi
export PATH=$PATH:~/.spoofdpi/bin

# Allow crtl+{Arrow Key}
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
