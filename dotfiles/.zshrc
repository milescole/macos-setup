# Interactive zsh shell setup.
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

# === Personal Files ===
[[ -f ~/shell/exports.zsh ]] && source ~/shell/exports.zsh
[[ -f ~/shell/extra.zsh ]] && source ~/shell/extra.zsh
[[ -f ~/shell/functions.zsh ]] && source ~/shell/functions.zsh
[[ -f ~/shell/aliases.zsh ]] && source ~/shell/aliases.zsh
[[ -f ~/shell/paths.zsh ]] && source ~/shell/paths.zsh
