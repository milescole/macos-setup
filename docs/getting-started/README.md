# Getting Started

Start here on a fresh machine.

Use this order:

1. Complete [Xcode](xcode.md) first so Apple's compiler toolchain is available.
2. Create the standard [Workspace](workspace.md) layout.
3. Clone this repository into `~/Developer/oss/macos-setup`.
4. Install [Homebrew](homebrew.md) so package-managed tooling is available.
5. Review [Essentials](essentials.md) to understand the tracked CLI baseline.
6. Run `./bootstrap/bootstrap.sh` from the repository root.
7. Review [macOS Settings](macos-settings.md) and the relevant application
   pages for the rest of the machine setup.
8. Apply [Dotfiles](dotfiles.md) after the baseline system and tool setup is in
   place.

This section covers the baseline steps that should be completed before worrying
about individual applications or language ecosystems:

- install Xcode and the Xcode Command Line Tools
- create the standard workspace layout
- install Homebrew for package-managed CLI tools
- review the tracked CLI baseline before applying it
- run the repo bootstrap to apply the tracked package baseline
- review macOS settings that affect development ergonomics
- define the initial application baseline
- apply the tracked shell and Git configuration last
