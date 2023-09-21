#!/usr/bin/env zsh

export CARGO_HOME="$HOME/.local/share/cargo"
export RUSTUP_HOME="$HOME/.local/share/rustup"

if [[ ! -d "$CARGO_HOME" ]] && [[ ! -d "$RUSTUP_HOME" ]] then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

source "$CARGO_HOME/env"
