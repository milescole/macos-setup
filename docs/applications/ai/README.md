# AI Tooling

AI tools are documented separately because this setup now includes both
terminal agents and desktop AI clients, and their account state is restored
through vendor sign-in rather than tracked dotfiles.

Keep this section focused on:

- which AI tools belong in the default workstation baseline
- how they are installed or restored
- whether the tool is terminal-first or desktop-first
- which state is account-managed rather than tracked here

## Current Baseline

This setup currently treats five AI tools as part of the default baseline:

- `ChatGPT` for a general-purpose desktop assistant
- `Claude` for the desktop Claude app
- `Claude Code` for terminal-first Anthropic coding work
- `Codex` for terminal-first OpenAI coding work
- `Codex App` for the desktop Codex client

Install the full tracked baseline with the repository `Brewfile`, or restore
individual tools with the per-tool commands on the pages below.
