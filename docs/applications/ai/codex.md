# Codex

`Codex` is part of the AI tooling baseline for this setup.

It belongs in the baseline because it lets you run OpenAI coding agents against
the local worktree without leaving the shell workflow that this repository is
already organized around.

If you also want the separate desktop app, install `codex-app` as well.

Install it directly with Homebrew if you need to restore only this tool:

```bash
brew install --cask codex
```

The installed command is:

```bash
codex
```

Use it from the repository root you want it to operate on so file discovery,
edits, and command execution stay scoped to the correct project. On a fresh
machine, the normal sequence is:

1. run `./bootstrap/bootstrap.sh`
2. `cd` into the target repository
3. start `codex`
4. complete sign-in and tool configuration inside the app

There is no tracked Codex config in this repository yet. Keep account state,
tokens, and personal approval settings outside the repo so bootstrap stays safe
to reuse across machines.

Useful first-run checks:

```bash
codex --help
codex
```
