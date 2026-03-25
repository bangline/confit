cmdp() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: cmdp <command> [args...]"
    return 1
  fi

  local cmd="$*"

  while true; do
    clear
    echo "$ $cmd"
    echo ""
    eval "$cmd"
    local exit_code=$?
    echo ""
    if [[ $exit_code -eq 0 ]]; then
      echo "✓ exited $exit_code"
    else
      echo "✗ exited $exit_code"
    fi
    echo ""
    echo "Press Enter to re-run, Esc to quit..."
    while true; do
      read -rsk1
      [[ "$REPLY" == $'\e' ]] && return
      [[ "$REPLY" == $'\n' ]] && break
    done
  done
}
