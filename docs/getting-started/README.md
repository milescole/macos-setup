# Getting Started

Start here on a fresh machine.

Use this order:

1. Complete [Xcode](xcode.md) first so Apple's compiler toolchain is available.
2. Create the standard [Workspace](workspace.md) layout.
3. Clone this repository into `~/Developer/oss/macos-setup`.
4. Install [Homebrew](homebrew.md) so package-managed tooling is available.
5. Review [Essentials](essentials.md) to understand the tracked CLI baseline.
6. Review [Fonts](fonts.md) to understand the tracked terminal and editor font
   baseline.
7. Review [Zsh](zsh.md) to understand the tracked shell package baseline.
8. Run `./bootstrap/bootstrap.sh` from the repository root.
9. Review [macOS Settings](macos-settings.md) and the relevant application
   pages for the rest of the machine setup.
10. Run `./bootstrap/dotfiles.sh` to apply [Dotfiles](dotfiles.md) and the
    tracked VS Code baseline after the system package setup is in place.

This section covers the baseline steps that should be completed before worrying
about individual applications or language ecosystems:

- install Xcode and the Xcode Command Line Tools
- create the standard workspace layout
- install Homebrew for package-managed CLI tools
- review the tracked CLI baseline before applying it
- review the tracked font baseline before applying it
- review the tracked shell package baseline before applying it
- run the repo bootstrap to apply the tracked package baseline
- run the dotfiles bootstrap to restore tracked config into the user home
- review macOS settings that affect development ergonomics
- define the initial application baseline
- apply the tracked shell and Git configuration last
