ZSH_CONFIG_DIR="$HOME/.config/zsh"

source "$ZSH_CONFIG_DIR/env.zsh"
source "$ZSH_CONFIG_DIR/oh-my-zsh.zsh"

bindkey -v

[ -s "/home/linuxbrew/.linuxbrew/bin/brew" ] &&  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

source "$ZSH_CONFIG_DIR/ruby.zsh"
source "$ZSH_CONFIG_DIR/perl.zsh"
source "$ZSH_CONFIG_DIR/nvm.zsh"

source "$ZSH_CONFIG_DIR/prompt.zsh"
source "$ZSH_CONFIG_DIR/alias.zsh"
