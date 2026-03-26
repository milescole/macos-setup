# Starship

`Starship` is the prompt baseline for this setup.

It belongs in the baseline because it provides a fast cross-shell prompt with a
small set of tracked prompt presets that can be reused across machines.

```bash
brew install starship
```

Tracked prompt presets live under `dotfiles/starship/prompts/`. The default
prompt at `dotfiles/starship/prompts/powerline.toml` is restored into
`~/.config/starship.toml` with:

```bash
./bootstrap/dotfiles.sh starship
```

Alternate presets are also tracked at:

- `dotfiles/starship/prompts/powerline-soft.toml` for the original
  single-template powerline layout
- `dotfiles/starship/prompts/minimal.toml` for a minimal prompt that keeps the
  runtime and git icons, with directory and git state on the left and active
  runtime and timing on the right

To install a specific prompt preset, either pass it inline:

```bash
./bootstrap/dotfiles.sh starship:powerline
./bootstrap/dotfiles.sh starship:powerline-soft
./bootstrap/dotfiles.sh starship:minimal
```

or set it through the environment:

```bash
STARSHIP_PROMPT=powerline-soft ./bootstrap/dotfiles.sh starship
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
