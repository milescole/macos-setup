#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
status=0

pass() {
  printf '[verify] OK: %s\n' "$1"
}

warn() {
  printf '[verify] WARN: %s\n' "$1"
  status=1
}

check_command() {
  local command_name="$1"

  if command -v "${command_name}" >/dev/null 2>&1; then
    pass "Command available: ${command_name}"
  else
    warn "Missing command: ${command_name}"
  fi
}

check_path() {
  local path="$1"

  if [[ -e "${path}" ]] || [[ -L "${path}" ]]; then
    pass "Config present: ${path}"
  else
    warn "Missing config: ${path}"
  fi
}

check_path "${REPO_ROOT}/docs/SUMMARY.md"
check_path "${REPO_ROOT}/docs/README.md"
check_path "${REPO_ROOT}/dotfiles/README.md"
check_path "${REPO_ROOT}/Brewfile"
check_path "${REPO_ROOT}/bootstrap/homebrew.sh"

check_command "brew"

exit "${status}"
