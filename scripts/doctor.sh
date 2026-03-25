#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
status=0

"${REPO_ROOT}/bootstrap/verify.sh" || status=$?

if [[ -x "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]] || command -v code >/dev/null 2>&1; then
  "${REPO_ROOT}/scripts/vscode-extensions.sh" verify || status=$?
fi

exit "${status}"
