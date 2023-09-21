#!/usr/bin/env zsh

export RBENV_ROOT="$HOME/.local/share/rbenv"
export RBENV_DIR="$RBENV_ROOT"

if [[ ! -d "$RBENV_ROOT" ]] then
  git clone https://github.com/rbenv/rbenv.git "$RBENV_ROOT"
  git clone https://github.com/rbenv/ruby-build.git "$RBENV_ROOT/plugins/ruby-build"
fi

eval "$($RBENV_ROOT/bin/rbenv init - zsh)"
