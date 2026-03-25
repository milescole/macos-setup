# Codex App

`Codex App` is part of the desktop AI tooling baseline for this setup.

It belongs in the baseline because it provides the standalone Codex desktop
client and is easy to restore from the tracked `Brewfile`.

Install it directly with Homebrew if you need to restore only this tool:

```bash
brew install --cask codex-app
```

The installed app bundle is `Codex.app`.

Codex desktop state is not tracked in this repository. Treat these as
account-managed instead:

- signed-in account state
- managed repositories and local project state
- desktop app preferences and local caches
- notification and file-access permissions

Use the normal sign-in flow after install and keep machine-wide setup decisions
documented here instead of trying to track app internals in dotfiles.
