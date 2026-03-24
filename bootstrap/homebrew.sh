#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
BREWFILE_PATH="${HOMEBREW_BUNDLE_FILE:-${REPO_ROOT}/Brewfile}"

log() {
  printf '[homebrew] %s\n' "$1"
}

require_brew() {
  if ! command -v brew >/dev/null 2>&1; then
    printf '[homebrew] Homebrew is required before bootstrap. Follow docs/getting-started/homebrew.md first.\n' >&2
    exit 1
  fi
}

require_brewfile() {
  if [[ ! -f "${BREWFILE_PATH}" ]]; then
    printf '[homebrew] Missing Brewfile: %s\n' "${BREWFILE_PATH}" >&2
    exit 1
  fi
}

main() {
  require_brew
  require_brewfile
  log "Syncing bundle from ${BREWFILE_PATH}"
  brew bundle install --file="${BREWFILE_PATH}"
}

main "$@"
