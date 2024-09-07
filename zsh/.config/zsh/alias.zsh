if [[ -x "$(command -v nvim)" ]]; then
  alias vi=nvim
  alias vim=nvim
fi

if [[ -x "$(command -v xbps-install)" ]]; then
  alias xi="sudo xbps-install"
fi

if [[ -x "$(command -v xbps-remove)" ]]; then
  alias xr="sudo xbps-remove"
fi

if [[ -x "$(command -v xbps-query)" ]]; then
  alias xq="xbps-query"
fi

