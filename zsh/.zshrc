zstyle ':omz:plugins:nvm' autoload yes

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

## Neovim Alias ##
if [[ -x "$(command -v nvim)" ]]; then
  alias vi=nvim
  alias vim=nvim
fi
## Neovim Alias ##

## Ruby ##
if [[ -x "$(command -v ruby)" ]]; then
  export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
  export PATH="$PATH:$GEM_HOME/bin"
fi
## Ruby ##

# Perl
PERL5_DIR="${HOME}/.perl5"
PATH="${PERL5_DIR}/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="${PERL5_DIR}/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${PERL5_DIR}${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${PERL5_DIR}\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${PERL5_DIR}"; export PERL_MM_OPT;

# Add local scripts to path
export PATH="$PATH:$HOME/.local/bin"


## Default Apps ##
export EDITOR=nvim
export BROWSER=firefox
## Default Apps ##

## Node Version Manager ##
export NVM_DIR="$HOME/.local/share/nvm"

# MacOS #
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Debian (homebrew) #
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
## Node Version Manager ##

[[ -n "$SSH_CONNECTION" ]] && PROMPT="%{$fg_bold[red]%}[%m] ${PROMPT}"
