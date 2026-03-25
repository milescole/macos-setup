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

`1Password` is the default productivity baseline in this setup.

It belongs in the baseline because it is the main password manager, part of
normal day-to-day machine use, and easy to restore from the tracked
`Brewfile`.

```bash
brew install --cask 1password
```

1Password state is not tracked in this repository. Treat these as
account-managed instead:

- vault membership and account access
- stored logins, secure notes, and SSH keys
- browser integration and autofill behavior
- biometric unlock and security preferences

Use the normal 1Password sign-in flow to restore vault access after a rebuild,
but keep machine-wide setup decisions documented here rather than trying to
track secrets or app state in dotfiles.

For the workstation baseline, 1Password mainly exists for:

- account login and MFA recovery during machine setup
- secure access to developer services and shared credentials
- restoring browser and app sign-in state without unmanaged local secrets
