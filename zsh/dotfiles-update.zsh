_dotfiles_update_check() {
  local config_dir="$HOME/.config"

  # Run in a subshell so fetch errors don't affect the shell session
  if ! git -C "$config_dir" fetch --quiet origin 2>/dev/null; then
    return
  fi

  local behind
  behind=$(git -C "$config_dir" rev-list --count HEAD..origin/main 2>/dev/null)

  if [[ "$behind" -gt 0 ]]; then
    echo "dotfiles: $behind commit(s) behind origin/main"
    echo -n "Pull now? [y/N] "
    read -r _reply
    if [[ "$_reply" =~ ^[Yy]$ ]]; then
      git -C "$config_dir" pull --ff-only origin main
      "$config_dir/bin/zed-merge"
      echo "Reloading shell..."
      exec zsh -l
    fi
    unset _reply
  fi
}

_dotfiles_update_check
unset -f _dotfiles_update_check
