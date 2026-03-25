# VS Code

`Visual Studio Code` is the default editor baseline in this setup.

It belongs in the baseline because the tracked shell config already uses
`code --wait` as the default `EDITOR`, and VS Code has a small, portable
settings file that is easy to restore on a fresh machine.

The package itself is installed by the baseline `Brewfile`, and the tracked
VS Code source files live at:

- `dotfiles/vscode/settings.json`
- `dotfiles/vscode/keybindings.json`
- `dotfiles/vscode/extensions.txt`

Apply the baseline with:

```bash
./bootstrap/dotfiles.sh vscode
```

That command:

- restores `settings.json` into `~/Library/Application Support/Code/User/`
- restores `keybindings.json` into `~/Library/Application Support/Code/User/`
- installs the tracked extensions from `dotfiles/vscode/extensions.txt`

The tracked shell PATH baseline also adds:

```text
/Applications/Visual Studio Code.app/Contents/Resources/app/bin
```

when the app bundle is present, so the `code` command works with the tracked
`EDITOR="code --wait"` shell setting.

The main tracked `settings.json` is the normal baseline:

- MesloLGM Nerd Font Mono as the primary editor and terminal font
- ligatures enabled for code rendering
- 4-space tabs and visible whitespace
- final newline and trailing whitespace cleanup enabled
- a reduced editor chrome setup with the minimap disabled
- a predictable startup state with no welcome screen
- a tracked keybindings file ready for machine-wide shortcuts
- a theme selection that matches the tracked extension baseline

The extension helper remains available as a maintenance command when you want
to review the installed extension set from an existing machine:

```bash
./scripts/vscode-extensions.sh export
```

That command prints the installed extension IDs in sorted order. Keep
`dotfiles/vscode/extensions.txt` curated, or set
`VSCODE_EXTENSIONS_OUTPUT_FILE=/tmp/vscode-extensions.txt` if you want to save
the raw export to a separate file while you edit the tracked baseline.

If you also use VS Code Settings Sync, keep this tracked file focused on the
machine-wide baseline and let sync handle personal extensions, accounts, and
nonessential preferences.
