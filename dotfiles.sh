#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG="$HOME/.config/nvim"
NVIM_FILES=(init.lua lazyvim.json lazy-lock.json .neoconf.json stylua.toml)

backup() {
  local dest="$HOME/.config/nvim-backup-$(date +%Y%m%d-%H%M%S)"
  echo "Backup: $NVIM_CONFIG → $dest"
  cp -r "$NVIM_CONFIG" "$dest"
}

clear_cache() {
  echo "Clearing nvim cache and data..."
  rm -rf "$HOME/.cache/nvim"
  rm -rf "$HOME/.local/share/nvim"
  rm -rf "$HOME/.local/state/nvim"
}

cmd_install() {
  [ -d "$NVIM_CONFIG" ] && backup
  clear_cache
  mkdir -p "$NVIM_CONFIG"
  rsync -a --delete "$DOTFILES_DIR/nvim/lua/" "$NVIM_CONFIG/lua/"
  for f in "${NVIM_FILES[@]}"; do
    [ -f "$DOTFILES_DIR/nvim/$f" ] && cp -f "$DOTFILES_DIR/nvim/$f" "$NVIM_CONFIG/$f"
  done
  echo "Installed → $NVIM_CONFIG"
}

cmd_sync() {
  rsync -a --delete "$NVIM_CONFIG/lua/" "$DOTFILES_DIR/nvim/lua/"
  for f in "${NVIM_FILES[@]}"; do
    [ -f "$NVIM_CONFIG/$f" ] && cp -f "$NVIM_CONFIG/$f" "$DOTFILES_DIR/nvim/$f"
  done
  echo "Synced → dotfiles"
}

usage() {
  echo "Usage: $(basename "$0") <command>"
  echo ""
  echo "Commands:"
  echo "  install    dotfiles → ~/.config/nvim  (backs up config, clears cache)"
  echo "  sync       ~/.config/nvim → dotfiles"
}

case "${1:-}" in
  install) cmd_install ;;
  sync)    cmd_sync ;;
  *)       usage; exit 1 ;;
esac
