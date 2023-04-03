zstyle ':omz:plugins:nvm' autoload yes

export ZSH="$HOME/.local/share/oh-my-zsh" # Path to your oh-my-zsh installation.

if [[ ! -d "$ZSH" ]]; then
  CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_THEME="robbyrussell" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
DISABLE_UPDATE_PROMPT="true" # Automatically update without prompting.
ENABLE_CORRECTION="false" # Enable command auto-correction.
COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion.

plugins=(git nvm docker docker-compose)

source $ZSH/oh-my-zsh.sh
