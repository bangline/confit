export PATH="$HOME/.local/bin:$HOME/.config/bin:$PATH"
eval "$(/opt/homebrew/bin/mise activate zsh)"

source "${ZDOTDIR}/prompt.zsh"
source "${ZDOTDIR}/completion.zsh"
source "${ZDOTDIR}/history.zsh"
source "${ZDOTDIR}/aliases.zsh"
source "${ZDOTDIR}/functions.zsh"
source "${ZDOTDIR}/directory.zsh"

setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt MULTIOS

# Machine-local extensions — mirror directory structure under ~/.config/extensions/
for _ext_file in "${HOME}/.config/extensions/zsh"/*.zsh(N); do
  source "$_ext_file"
done
unset _ext_file
