#!/usr/bin/env bash

set -euo pipefail

log() {
  printf '[macos-defaults] %s\n' "$1"
}

if [[ "$(uname -s)" != "Darwin" ]]; then
  printf 'macOS defaults can only be applied on macOS.\n' >&2
  exit 1
fi

log "No macOS defaults are applied in the scaffolding commit"
