# Claude Code

`Claude Code` is part of the AI tooling baseline for this setup.

It belongs in the baseline because it works directly against local repositories,
keeps the workflow close to the shell, and is easy to restore through the
tracked `Brewfile`.

If you also want the separate desktop Claude app, install `claude` as well.

Install it directly with Homebrew if you need to restore only this tool:

```bash
brew install --cask claude-code
```

The installed command is:

```bash
claude
```

Use it from the repository root you want it to work on so it can inspect the
right files and run project-local commands. On a fresh machine, the normal
sequence is:

1. run `./bootstrap/bootstrap.sh`
2. `cd` into the target repository
3. start `claude`
4. complete sign-in and permission setup inside the tool

There is no tracked Claude Code config in this repository yet. Keep account
state, API credentials, and any personal approval policy outside the repo so
the shared baseline stays portable.

Useful first-run checks:

```bash
claude --help
claude
```
