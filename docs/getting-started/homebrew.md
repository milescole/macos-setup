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

Add the appropriate line manually during initial setup:

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

If you later restore the tracked dotfiles from this repository, make sure the
tracked `dotfiles/zsh/.zprofile` still includes the same Homebrew initialization.

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
tooling pages that depend on package-managed CLI tools.

## Use the Repository Brewfile

This repository tracks its baseline Homebrew state in the root `Brewfile`.
Keep that file curated rather than dumping the entire contents of a machine into
version control.

Typical workflow:

```bash
cd ~/Developer/oss/macos-setup
brew bundle install --file ./Brewfile
```

The bootstrap entrypoint runs the same command through
`./bootstrap/homebrew.sh`, so `./bootstrap/bootstrap.sh` will install and
upgrade the declared formulas automatically. Run it after Homebrew itself is
configured and before restoring the tracked dotfiles.

When curating packages:

- add or remove entries in `Brewfile` deliberately
- keep the file focused on the baseline tools that belong on every machine
- use `brew bundle dump --file ./Brewfile --force` only as a discovery aid, then
  edit the results back down to the desired baseline
