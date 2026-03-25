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
./bootstrap/dotfiles.sh vscode
```

By default the script will:

- download from a GitHub raw URL if `DOTFILES_BASE_URL` is set or a GitHub
  `origin` remote can be derived
- fall back to the local tracked files in this repository otherwise
- create any missing parent directories
- back up an existing file before replacing it
- skip files that already match

The repository stores tracked config in human-readable tool folders under
`dotfiles/`. The bootstrap script maps those files into their installed
locations such as `~/.zshrc`, `~/.gitconfig`, and `~/.config/...`.

You can force either mode explicitly:

```bash
DOTFILES_MODE=local ./bootstrap/dotfiles.sh
DOTFILES_MODE=remote DOTFILES_BASE_URL="https://raw.githubusercontent.com/<user>/<repo>/<ref>/dotfiles" ./bootstrap/dotfiles.sh
```

## Current Components

- `core` installs `dotfiles/git/.gitconfig` to `~/.gitconfig` and
  `dotfiles/zsh/.zprofile` to `~/.zprofile`
- `ghostty` installs `dotfiles/ghostty/config` to `~/.config/ghostty/config`
- `shell` installs `dotfiles/zsh/.zshrc` to `~/.zshrc` and maps the tracked
  `dotfiles/zsh/*.zsh` support files into `~/.config/zsh/`
- `starship` installs `dotfiles/starship/starship.toml` to
  `~/.config/starship.toml`
- `vscode` installs VS Code user settings, keybindings, and the tracked
  extension baseline

## Core Files

The tracked `dotfiles/zsh/.zprofile` file installs to `~/.zprofile` and
initializes Homebrew for both Apple Silicon and Intel
macOS machines. If you already added the Homebrew shell initialization manually
during the Homebrew install step, applying this tracked file later should
preserve that behavior rather than introduce a second, different setup path.

Use `.zprofile` for login-shell setup such as:

- `PATH` changes
- exported environment variables
- Homebrew shell initialization

After installing `~/.gitconfig`, replace the placeholder identity values if
needed:

```bash
git config --global user.name "Your Full Name"
git config --global user.email "Your Email"
```

## Shell Files

The tracked shell component restores:

- `dotfiles/zsh/.zshrc` into `~/.zshrc`
- `dotfiles/zsh/aliases.zsh` into `~/.config/zsh/aliases.zsh`
- `dotfiles/zsh/exports.zsh` into `~/.config/zsh/exports.zsh`
- `dotfiles/zsh/extra.zsh` into `~/.config/zsh/extra.zsh`
- `dotfiles/zsh/functions.zsh` into `~/.config/zsh/functions.zsh`
- `dotfiles/zsh/paths.zsh` into `~/.config/zsh/paths.zsh`

Apply it with:

```bash
./bootstrap/dotfiles.sh shell
```

This shell baseline is where Starship, `zsh-completions`,
`zsh-autosuggestions`, and `zsh-syntax-highlighting` are actually wired
together after their packages are installed.

The tracked `extra.zsh` hook remains part of the shared baseline and now lives
at `~/.config/zsh/extra.zsh`.

Personal overrides now belong in `~/.config/zsh/local.zsh`. That file is not
managed by this repository, but the tracked `.zshrc` will source it after the
shared baseline if it exists. For migration safety, the loader also still falls
back to the legacy `~/shell/extra.zsh` path when `~/.config/zsh/extra.zsh` has
not been installed yet.

The tracked `paths.zsh` file also adds the VS Code app bundle CLI path when
`/Applications/Visual Studio Code.app` is present so `code --wait` matches the
tracked `EDITOR` setting without a separate manual shell command install.

## VS Code Baseline

The tracked VS Code component applies the editor baseline in one step:

- `dotfiles/vscode/settings.json` into
  `~/Library/Application Support/Code/User/settings.json`
- `dotfiles/vscode/keybindings.json` into
  `~/Library/Application Support/Code/User/keybindings.json`
- installs the curated extension list from `dotfiles/vscode/extensions.txt`

Apply it with:

```bash
./bootstrap/dotfiles.sh vscode
```

The full `./bootstrap/dotfiles.sh` run includes this component automatically,
so a fresh-machine baseline picks up the tracked editor settings and required
extensions together.

This keeps the editor baseline versioned alongside the shell and terminal
configuration while still letting VS Code Settings Sync manage anything you do
not want to track in this repository.

The tracked extension list still lives at `dotfiles/vscode/extensions.txt`.
Keep that file curated and use the helper script when you want to review the
currently installed extension IDs from an already configured machine:

```bash
./scripts/vscode-extensions.sh export
```

It prints the installed extensions in sorted order. Set
`VSCODE_EXTENSIONS_OUTPUT_FILE=/tmp/vscode-extensions.txt` if you want to save
that raw export to a separate file while updating the curated baseline.

## Recommended Order

Apply these tracked files after the baseline machine setup is in place:

1. install and configure Homebrew
2. run `./bootstrap/bootstrap.sh` to apply the tracked package baseline
3. review macOS settings and any application-specific setup
4. run `./bootstrap/dotfiles.sh` for the tracked dotfiles you want to apply

That keeps shell and Git restoration separate from the package bootstrap path.
