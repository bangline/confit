# ls
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lAh'
alias lt='ls -lhtr'

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Navigation
alias ..='cd ..'

# Grep
alias grep='grep --color=auto'

# Rails / dev
alias br='bin/rails'
alias brt='bin/rails test'
alias bd='bin/dev'

# lazygit / lazydocker
alias lzg='lazygit'
alias lzd='lazydocker'

# zsh config
alias zshconfig='$EDITOR ${ZDOTDIR}/.zshrc'
alias zshreload='source ${ZDOTDIR}/.zshrc'
