autoload -Uz compinit

# Only regenerate compdump once per day
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Menu selection with arrow keys
zstyle ':completion:*' menu select

# Colored completions from LS_COLORS
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Group results with descriptions
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches --%f'

# Completion caching
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${ZDOTDIR}/.zcompcache"
