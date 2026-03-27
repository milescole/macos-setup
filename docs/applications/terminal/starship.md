# Starship

`Starship` is the prompt baseline for this setup.

It belongs in the baseline because it provides a fast cross-shell prompt with a
small set of tracked prompt presets that can be reused across machines.

```bash
brew install starship
```

Tracked prompt presets live under `dotfiles/starship/prompts/`. The default
prompt at `dotfiles/starship/prompts/minimal-catppuccin.toml` is restored into
`~/.config/starship.toml` with:

```bash
./bootstrap/dotfiles.sh starship
```

Prompt preset names now follow a `layout-palette` convention so the file name
describes both the structure and the color system. The currently tracked
presets are:

- `dotfiles/starship/prompts/minimal-catppuccin.toml` for the minimal layout
  with the Catppuccin Mocha palette
- `dotfiles/starship/prompts/minimal-nord.toml` for a muted Nord take on the
  minimal layout
- `dotfiles/starship/prompts/minimal-nord-aurora.toml` for a brighter,
  more saturated Nord-family variant of the same layout
- `dotfiles/starship/prompts/minimal-tokyonight.toml` for the minimal layout
  with Tokyo Night blue and cyan accents
- `dotfiles/starship/prompts/powerline-catppuccin.toml` for the segmented
  powerline layout with the Catppuccin Mocha palette

To install a specific prompt preset, either pass it inline:

```bash
./bootstrap/dotfiles.sh starship:powerline-catppuccin
./bootstrap/dotfiles.sh starship:minimal-catppuccin
./bootstrap/dotfiles.sh starship:minimal-nord
./bootstrap/dotfiles.sh starship:minimal-nord-aurora
./bootstrap/dotfiles.sh starship:minimal-tokyonight
```

or set it through the environment:

```bash
STARSHIP_PROMPT=minimal-tokyonight ./bootstrap/dotfiles.sh starship
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
