#!/usr/bin/env bash

set -euo pipefail

log() {
  printf '[macos-defaults] %s\n' "$1"
}

require_macos() {
  if [[ "$(uname -s)" != "Darwin" ]]; then
    printf 'macOS defaults can only be applied on macOS.\n' >&2
    exit 1
  fi
}

write_bool() {
  local domain="$1"
  local key="$2"
  local value="$3"

  defaults write "${domain}" "${key}" -bool "${value}"
}

write_int() {
  local domain="$1"
  local key="$2"
  local value="$3"

  defaults write "${domain}" "${key}" -int "${value}"
}

write_string() {
  local domain="$1"
  local key="$2"
  local value="$3"

  defaults write "${domain}" "${key}" -string "${value}"
}

apply_desktop_and_dock_defaults() {
  log "Applying Desktop & Dock defaults"
  write_int com.apple.dock tilesize 30
  write_bool com.apple.dock show-recents false
}

apply_mission_control_defaults() {
  log "Applying Mission Control defaults"
  write_bool com.apple.dock mru-spaces false
}

apply_keyboard_defaults() {
  log "Applying Keyboard defaults"
  write_int NSGlobalDomain InitialKeyRepeat 15
  write_int NSGlobalDomain KeyRepeat 2
  write_bool NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled false
  write_bool NSGlobalDomain NSAutomaticDashSubstitutionEnabled false
}

apply_trackpad_defaults() {
  log "Applying Trackpad defaults"
  write_bool com.apple.AppleMultitouchTrackpad Clicking true
  write_bool com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  write_int NSGlobalDomain com.apple.mouse.tapBehavior 1
  write_bool com.apple.AppleMultitouchTrackpad TrackpadRightClick true
  write_bool com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick true
  write_int com.apple.AppleMultitouchTrackpad TrackpadRightClickBehavior 1
  write_int com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClickBehavior 1
}

apply_mouse_defaults() {
  log "Applying Mouse defaults"
  write_string com.apple.AppleMultitouchMouse MouseButtonMode TwoButton
}

apply_finder_defaults() {
  log "Applying Finder defaults"
  mkdir -p "${HOME}/Developer"
  write_string com.apple.finder NewWindowTarget PfHm
  write_string com.apple.finder NewWindowTargetPath "file://${HOME}/"
  write_bool NSGlobalDomain AppleShowAllExtensions true
  write_bool com.apple.finder ShowPathbar true
  write_bool com.apple.finder ShowStatusBar true
  write_bool com.apple.finder _FXSortFoldersFirst true
}

restart_affected_apps() {
  local app

  for app in Dock Finder; do
    if pgrep -x "${app}" >/dev/null 2>&1; then
      killall "${app}"
      log "Restarted ${app}"
    else
      log "${app} is not running; restart skipped"
    fi
  done
}

main() {
  require_macos
  apply_desktop_and_dock_defaults
  apply_mission_control_defaults
  apply_keyboard_defaults
  apply_trackpad_defaults
  apply_mouse_defaults
  apply_finder_defaults
  restart_affected_apps
  log "macOS defaults applied"
}

main "$@"
