# Fonts

Treat fonts as part of the essential machine baseline because they affect both
terminal prompts and editor rendering on every rebuild.

The tracked `Brewfile` installs these fonts during bootstrap immediately after
the rest of the essential tools.

Each family is installed in both regular and Nerd Font forms so editor and
terminal configuration can choose the right variant without adding a second
package later.

## Installed Font Families

```bash
brew install --cask font-meslo-lg
brew install --cask font-meslo-lg-nerd-font
brew install --cask font-fira-code
brew install --cask font-fira-code-nerd-font
brew install --cask font-hack
brew install --cask font-hack-nerd-font
brew install --cask font-iosevka
brew install --cask font-iosevka-nerd-font
```

Use the Nerd Font variants for shell-focused tools that need extra prompt
glyphs. Use regular `Iosevka` as the default editor font baseline unless a
tool-specific page says otherwise.
