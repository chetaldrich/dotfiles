# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

```sh
# Bootstrap a new machine
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply chetaldrich

# Or if chezmoi is already installed
make apply
```

## Structure

```
~/code/dotfiles/
├── dot_zshrc                          # oh-my-zsh, bullet-train theme
├── dot_sshrc                          # SSH powerline prompt
├── dot_dark.itermcolors               # iTerm2 Solarized Dark
├── dot_config/nvim/                   # LazyVim (neovim distro)
├── Brewfile                           # Homebrew packages + casks
├── run_onchange_install-packages.sh.tmpl  # brew bundle install
├── run_once_install-oh-my-zsh.sh      # oh-my-zsh installer
├── run_once_set-iterm2-colors.sh      # applies Solarized Dark to iTerm2
├── Makefile                           # shortcuts
├── .chezmoiignore
└── README.md
```

## Makefile

| Command | Description |
|---|---|
| `make apply` | Apply dotfiles via chezmoi |
| `make diff` | Preview changes before applying |
| `make status` | Show what's out of sync |
| `make edit` | Open chezmoi source directory |
| `make update` | Pull and apply latest changes |

## Script conventions

- `run_once_*` — runs only the first time (tracked by chezmoi state)
- `run_onchange_*` — runs only when script contents change
- `run_always_*` — runs every `chezmoi apply` (avoid unless needed)
- Scripts ending in `.tmpl` are treated as Go templates by chezmoi

## Key files

- `Brewfile` — run `brew bundle dump` to update from current machine
- `dot_config/nvim/` — LazyVim starter template, customize in `lua/plugins/`
- `dot_zshrc` — oh-my-zsh config, no Perforce vars

## Git

Author: Chet Aldrich <chetaldrich@gmail.com>
