# Maintenance

Use the scripts in the repository root to keep the machine spec current.

Common maintenance tasks:

```bash
./scripts/doctor.sh
brew bundle install --file ./Brewfile
```

When the package baseline changes, edit `./Brewfile` directly and rerun
`brew bundle install --file ./Brewfile`.

If you use `brew bundle dump` to snapshot an existing machine, treat that output
as a draft. Remove one-off tools and keep only the formulas that
belong in the long-term workstation baseline.
