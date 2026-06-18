# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Setup

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply chetaldrich
```

If chezmoi is already installed, run `make apply`.

## Script conventions

| Prefix | Runs when |
|---|---|
| `run_once_*` | First apply only |
| `run_onchange_*` | Script contents change |
| `run_always_*` | Every `chezmoi apply` (avoid) |

Scripts ending in `.tmpl` are Go templates processed by chezmoi.

## Makefile

Run `make` with `apply`, `diff`, `status`, `edit` (opens source dir), or `update`.

## Brewfile

Run `brew bundle dump` from the repo root to snapshot current machine state.

## Git

Author: Chet Aldrich <chetaldrich@gmail.com>
