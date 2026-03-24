# Essentials

This page defines the default baseline for a fresh machine before the more
specific application and language pages are filled in.

## Baseline Policy

Treat the workstation baseline as layered:

1. macOS and Xcode provide the Apple toolchain and the built-in command-line
   environment.
2. Homebrew provides the package-managed CLI tools that should exist on every
   rebuild.
3. The rest of the handbook explains why individual tools belong in the setup
   and how they should be configured after installation.

The root `Brewfile` is the source of truth for package-managed essentials.
Prefer curating that file over keeping long install command lists in the docs.
macOS ships with some developer tools already, but once bootstrap begins this
repo should prefer Homebrew-managed versions and explicit documentation over
relying on whatever happens to be preinstalled.

## What Counts As Essential

An essential tool should meet at least one of these conditions:

- it is used on nearly every machine rebuild
- it improves the default shell workflow in a meaningful way
- it supports repository, GitHub, or package-management tasks needed early in
  setup
- it is a default desktop app that should be available before deeper
  configuration begins

Do not treat one-off utilities, role-specific tools, or trial apps as
essentials. Those can be documented in the relevant application or language
section instead.

## Current Baseline

The tracked `Brewfile` currently covers a small default set:

- core CLI essentials: `bat`, `eza`, `fd`, `fzf`, `git`, `gh`, `htop`, `jq`,
  `procs`, `ripgrep`, `tldr`, and `watch`

As the handbook grows, add tools deliberately and keep the baseline focused on
what belongs on every machine.

## Essential Command-Line Tools

These are the only CLI tools currently treated as essentials in this repo:

- [`bat`](https://github.com/sharkdp/bat) — add syntax highlighting and better paging for file output
- [`eza`](https://eza.rocks/) — modernize directory listings beyond the default `ls`
- [`fd`](https://github.com/sharkdp/fd) — replace `find` with a faster, simpler interface
- [`fzf`](https://junegunn.github.io/fzf/) — fuzzy-find files, history, and other shell targets interactively
- [`git`](https://git-scm.com/) — manage repositories and source history
- [`gh`](https://cli.github.com/) — bring GitHub workflow into the terminal
- [`htop`](https://htop.dev/) — inspect processes interactively
- [`jq`](https://jqlang.org/) — inspect and transform JSON from the command line
- [`procs`](https://github.com/dalance/procs) — replace `ps` with friendlier process output
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) — search source trees faster than traditional `grep`
- [`tldr`](https://tldr.sh/) — look up short, practical command examples from the terminal
- [`watch`](https://man7.org/linux/man-pages/man1/watch.1.html) — run a command repeatedly and display the output in a terminal-friendly view

## Workflow

Use these commands from the repository root:

```bash
brew bundle check --file ./Brewfile
brew bundle install --file ./Brewfile
```

If you need to seed a new `Brewfile` from an existing machine, use
`brew bundle dump` as a draft and then remove anything that should not become
part of the long-term baseline.

## Where To Document More Detail

Keep this page focused on baseline policy. Put deeper notes in the sections
that match the tool type:

- shared font policy in [Fonts](fonts.md) when the same choices affect the
  whole machine baseline
- terminal applications and shell workflow in [Terminal](../applications/terminal/README.md)
- editors and IDEs in [Editors](../applications/editors/README.md)
- desktop utilities in [Utilities](../applications/utilities/README.md)
- broader software choices in [Productivity](../applications/productivity/README.md) or [Languages](../languages/README.md)
