# macos-setup

Personal macOS workstation setup with two outputs:

- a reproducible bootstrap flow for a fresh machine
- a layered GitBook handbook for apps, toolchains, and configuration

## Quick Start

Clone the repository and run the bootstrap entrypoint:

```bash
git clone https://github.com/<your-user>/macos-setup.git
cd macos-setup
./bootstrap/bootstrap.sh
```

The bootstrap flow is intentionally minimal in the initial scaffolding commit.
It runs placeholder setup entrypoints and verifies the repository scaffold.

## Repository Layout

- `bootstrap/`: setup entrypoints and system configuration scripts
- `dotfiles/`: placeholder for future tracked configuration and exported settings
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
