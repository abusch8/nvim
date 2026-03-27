#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function symlink {
    echo "removing $2"
    rm -rf "$2"
    echo "linking $1 -> $2"
    ln -s "$1" "$2"
}

function git_config {
    echo "git config --global \"$1\" \"$2\""
    git config --global --unset-all "$1"
    git config --global "$1" "$2"
}

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/tmux"

symlink "$DIR/.vimrc"       "$HOME/.vimrc"
symlink "$DIR/.config/nvim" "$HOME/.config/nvim"
symlink "$DIR/.bashrc"      "$HOME/.bashrc"
symlink "$DIR/.tmux.conf"   "$HOME/.tmux.conf"
symlink "$DIR/.config/tmux" "$HOME/.config/tmux"

git_config "core.autocrlf"  "false"
git_config "core.editor"    "nvim"
git_config "core.eol"       "lf"
git_config "core.pager"     "less -R"
git_config "color.status"   "always"
git_config "http.sslVerify" "false"
git_config "merge.tool"     "vimdiff"
git_config "pull.rebase"    "false"

echo "done"
