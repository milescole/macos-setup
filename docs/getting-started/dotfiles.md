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

If you already added the Homebrew shell initialization manually during the
Homebrew install step, applying this tracked file later should preserve that
behavior rather than introduce a second, different setup path.

Use `.zprofile` for login-shell setup such as:

- `PATH` changes
- exported environment variables
- Homebrew shell initialization

## Apply `.gitconfig`

From the repository root, copy the tracked file into place:

```bash
cp dotfiles/.gitconfig ~/.gitconfig
```

Then replace the placeholder identity values if needed:

```bash
git config --global user.name "Your Full Name"
git config --global user.email "Your Email"
```

## Recommended Order

Apply these tracked files after the baseline machine setup is in place:

1. install and configure Homebrew
2. run `./bootstrap/bootstrap.sh` to apply the tracked package baseline
3. review macOS settings and any application-specific setup
4. copy `.zprofile` and `.gitconfig`

That keeps shell and Git restoration separate from the package bootstrap path.
