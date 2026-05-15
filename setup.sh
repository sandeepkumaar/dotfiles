#!/bin/bash
# setup.sh - symlink dotfiles to home directory
# Run this after cloning the repo to ~/dotfiles

DOTFILES="$HOME/dotfiles"

symlink() {
  local src="$DOTFILES/$1"
  local dest="$HOME/$2"

  # Create parent directory if needed
  mkdir -p "$(dirname "$dest")"

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "Backing up $dest → $dest.backup"
    mv "$dest" "$dest.backup"
  fi

  ln -sf "$src" "$dest"
  echo "Linked $dest → $src"
}

copy() {
  local src="$DOTFILES/$1"
  local dest="$HOME/$2"

  mkdir -p "$(dirname "$dest")"

  if [ -e "$dest" ]; then
    echo "Backing up $dest → $dest.backup"
    mv "$dest" "$dest.backup"
  fi

  cp "$src" "$dest"
  echo "Copied $src → $dest"
}

symlink ".tmux.conf"        ".tmux.conf"
symlink ".bashrc"           ".bashrc"
copy    ".zshrc"            ".zshrc"
symlink ".vimrc"            ".vimrc"
symlink ".config/nvim"      ".config/nvim"

echo ""
echo "Done. Machine-specific config goes in ~/.bash_local (not tracked in git)."
