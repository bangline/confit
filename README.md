# Confit

Personal macOS dotfiles managed as a bare `~/.config` repo.

## What's included

| Directory | Tool |
|-----------|------|
| `bin/` | Helper scripts (`install`, `check`, `theme`) |
| `ghostty/` | [Ghostty](https://ghostty.org) terminal config |
| `git/` | Git config and global ignore |
| `mise/` | [mise](https://mise.jdx.dev) runtime version manager |
| `nvim/` | Neovim config (LazyVim-based) |
| `themes/` | Theme definitions for the `theme` switcher |
| `tmux/` | tmux config with [TPM](https://github.com/tmux-plugins/tpm) |
| `zsh/` | Zsh config, aliases, functions, prompt, completions |
| `Brewfile` | Homebrew packages and casks |

---

## Installation

### Prerequisites

- macOS
- Xcode Command Line Tools: `xcode-select --install`

### Steps

**1. Clone the repo**

```sh
git clone <repo-url> ~/.config
```

**2. Run the install script**

```sh
~/.config/bin/install
```

This will:
- Install [Homebrew](https://brew.sh) if not already present
- Install all packages from the `Brewfile` (tmux, fzf, ripgrep, fd, neovim, lazygit, gh, git, mise, fonts, Ghostty)
- Write `~/.zshenv` to point Zsh at `~/.config/zsh` as `ZDOTDIR`
- Clone [TPM](https://github.com/tmux-plugins/tpm) (tmux plugin manager)
- Create required local directories
- Apply the default theme (catppuccin-mocha)

**3. Restart your terminal**

```sh
exec zsh -l
```

**4. Verify everything is installed**

```sh
~/.config/bin/check         # audit only
~/.config/bin/check --fix   # install and configure anything missing
```

**5. Install tmux plugins**

Open tmux and press `prefix + I` (capital i) to fetch plugins via TPM.

---

## Themes

A `theme` command switches the colour scheme across Ghostty, Neovim, and tmux simultaneously.

```sh
theme list            # list available themes (* = active)
theme <name>          # apply a theme
theme current         # print the active theme
theme search          # browse all Ghostty built-in themes via fzf and add one
theme add             # add a new theme interactively
```

Available themes: `catppuccin-latte`, `catppuccin-mocha`, `dracula`, `rose-pine`, `rose-pine-dawn`, `tokyonight-day`, `tokyonight-night`

---

## Zsh

Config lives in `~/.config/zsh/` and is loaded via `ZDOTDIR`.

### Files

| File | Purpose |
|------|---------|
| `.zshrc` | Main entry point, sources all files below |
| `.zprofile` | Login shell env (Homebrew, mise, PATH) |
| `aliases.zsh` | Shell aliases |
| `functions.zsh` | Shell functions |
| `completion.zsh` | Completion setup |
| `directory.zsh` | Directory navigation options |
| `history.zsh` | History settings |
| `prompt.zsh` | Custom git-aware prompt |

### Aliases

| Alias | Command |
|-------|---------|
| `ll` | `ls -lh` |
| `la` | `ls -lAh` |
| `lt` | `ls -lhtr` |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |
| `.....` | `cd ../../../..` |
| `lzg` | `lazygit` |
| `lzd` | `lazydocker` |
| `zshconfig` | Open `.zshrc` in `$EDITOR` |
| `zshreload` | Re-source `.zshrc` |

### Functions

#### `cmdp`

Runs a command in a persistent re-runnable pane. Useful as a dedicated test/build pane in tmux.

```sh
cmdp bin/rails test
cmdp make build
cmdp npm test
```

After the command exits, the output and exit status are shown. Press **Enter** to re-run, **Esc** to quit.

### Prompt

Custom git-aware prompt showing:
- Arrow in green (success) or red (failure) based on last exit code
- Current directory
- Git branch (red) with dirty indicator (yellow ✗) when there are uncommitted changes

### History

50,000 entries stored in `~/.local/share/zsh/history`, shared across sessions. Duplicates, blank-only entries, and lines prefixed with a space are suppressed. [fzf](https://github.com/junegunn/fzf) is integrated for fuzzy history search (`Ctrl-R`).

### Completion

- Case-insensitive matching
- Menu selection with arrow keys
- Coloured output using `LS_COLORS`
- Grouped results with descriptions
- Completion cache regenerated once per day

---

## tmux

Config in `~/.config/tmux/tmux.conf`. Prefix is `Ctrl-a`.

| Binding | Action |
|---------|--------|
| `prefix + \|` | Split pane horizontally |
| `prefix + -` | Split pane vertically |
| `prefix + h/j/k/l` | Navigate panes (vim-style) |
| `prefix + c` | New window in current path |
| `prefix + r` | Reload tmux config |
| `prefix + I` | Install TPM plugins |

Plugins: [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible), [tmux-yank](https://github.com/tmux-plugins/tmux-yank), [catppuccin/tmux](https://github.com/catppuccin/tmux)
