# Machine Rebuild

For a fresh machine rebuild:

1. Install baseline developer prerequisites.
2. Clone this repository.
3. Run `./bootstrap/bootstrap.sh` to apply the tracked `Brewfile` and setup
   scripts.
4. Review macOS settings, application sign-ins, and any post-install steps.
5. Apply the tracked dotfiles after the rest of the machine baseline is in
   place.
6. Run `./scripts/doctor.sh` to verify the setup.

Keep this page focused on the shortest reliable path from a blank machine to a
working development environment.
