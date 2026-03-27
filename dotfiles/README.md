# Dotfiles

Use this directory for tracked dotfiles and exported settings that are worth
restoring across machines.

Install them with `./bootstrap/dotfiles.sh`.

This repo is organized by tool, not by the final disk layout. The bootstrap
script maps these tracked files into their installed destinations in `$HOME`
and `~/.config`.

Current baseline folders:

- `git/.gitconfig` for Git identity and defaults
- `ghostty/config` for the shared Ghostty and cmux terminal baseline
- `starship/prompts/*.toml` for tracked Starship prompt presets named with a
  `layout-palette` convention
- `zsh/.zprofile` for Homebrew shell initialization, installed to `~/.zprofile`
- `zsh/.zshrc` for the interactive shell baseline, installed to `~/.zshrc`
- `zsh/*.zsh` for managed zsh aliases, exports, extra hooks, functions, and paths
- `vscode/settings.json` for the VS Code editor baseline
- `vscode/keybindings.json` for the VS Code shortcut baseline
- `vscode/extensions.txt` for the tracked VS Code extension baseline installed
  by `./bootstrap/dotfiles.sh vscode`
