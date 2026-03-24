autoload -Uz add-zsh-hook

# Get the current git branch, or tag, or short SHA for detached HEAD
_git_branch() {
  local ref
  ref=$(git symbolic-ref --short HEAD 2>/dev/null) && { echo "$ref"; return; }
  ref=$(git describe --tags --exact-match HEAD 2>/dev/null) && { echo "$ref"; return; }
  ref=$(git rev-parse --short HEAD 2>/dev/null) && echo "$ref"
}

# Check if the working tree is dirty (same method as oh-my-zsh parse_git_dirty)
_git_dirty() {
  [[ -n $(git status --porcelain 2>/dev/null) ]]
}

# Build the git portion of the prompt
_git_prompt_info() {
  local branch
  branch=$(_git_branch)
  [[ -z "$branch" ]] && return

  local dirty=""
  if _git_dirty; then
    dirty=" %{$fg[yellow]%}✗%{$reset_color%}"
  fi

  echo " %{$fg[blue]%}git:(%{$fg[red]%}${branch}%{$fg[blue]%})%{$reset_color%}${dirty}"
}

_build_prompt() {
  local exit_code=$?
  local arrow
  if [[ $exit_code -eq 0 ]]; then
    arrow="%{$fg_bold[green]%}➜%{$reset_color%}"
  else
    arrow="%{$fg_bold[red]%}➜%{$reset_color%}"
  fi

  PROMPT="${arrow}  %{$fg[cyan]%}%c%{$reset_color%}$(_git_prompt_info) "
}

autoload -Uz colors && colors
setopt PROMPT_SUBST
add-zsh-hook precmd _build_prompt
