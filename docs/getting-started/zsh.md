# Zsh

This setup standardizes on Homebrew-managed `zsh` plus a small plugin baseline:

- `zsh`
- `zsh-autosuggestions`
- `zsh-completions`
- `zsh-syntax-highlighting`

These packages are installed by the tracked `Brewfile`:

```bash
brew install zsh
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-syntax-highlighting
```

## Why This Lives In Getting Started

Shell behavior affects nearly every terminal session on the machine. Keeping
the package baseline here makes it clear that the shell stack is part of the
default workstation build, not a later optional customization.

## Default Shell Policy

macOS already ships with `zsh`, but this repository treats the Homebrew build
as the tracked baseline.

Switching the login shell remains a manual step:

```bash
which zsh
chsh -s "$(which zsh)"
```

Only run `chsh` after Homebrew `zsh` is installed and available in your shell
path.

## Plugin Baseline

The tracked plugin scope stays intentionally small:

- `zsh-autosuggestions` for history and completion-driven suggestions
- `zsh-completions` for extra completion definitions
- `zsh-syntax-highlighting` for command-line feedback while typing

This commit installs the packages only. Shell activation and load order are
handled later through the tracked `.zshrc` so package installation and shell
wiring stay isolated.

## Related Config

- [Starship](../applications/terminal/starship.md) provides the prompt config
- [Dotfiles](dotfiles.md) restores tracked shell files into the user home
- a later shell dotfiles step will wire `zsh`, Starship, and the plugins
  together
