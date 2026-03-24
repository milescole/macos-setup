# Getting Started

Start here on a fresh machine.

Use this order:

1. Complete [Xcode](xcode.md) first so Apple's compiler toolchain is available.
2. Create the standard [Workspace](workspace.md) layout.
3. Clone this repository into `~/Developer/oss/macos-setup`.
4. Install [Homebrew](homebrew.md) so package-managed tooling is available.
5. Run `./bootstrap/bootstrap.sh` from the repository root.
6. Review [macOS Settings](macos-settings.md) and apply [Dotfiles](dotfiles.md).

This section covers the baseline steps that should be completed before worrying
about individual applications or language ecosystems:

- install Xcode and the Xcode Command Line Tools
- create the standard workspace layout
- install Homebrew for package-managed CLI tools and casks
- review macOS settings that affect development ergonomics
- define the initial application and CLI baseline
- apply the tracked dotfiles that already exist in the repository
