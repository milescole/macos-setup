# macos-setup

Personal macOS workstation setup with two outputs:

- a reproducible bootstrap flow for a fresh machine
- a layered GitBook handbook for apps, toolchains, and configuration
- a curated `Brewfile` for baseline CLI tools

## Quick Start

Use this order on a fresh machine:

1. Install Xcode and the Xcode Command Line Tools by following
   `docs/getting-started/xcode.md`.
2. Create the standard workspace layout from
   `docs/getting-started/workspace.md`.
3. Clone this repository into `~/Developer/oss/macos-setup`.
4. Install Homebrew from `docs/getting-started/homebrew.md`.
5. Apply the baseline CLI package set by running the bootstrap entrypoint from
   the repository root:

```bash
cd ~/Developer/oss
git clone https://github.com/<your-user>/macos-setup.git
cd ~/Developer/oss/macos-setup
./bootstrap/bootstrap.sh
```

6. Review the application, language, and macOS settings documentation for the
   rest of the machine baseline.
7. Apply the tracked dotfiles from `docs/getting-started/dotfiles.md` last.

The bootstrap flow is intentionally minimal in the initial scaffolding commit.
It applies the curated `Brewfile`, runs setup entrypoints, and verifies the
repository scaffold.

## Repository Layout

- `bootstrap/`: setup entrypoints and system configuration scripts
- `Brewfile`: curated Homebrew formulas for the baseline CLI setup
- `dotfiles/`: tracked shell and Git configuration for rebuilds
- `scripts/`: maintenance and export helpers
- `docs/`: GitBook source with a layered hierarchy

## Documentation

The GitBook content is organized into:

- `Getting Started`
- `Applications`
- `Languages`
- `Maintenance`

See [docs/README.md](docs/README.md) for the handbook landing page.

This repository intentionally starts with minimal seeded content so you can
document and curate your own applications, languages, tools, and config.
