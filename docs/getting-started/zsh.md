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

Switching the login shell remains a manual step. Use the Homebrew-installed
binary, not the system `zsh` in `/bin/zsh`.

```bash
brew --prefix zsh
grep -qxF "$(brew --prefix zsh)/bin/zsh" /etc/shells || \
  sudo sh -c 'echo "$(brew --prefix zsh)/bin/zsh" >> /etc/shells'
chsh -s "$(brew --prefix zsh)/bin/zsh"
```

Only run `chsh` after Homebrew `zsh` is installed. On a default Homebrew setup
this resolves to `/opt/homebrew/bin/zsh` on Apple Silicon Macs and
`/usr/local/bin/zsh` on Intel Macs.

After changing the login shell, log out and back in or open a fresh terminal
session, then verify:

```bash
echo "$SHELL"
$SHELL --version
```

The shell path should point at the Homebrew install, for example
`/opt/homebrew/bin/zsh` or `/usr/local/bin/zsh`.

## Plugin Baseline

The tracked plugin scope stays intentionally small:

- `zsh-autosuggestions` for history and completion-driven suggestions
- `zsh-completions` for extra completion definitions
- `zsh-syntax-highlighting` for command-line feedback while typing

This commit installs the packages only. Shell activation and load order are
handled through the tracked `.zshrc` restored by:

```bash
./bootstrap/dotfiles.sh shell
```

That keeps package installation and shell wiring isolated while still making
the full shell setup reproducible.

## Manual Verification And Troubleshooting

The package baseline is normally installed through the tracked `Brewfile`, but
these direct commands are useful when validating the shell setup by hand:

```bash
brew install zsh-completions

# To opt-in to using completions for external commands
brew completions link

# You may also need to force rebuild zcompdump
rm -f ~/.zcompdump
autoload -Uz compinit
compinit

# If compinit reports insecure directories
chmod -R go-w "$(brew --prefix)/share/zsh"
compaudit | xargs chmod g-w

# Plugin install paths
brew install zsh-autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

brew install zsh-syntax-highlighting
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
```

These commands are troubleshooting aids. The normal repo flow is still:

1. install the packages with `./bootstrap/homebrew.sh`
2. apply the tracked shell files with `./bootstrap/dotfiles.sh shell`
3. open a new shell or run `source ~/.zshrc`

## Related Config

- [Starship](../applications/terminal/starship.md) provides the prompt config
- [Dotfiles](dotfiles.md) restores tracked shell files into the user home
- the tracked shell dotfiles wire `zsh`, Starship, and the plugins together
