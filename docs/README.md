# Mac Setup

This handbook documents the personal macOS workstation defined by this
repository. It is organized as a layered guide:

- `Getting Started` for first-machine setup and baseline configuration
- `Applications` for desktop software grouped by function
- `Languages` for developer runtimes, package managers, and broader toolchain
  policy
- `Maintenance` for updates, exports, and rebuild workflows

For a fresh machine, start with `Getting Started` in this order:

1. `Xcode`
2. `Workspace`
3. `Homebrew`
4. `Essentials`
5. `Fonts`
6. `Zsh`
7. `macOS Settings`
8. `Dotfiles`

Use the `Applications` and `Languages` sections after the package baseline is
in place and before restoring tracked dotfiles.

The setup now uses two bootstrap layers:

- `./bootstrap/bootstrap.sh` applies packages and system-level setup
- `./bootstrap/dotfiles.sh` applies tracked dotfiles and the VS Code user
  baseline after the machine baseline is in place

Use the navigation sidebar to move from initial setup to deeper tooling details.
