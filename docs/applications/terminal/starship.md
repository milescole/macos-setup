# Starship

`Starship` is the prompt baseline for this setup.

It belongs in the baseline because it provides a fast cross-shell prompt with a
single tracked config that can be reused across machines.

```bash
brew install starship
```

The tracked config lives at `dotfiles/.config/starship.toml` and is restored
into `~/.config/starship.toml` with:

```bash
./bootstrap/dotfiles.sh starship
```

This commit tracks the package and prompt config only. Shell activation is
added later through the `zsh` dotfiles so package installation and shell wiring
stay isolated.

Useful Starship commands:

```bash
starship explain
starship module git_branch
starship print-config
```
