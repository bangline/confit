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
alias brc='bin/rails console'
alias brr='bin/rails routes'
alias brdb='bin/rails db:migrate'
alias brdbs='bin/rails db:migrate:status'
alias brdbt='bin/rails db:test:prepare'
alias brg='bin/rails generate'
alias bd='bin/dev'
alias tst='cmdp bin/rails test'

# Bundler
alias be='bundle exec'
alias cop='bundle exec rubocop'

# lazygit / lazydocker
alias lzg='lazygit'
alias lzd='lazydocker'

# zsh config
alias zshconfig='$EDITOR ${ZDOTDIR}/.zshrc'
alias zshreload='source ${ZDOTDIR}/.zshrc'
