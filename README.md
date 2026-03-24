# Confit

Personal macOS dotfiles managed as a bare `~/.config` repo.

## What's included

| Directory | Tool |
|-----------|------|
| `bin/` | Helper scripts (`install`, `theme`) |
| `ghostty/` | [Ghostty](https://ghostty.org) terminal config |
| `git/` | Git config and global ignore |
| `mise/` | [mise](https://mise.jdx.dev) runtime version manager |
| `nvim/` | Neovim config (LazyVim-based) |
| `themes/` | Theme definitions for the `theme` switcher |
| `tmux/` | tmux config with [TPM](https://github.com/tmux-plugins/tpm) |
| `zsh/` | Zsh config, aliases, prompt, completions |
| `Brewfile` | Homebrew packages and casks |

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

**4. Install tmux plugins**

Open tmux and press `prefix + I` (capital i) to fetch plugins via TPM.

---

## Themes

A `theme` command is available to switch the colour scheme across Ghostty, Neovim, and tmux simultaneously.

```sh
theme list            # list available themes (* = active)
theme <name>          # apply a theme
theme current         # print the active theme
theme search          # browse all Ghostty built-in themes via fzf and add one
theme add             # add a new theme interactively
```

Available themes: `catppuccin-latte`, `catppuccin-mocha`, `dracula`, `rose-pine`, `rose-pine-dawn`, `tokyonight-day`, `tokyonight-night`

---

## Zsh structure

Zsh config lives in `~/.config/zsh/` and is loaded via `ZDOTDIR`:

| File | Purpose |
|------|---------|
| `.zshrc` | Main config, sources the files below |
| `.zprofile` | Login shell env (mise, paths) |
| `aliases.zsh` | Shell aliases |
| `completion.zsh` | Completion setup |
| `directory.zsh` | Directory navigation options |
| `history.zsh` | History settings |
| `prompt.zsh` | Prompt config |
