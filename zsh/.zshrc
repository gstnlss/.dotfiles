NVM_AUTOLOAD=1

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

if [[ ! -d "$ZSH" ]]; then
  CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Enable command auto-correction.
ENABLE_CORRECTION="false"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
plugins=(git nvm docker docker-compose)

source $ZSH/oh-my-zsh.sh

bindkey -v

# Useful aliases if neovim is installed
if [[ -x "$(command -v nvim)" ]]; then
  alias vi=nvim
  alias vim=nvim
fi

# Add gems to path
if [[ -x "$(command -v ruby)" ]]; then
  export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
  export PATH="$PATH:$GEM_HOME/bin"
fi

# Add local scripts to path
export PATH="$PATH:$HOME/.local/bin"
export EDITOR=nvim

NVM_INIT_PATH=/usr/share/nvm/init-nvm.sh
[[ -f "$NVM_INIT_PATH" ]] && source $NVM_INIT_PATH

[[ -n "$SSH_CONNECTION" ]] && PROMPT="%{$fg_bold[red]%}[%m] ${PROMPT}"

[[ -x "$(command -v task)" ]] && task
