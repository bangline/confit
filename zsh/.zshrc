export PATH="$HOME/.local/bin:$HOME/.config/bin:$PATH"
eval "$(/opt/homebrew/bin/mise activate zsh)"

source "${ZDOTDIR}/prompt.zsh"
source "${ZDOTDIR}/completion.zsh"
source "${ZDOTDIR}/history.zsh"
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/directory.zsh"

setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt MULTIOS
