# Browsers

Browsers are documented separately because profiles, sync, and web-development
usage usually matter more than raw installation.

Keep this section focused on:

- which browser belongs in the default workstation baseline
- how it is installed or restored
- whether profiles, sync, or extensions are expected as part of setup
- any notes that affect local development or testing workflow

## Current Baseline

`Google Chrome` is the default browser baseline in this setup.

It belongs in the baseline because it is the main day-to-day browser, a common
target for local web development, and easy to restore from the tracked
`Brewfile`.

```bash
brew install --cask google-chrome
```

Chrome state is not tracked in this repository. Treat these as app-managed or
account-managed instead:

- profiles and bookmarks
- extension sync
- saved passwords and payment methods
- site permissions and session state

Use the signed-in browser profile to restore personal state after a rebuild,
but keep machine-wide setup decisions documented here instead of trying to
track Chrome internals in dotfiles.

For local development, Chrome is the default baseline for:

- testing localhost and staged web builds
- checking responsive layouts with DevTools device emulation
- using the Elements, Network, and Console panels during debugging

Useful Chrome entry points:

```text
chrome://settings
chrome://extensions
chrome://inspect
```
