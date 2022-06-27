NVM_AUTOLOAD=1

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
plugins=(git nvm docker docker-compose)

source $ZSH/oh-my-zsh.sh

bindkey -v

# Add gems to path
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# Add local scripts to path
export PATH="$PATH:$HOME/.local/bin"

export EDITOR=nvim

if [[ -z "${WSL_DISTRO_NAME}" ]]; then
    # Init nvm (manjaro)
    source /usr/share/nvm/init-nvm.sh

    task
fi
