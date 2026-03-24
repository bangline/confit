HISTFILE="$HOME/.local/share/zsh/history"
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY       # Write timestamps to history
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first
setopt HIST_IGNORE_DUPS       # Don't record consecutive duplicates
setopt HIST_IGNORE_ALL_DUPS   # Delete old duplicate when new added
setopt HIST_IGNORE_SPACE      # Don't record entries starting with space
setopt HIST_FIND_NO_DUPS      # No duplicates when searching
setopt HIST_REDUCE_BLANKS     # Remove extra blanks
setopt INC_APPEND_HISTORY     # Write immediately, not on exit
setopt SHARE_HISTORY          # Share history across sessions

# fzf integration (built-in zsh support)
source <(fzf --zsh)
