# Productivity

Productivity tools are documented separately because they support the broader
workstation workflow without necessarily being part of the shell or editor
baseline.

Keep this section focused on:

- which productivity apps belong in the default workstation baseline
- how they are installed or restored
- which state is account-managed rather than tracked here
- any setup notes that affect daily development workflow

## Current Baseline

The default productivity baseline in this setup currently includes:

- `1Password` for password management, MFA recovery, and secure access to
  developer services
- `Obsidian` for local notes, working drafts, and Markdown-based knowledge
  capture

Both apps are restored from the tracked `Brewfile`:

```bash
brew install --cask 1password
brew install --cask obsidian
```

State for productivity apps is not tracked in this repository. Keep
machine-wide setup decisions documented here, but treat app data, accounts,
vaults, and vault contents as app-managed or account-managed.
