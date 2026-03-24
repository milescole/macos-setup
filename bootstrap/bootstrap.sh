#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

log() {
  printf '[bootstrap] %s\n' "$1"
}

require_macos() {
  if [[ "$(uname -s)" != "Darwin" ]]; then
    printf 'This setup currently supports macOS only.\n' >&2
    exit 1
  fi
}

main() {
  require_macos
  log "Running scaffolding bootstrap"
  "${SCRIPT_DIR}/homebrew.sh"
  "${SCRIPT_DIR}/macos-defaults.sh"
  "${SCRIPT_DIR}/verify.sh"
  log "Bootstrap complete"
}

main "$@"
