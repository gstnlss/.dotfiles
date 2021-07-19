export PATH="$PATH:$HOME/.local/bin" 

# Path to your oh-my-zsh installation.
export ZSH="/home/agustin/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ -n $SSH_CONNECTION ]]; then
  PROMPT="%{$fg_bold[red]%}[ssh:%m] ${PROMPT}"
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

alias grep='grep --color=auto'
alias ip='ip --color=auto'

export STOW_FOLDERS=(nvim zsh)

bindkey -v
