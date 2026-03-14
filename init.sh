#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.config/nvim ~/.config/nvim
