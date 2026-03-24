# Dotfiles

Tracked dotfiles live in `dotfiles/`.

Use `./bootstrap/dotfiles.sh` to install them into your home directory.

From the repository root:

```bash
./bootstrap/dotfiles.sh
```

To install only a specific subset:

```bash
./bootstrap/dotfiles.sh core
./bootstrap/dotfiles.sh ghostty
./bootstrap/dotfiles.sh shell
./bootstrap/dotfiles.sh starship
```

By default the script will:

- download from a GitHub raw URL if `DOTFILES_BASE_URL` is set or a GitHub
  `origin` remote can be derived
- fall back to the local tracked files in this repository otherwise
- create any missing parent directories
- back up an existing file before replacing it
- skip files that already match

You can force either mode explicitly:

```bash
DOTFILES_MODE=local ./bootstrap/dotfiles.sh
DOTFILES_MODE=remote DOTFILES_BASE_URL="https://raw.githubusercontent.com/<user>/<repo>/<ref>/dotfiles" ./bootstrap/dotfiles.sh
```

## Current Components

- `core` installs `.gitconfig` and `.zprofile`
- `ghostty` installs `.config/ghostty/config`
- `shell` installs `.zshrc` and the tracked `~/my` support files
- `starship` installs `.config/starship.toml`

## Core Files

The tracked `.zprofile` initializes Homebrew for both Apple Silicon and Intel
macOS machines. If you already added the Homebrew shell initialization manually
during the Homebrew install step, applying this tracked file later should
preserve that behavior rather than introduce a second, different setup path.

Use `.zprofile` for login-shell setup such as:

- `PATH` changes
- exported environment variables
- Homebrew shell initialization

After installing `.gitconfig`, replace the placeholder identity values if
needed:

```bash
git config --global user.name "Your Full Name"
git config --global user.email "Your Email"
```

## Shell Files

The tracked shell component restores:

- `.zshrc`
- `shell/.gitattributes`
- `shell/.gitignore`
- `shell/aliases.zsh`
- `shell/exports.zsh`
- `shell/extra.zsh`
- `shell/functions.zsh`
- `shell/paths.zsh`

Apply it with:

```bash
./bootstrap/dotfiles.sh shell
```

This shell baseline is where Starship, `zsh-completions`,
`zsh-autosuggestions`, and `zsh-syntax-highlighting` are actually wired
together after their packages are installed.

## Recommended Order

Apply these tracked files after the baseline machine setup is in place:

1. install and configure Homebrew
2. run `./bootstrap/bootstrap.sh` to apply the tracked package baseline
3. review macOS settings and any application-specific setup
4. run `./bootstrap/dotfiles.sh` for the tracked dotfiles you want to apply

That keeps shell and Git restoration separate from the package bootstrap path.
