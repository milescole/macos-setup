# Ghostty

`Ghostty` is the default terminal application in this setup.

It belongs in the baseline because it is fast, keyboard-focused, and easy to
restore from the tracked `Brewfile`.

```bash
brew install --cask ghostty
```

The tracked config lives at `dotfiles/ghostty/config` and is restored
into `~/.config/ghostty/config` with:

```bash
./bootstrap/dotfiles.sh ghostty
```

That same installed file is also the effective baseline for `cmux`, because
cmux reads Ghostty config files from `~/.config/ghostty/config`.

This baseline config stays intentionally small:

- a built-in Ghostty theme
- a Nerd Font-backed terminal font
- a normal window layout pinned to the top of the screen
- comfortable font sizing and window padding
- a macOS-native titlebar style that keeps tabs integrated

Useful Ghostty commands:

```bash
ghostty +list-themes
ghostty +list-fonts
ghostty +show-config --default --docs
ghostty +list-keybinds --default
```

The tracked config uses a normal Ghostty window instead of the quick terminal.
It opens at the top of the screen with a `212` column width, a reduced height,
and `window-save-state = never` so the configured layout stays predictable
between launches.

The theme and window layout settings follow the official Ghostty theme docs and
option reference.
