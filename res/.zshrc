# Auto-configurations from P10K
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Don't modify above

# PATHS
export PATH="$HOME/scripts:$PATH"
export TMUX_CONF=~/.config/tmux/tmux.conf
export PATH="$PATH:/opt/nvim-linux64/bin"
# Go Path
# export GOPATH=$HOME/go
# export PATH=$GOPATH/bin:$PATH
# export PATH=$PATH:$(go env GOPATH)/bin

# GDrive
GDRIVEDIR=/mnt/g
if [ ! -d "$GDRIVEDIR" ]; then
  echo "$GDRIVEDIR does not exist, creating folder"
  sudo mkdir /mnt/g
fi
if ! mountpoint -q "$GDRIVEDIR"; then
  sudo mount -t drvfs G: "$GDRIVEDIR"
fi

# ZSH Plugin Manager
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Plugins
## Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
## zoxide
zinit ice wait"2" as"command" from"gh-r" lucid \
  mv"zoxide*/zoxide -> zoxide" \
  atclone"./zoxide init zsh > init.zsh" \
  atpull"%atclone" src"init.zsh" nocompile'!'
zinit light ajeetdsouza/zoxide
eval "$(zoxide init zsh)"


# Plugin Configurations
## Load completions
autoload -Uz compinit && compinit
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# Other configurations
## History
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
## Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
## Shell integrations
eval "$(fzf)"
eval "$(zoxide init --cmd cd zsh)"
## Fzf
# export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
## Setup fzf previews
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"
## fzf preview for tmux
export FZF_TMUX_OPTS=" -p90%,70% "


# Aliases and Snipppets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
alias c=clear
alias ls="eza --all --no-filesize --long --color=always --icons=always --no-user"
alias vim=nvim # just for the muscle memory
alias nv=nvim

alias obsidian='cd "$GDRIVEDIR/O meu disco/DRIVE/GAB" && echo $(basename "$PWD")'
alias programming='cd "$GDRIVEDIR/O meu disco/DRIVE/GAB/Estudos-Trabalhos/PROGRAMAÇÃO" && echo $(basename "$PWD")'
alias studies='cd "$GDRIVEDIR/O meu disco/DRIVE/GAB/Estudos-Trabalhos/PROGRAMAÇÃO/programming-studies" && echo $(basename "$PWD")'


### Don't modify below

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
