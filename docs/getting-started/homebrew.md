# Homebrew

Install Homebrew after [Xcode](xcode.md) and [Workspace](workspace.md) so the
rest of the machine setup can rely on a standard package manager.

## Install Homebrew

Run the official installer:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the prompts shown by the installer. On macOS, Homebrew installs into:

- `/opt/homebrew` on Apple Silicon
- `/usr/local` on Intel

## Configure the Shell

Follow the post-install shell configuration printed by the installer. For the
default `zsh` shell, that typically means adding Homebrew to `~/.zprofile`.

If you are using the tracked dotfiles in this repository, copy the baseline
profile into place:

```bash
cp dotfiles/.zprofile ~/.zprofile
source ~/.zprofile
```

That tracked file handles both Apple Silicon and Intel Homebrew prefixes.

If you are not using the tracked dotfiles, add the appropriate line manually:

Apple Silicon:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
```

Intel:

```bash
echo 'eval "$(/usr/local/bin/brew shellenv zsh)"' >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv zsh)"
```

If the installer prints a different path or shell file, use that output instead
of the examples above.

## Verify

Confirm that `brew` is available:

```bash
brew --version
brew doctor
```

If `brew doctor` reports warnings, address the ones that affect the local
machine baseline before continuing.

## Optional: Disable Analytics

If you do not want Homebrew to send anonymous analytics, opt out explicitly:

```bash
brew analytics off
```

After Homebrew is installed, continue with the repo bootstrap and the baseline
tooling pages that depend on package-managed CLIs and casks.
