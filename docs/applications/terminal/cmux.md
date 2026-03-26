# CMUX

`CMUX` is part of the terminal baseline for this setup.

It belongs in the baseline because it adds pane management, notifications, and
the built-in browser workflow on top of the same terminal rendering stack
already used for Ghostty.

Install it directly with Homebrew if you need to restore only this tool:

```bash
brew install --cask cmux
```

`cmux` does not need a separate tracked config file in this repository. It
reads Ghostty config files, so the tracked terminal baseline at
`dotfiles/ghostty/config` becomes the shared config once it is installed to:

```text
~/.config/ghostty/config
```

Apply that shared baseline with:

```bash
./bootstrap/dotfiles.sh ghostty
```

That gives cmux the same tracked defaults for:

- theme and terminal colors
- font family and sizing
- scrollback behavior
- working-directory defaults when configured
- split appearance options such as unfocused opacity and divider color

cmux also exposes app-level settings that are not tracked here, including:

- theme mode
- automation mode for the control socket
- embedded-browser host allowlists

Keep those choices documented in the handbook if they become part of the
machine baseline, but avoid tracking app-internal state in dotfiles unless it
has a stable file-based export path.
