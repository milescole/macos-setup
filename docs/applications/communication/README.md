# Communication

Communication tools are documented separately because workspace membership,
account state, and notification behavior are usually restored outside this
repository.

Keep this section focused on:

- which communication tools belong in the default workstation baseline
- how they are installed or restored
- which state is account-managed rather than tracked here
- any setup notes that affect daily collaboration workflow

## Current Baseline

`Slack` is the default communication baseline in this setup.

It belongs in the baseline because it is the main team chat client, part of
day-to-day collaboration, and easy to restore from the tracked `Brewfile`.

```bash
brew install --cask slack
```

Slack state is not tracked in this repository. Treat these as account-managed
or workspace-managed instead:

- signed-in workspaces
- channel membership and unread state
- notification preferences
- installed Slack apps and workflow integrations

Use the normal Slack sign-in flow to restore workspaces after a rebuild, but
keep machine-wide setup decisions documented here rather than trying to track
Slack state in dotfiles.

For the workstation baseline, Slack mainly exists for:

- team chat and incident coordination
- link sharing during code review and debugging
- quick handoff communication while working across repos
