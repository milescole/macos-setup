# Dotfiles

Tracked dotfiles live in `dotfiles/`.

## Apply `.zprofile`

From the repository root, copy the tracked file into place:

```bash
cp dotfiles/.zprofile ~/.zprofile
source ~/.zprofile
```

This baseline profile initializes Homebrew for both Apple Silicon and Intel
macOS machines.

## Apply `.gitconfig`

From the repository root, copy the tracked file into place:

```bash
cp dotfiles/.gitconfig ~/.gitconfig
```

Then replace the placeholder identity values:

```bash
git config --global user.name "Your Full Name"
git config --global user.email "Your Email"
```
