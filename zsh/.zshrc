ZSH_CONFIG_DIR="$HOME/.config/zsh"

source "$ZSH_CONFIG_DIR/env.zsh"
source "$ZSH_CONFIG_DIR/oh-my-zsh.zsh"

bindkey -v

source "$ZSH_CONFIG_DIR/ruby.zsh"
source "$ZSH_CONFIG_DIR/perl.zsh"
source "$ZSH_CONFIG_DIR/nvm.zsh"
source "$ZSH_CONFIG_DIR/rust.zsh"
source "$ZSH_CONFIG_DIR/go.zsh"

source "$ZSH_CONFIG_DIR/prompt.zsh"
source "$ZSH_CONFIG_DIR/alias.zsh"
source "$ZSH_CONFIG_DIR/bindkey.zsh"
