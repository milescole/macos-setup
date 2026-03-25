#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DEST_HOME="${DOTFILES_DEST_HOME:-${HOME}}"
DOTFILES_MODE="${DOTFILES_MODE:-auto}"
DOTFILES_REF="${DOTFILES_REF:-main}"

log() {
  printf '[dotfiles] %s\n' "$1"
}

die() {
  printf '[dotfiles] %s\n' "$1" >&2
  exit 1
}

derive_base_url() {
  local remote_url owner repo

  if [[ -n "${DOTFILES_BASE_URL:-}" ]]; then
    printf '%s\n' "${DOTFILES_BASE_URL%/}"
    return 0
  fi

  remote_url="$(git -C "${REPO_ROOT}" config --get remote.origin.url || true)"

  if [[ "${remote_url}" =~ ^https://github\.com/([^/]+)/([^/.]+)(\.git)?$ ]]; then
    owner="${BASH_REMATCH[1]}"
    repo="${BASH_REMATCH[2]}"
    printf 'https://raw.githubusercontent.com/%s/%s/%s/dotfiles\n' \
      "${owner}" "${repo}" "${DOTFILES_REF}"
    return 0
  fi

  if [[ "${remote_url}" =~ ^git@github\.com:([^/]+)/([^/.]+)(\.git)?$ ]]; then
    owner="${BASH_REMATCH[1]}"
    repo="${BASH_REMATCH[2]}"
    printf 'https://raw.githubusercontent.com/%s/%s/%s/dotfiles\n' \
      "${owner}" "${repo}" "${DOTFILES_REF}"
    return 0
  fi

  return 1
}

copy_local_file() {
  local relative_path="$1"
  local destination_path="$2"

  cp "${REPO_ROOT}/dotfiles/${relative_path}" "${destination_path}"
}

download_remote_file() {
  local relative_path="$1"
  local destination_path="$2"
  local base_url="$3"
  local encoded_path

  encoded_path="${relative_path// /%20}"
  curl -fsSL "${base_url}/${encoded_path}" -o "${destination_path}"
}

stage_file() {
  local relative_path="$1"
  local destination_path="$2"
  local base_url=""

  if [[ "${DOTFILES_MODE}" == "remote" ]]; then
    base_url="$(derive_base_url)" || die "Unable to determine DOTFILES_BASE_URL for remote mode."
    download_remote_file "${relative_path}" "${destination_path}" "${base_url}"
  elif [[ "${DOTFILES_MODE}" == "local" ]]; then
    copy_local_file "${relative_path}" "${destination_path}"
  else
    if base_url="$(derive_base_url)"; then
      download_remote_file "${relative_path}" "${destination_path}" "${base_url}"
    else
      copy_local_file "${relative_path}" "${destination_path}"
    fi
  fi
}

install_file() {
  local relative_path="$1"
  local destination_path="${DEST_HOME}/${relative_path}"
  install_file_to "${relative_path}" "${destination_path}"
}

install_file_to() {
  local relative_path="$1"
  local destination_path="$2"
  local temp_path

  mkdir -p "$(dirname "${destination_path}")"
  temp_path="$(mktemp "${TMPDIR:-/tmp}/dotfile.XXXXXX")"
  stage_file "${relative_path}" "${temp_path}"

  if [[ -e "${destination_path}" ]] && cmp -s "${temp_path}" "${destination_path}"; then
    rm -f "${temp_path}"
    log "Unchanged: ${destination_path}"
    return 0
  fi

  if [[ -e "${destination_path}" ]]; then
    mv "${destination_path}" "${destination_path}.bak.$(date +%Y%m%d%H%M%S)"
    log "Backed up existing file: ${destination_path}"
  fi

  mv "${temp_path}" "${destination_path}"
  log "Installed: ${destination_path}"
}

install_vscode_extensions() {
  local temp_path

  temp_path="$(mktemp "${TMPDIR:-/tmp}/dotfile.XXXXXX")"
  stage_file "vscode/extensions.txt" "${temp_path}"
  log "Installing tracked VS Code extensions"
  if ! VSCODE_EXTENSIONS_FILE="${temp_path}" \
    "${REPO_ROOT}/scripts/vscode-extensions.sh" install; then
    rm -f "${temp_path}"
    return 1
  fi
  rm -f "${temp_path}"
}

install_component() {
  local component="$1"

  case "${component}" in
    all)
      install_component core
      install_component ghostty
      install_component shell
      install_component starship
      install_component vscode
      ;;
    core)
      install_file ".gitconfig"
      install_file ".zprofile"
      ;;
    ghostty)
      install_file ".config/ghostty/config"
      ;;
    shell)
      install_file ".zshrc"
      install_file "shell/.gitattributes"
      install_file "shell/.gitignore"
      install_file "shell/aliases.zsh"
      install_file "shell/exports.zsh"
      install_file "shell/extra.zsh"
      install_file "shell/functions.zsh"
      install_file "shell/paths.zsh"
      ;;
    starship)
      install_file ".config/starship.toml"
      ;;
    vscode)
      install_file_to "vscode/settings.json" \
        "${DEST_HOME}/Library/Application Support/Code/User/settings.json"
      install_file_to "vscode/keybindings.json" \
        "${DEST_HOME}/Library/Application Support/Code/User/keybindings.json"
      install_vscode_extensions
      ;;
    *)
      die "Unknown component: ${component}. Expected one of: all, core, ghostty, shell, starship, vscode."
      ;;
  esac
}

main() {
  if [[ "$#" -eq 0 ]]; then
    install_component all
    return 0
  fi

  for component in "$@"; do
    install_component "${component}"
  done
}

main "$@"
