# Managed shell aliases loaded from .zshrc.

# === bat ===
if command -v bat >/dev/null 2>&1; then
  alias cat="bat --theme='OneHalfLight'"
fi

# === eza ===
if command -v eza >/dev/null 2>&1; then
  unalias -m 'ls' 2>/dev/null || true
  unalias -m 'll' 2>/dev/null || true

  alias ls='eza --header --group --git --long'
  alias ls.tree='eza --header --group --tree --level=3 --git --long --icons'
  alias ll='eza --header --group --long --all'
  alias ll.tree='eza --header --group --tree --level=3 --git --long --icons --all'
fi

# === fd ===
if command -v fd >/dev/null 2>&1; then
  # Include hidden and ignored paths when needed.
  alias fda='fd -IH'
fi

# === htop ===
if command -v htop >/dev/null 2>&1; then
  alias top='htop --tree'
fi

# === procs ===
if command -v procs >/dev/null 2>&1; then
  alias ps='procs'
fi

# === ripgrep ===
if command -v rg >/dev/null 2>&1; then
  alias rga='rg -uuu'
  alias grep='rga'
fi

# === tldr ===
if command -v tldr >/dev/null 2>&1; then
  alias help='tldr'
fi
