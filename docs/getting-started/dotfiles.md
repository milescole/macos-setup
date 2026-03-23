# Dotfiles

Tracked dotfiles live in `dotfiles/`.

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
