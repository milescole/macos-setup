# Dotfiles

Use this directory for tracked dotfiles and exported settings that are worth
restoring across machines.

Install them with `./bootstrap/dotfiles.sh`.

Current baseline files:

- `.zprofile` for Homebrew shell initialization
- `.zshrc` for the interactive shell baseline
- `.gitconfig` for Git identity and defaults
- `.config/ghostty/config` for the Ghostty terminal baseline
- `.config/starship.toml` for the Starship prompt baseline
- `vscode/settings.json` for the VS Code editor baseline
- `vscode/keybindings.json` for the VS Code shortcut baseline
- `vscode/extensions.txt` for the tracked VS Code extension baseline installed
  by `./bootstrap/dotfiles.sh vscode`
- `shell/*` for shell support files restored into `~/shell`
