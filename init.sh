#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.config/nvim ~/.config/nvim
ln -sf $DIR/.bashrc ~/.bashrc
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sf $DIR/.config/tmux ~/.config/tmux
