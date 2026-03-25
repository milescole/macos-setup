#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
EXTENSIONS_FILE="${VSCODE_EXTENSIONS_FILE:-${REPO_ROOT}/dotfiles/vscode/extensions.txt}"
CODE_APP_BIN="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
EXTENSIONS_OUTPUT_FILE="${VSCODE_EXTENSIONS_OUTPUT_FILE:-}"

log() {
  printf '[vscode-extensions] %s\n' "$1"
}

die() {
  printf '[vscode-extensions] %s\n' "$1" >&2
  exit 1
}

resolve_code_bin() {
  if command -v code >/dev/null 2>&1; then
    command -v code
    return 0
  fi

  if [[ -x "${CODE_APP_BIN}" ]]; then
    printf '%s\n' "${CODE_APP_BIN}"
    return 0
  fi

  die "Missing 'code' command. Install VS Code so the CLI is available from PATH or the app bundle."
}

require_extensions_file() {
  [[ -f "${EXTENSIONS_FILE}" ]] || die "Missing extensions file: ${EXTENSIONS_FILE}"
}

emit_extensions_list() {
  local code_bin="$1"

  if [[ -n "${EXTENSIONS_OUTPUT_FILE}" ]]; then
    mkdir -p "$(dirname "${EXTENSIONS_OUTPUT_FILE}")"
    "${code_bin}" --list-extensions | sort > "${EXTENSIONS_OUTPUT_FILE}"
    log "Exported extensions to ${EXTENSIONS_OUTPUT_FILE}"
    return 0
  fi

  "${code_bin}" --list-extensions | sort
}

install_extensions() {
  local code_bin
  local extension

  code_bin="$(resolve_code_bin)"
  require_extensions_file

  while IFS= read -r extension || [[ -n "${extension}" ]]; do
    [[ -z "${extension}" ]] && continue
    [[ "${extension}" == \#* ]] && continue

    log "Installing ${extension}"
    "${code_bin}" --install-extension "${extension}"
  done < "${EXTENSIONS_FILE}"
}

export_extensions() {
  local code_bin

  code_bin="$(resolve_code_bin)"
  emit_extensions_list "${code_bin}"
}

verify_extensions() {
  local code_bin
  local extension
  local installed_extensions
  local status=0

  code_bin="$(resolve_code_bin)"
  require_extensions_file
  installed_extensions="$(mktemp "${TMPDIR:-/tmp}/vscode-extensions.XXXXXX")"
  "${code_bin}" --list-extensions | sort > "${installed_extensions}"

  while IFS= read -r extension || [[ -n "${extension}" ]]; do
    [[ -z "${extension}" ]] && continue
    [[ "${extension}" == \#* ]] && continue

    if grep -Fqx -- "${extension}" "${installed_extensions}"; then
      log "Installed: ${extension}"
    else
      printf '[vscode-extensions] Missing: %s\n' "${extension}" >&2
      status=1
    fi
  done < "${EXTENSIONS_FILE}"

  rm -f "${installed_extensions}"

  if [[ "${status}" -eq 0 ]]; then
    log "All tracked VS Code extensions are installed"
  fi

  return "${status}"
}

usage() {
  cat <<'EOF'
Usage: ./scripts/vscode-extensions.sh [install|export|verify]

Commands:
  install  Install the tracked VS Code extensions from dotfiles/vscode/extensions.txt
  export   Print the current VS Code extension list in sorted order
  verify   Confirm that all tracked VS Code extensions are installed

Environment:
  VSCODE_EXTENSIONS_FILE         Override the tracked extension source file
  VSCODE_EXTENSIONS_OUTPUT_FILE  Write export output to a file instead of stdout
EOF
}

main() {
  local command="${1:-install}"

  case "${command}" in
    install)
      install_extensions
      ;;
    export)
      export_extensions
      ;;
    verify)
      verify_extensions
      ;;
    -h|--help|help)
      usage
      ;;
    *)
      die "Unknown command: ${command}"
      ;;
  esac
}

main "$@"
