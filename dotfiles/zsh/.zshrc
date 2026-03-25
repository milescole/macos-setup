# Interactive zsh shell setup.
ZSH_CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/zsh"
LEGACY_ZSH_CONFIG_DIR="${HOME}/shell"

load_zsh_file() {
  local file_name="$1"
  local primary_path="${ZSH_CONFIG_DIR}/${file_name}"
  local legacy_path="${LEGACY_ZSH_CONFIG_DIR}/${file_name}"

  if [[ -f "${primary_path}" ]]; then
    source "${primary_path}"
  elif [[ -f "${legacy_path}" ]]; then
    source "${legacy_path}"
  fi
}

# === Prompt ===
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# === Homebrew / Completions ===
if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix)"
  FPATH="${BREW_PREFIX}/share/zsh/site-functions:${FPATH}"
  FPATH="${BREW_PREFIX}/share/zsh-completions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# === Plugins ===
if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="${BREW_PREFIX:-$(brew --prefix)}"

  if [[ -f "${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "${BREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  fi

  if [[ -f "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    source "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

    autoload -U history-search-end
    zle -N history-beginning-search-backward-end history-search-end
    zle -N history-beginning-search-forward-end history-search-end
    bindkey "^[[A" history-beginning-search-backward-end
    bindkey "^[[B" history-beginning-search-forward-end
  fi
fi

# === Managed Zsh Config ===
for zsh_file in exports.zsh paths.zsh functions.zsh aliases.zsh; do
  load_zsh_file "${zsh_file}"
done

load_zsh_file "extra.zsh"

if [[ -f "${ZSH_CONFIG_DIR}/local.zsh" ]]; then
  source "${ZSH_CONFIG_DIR}/local.zsh"
fi
