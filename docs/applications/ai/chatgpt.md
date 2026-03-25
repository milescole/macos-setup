# ChatGPT

`ChatGPT` is part of the desktop AI tooling baseline for this setup.

It belongs in the baseline because it gives the machine a general-purpose
OpenAI desktop client that is easy to restore from the tracked `Brewfile`.

Install it directly with Homebrew if you need to restore only this tool:

```bash
brew install --cask chatgpt
```

The installed app bundle is `ChatGPT.app`.

ChatGPT state is not tracked in this repository. Treat these as account-managed
instead:

- signed-in account state
- conversation history and GPT selections
- desktop app preferences and local caches
- voice, notification, and attachment permissions

Use the normal sign-in flow after install and keep machine-wide setup decisions
documented here instead of trying to track app internals in dotfiles.
