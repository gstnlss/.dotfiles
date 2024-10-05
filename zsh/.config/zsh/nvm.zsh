#!/usr/bin/env zsh

export NVM_DIR="$HOME/.local/share/nvm"
DEFAULT_NODE_VERSION="v20"

if [[ ! -d "$NVM_DIR" ]] then
  mkdir -p "$NVM_DIR"
  PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash'
fi

[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"
[[ "$(nvm current)" == 'none' ]] && nvm install "$DEFAULT_NODE_VERSION" 
