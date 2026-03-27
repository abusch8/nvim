#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function init {
    echo "removing ${2}"
    rm -rf ${2}
    echo "linking ${1} -> ${2}"
    ln -s ${1} ${2}
}

init $DIR/.vimrc        $HOME/.vimrc
init $DIR/.config/nvim  $HOME/.config/nvim
init $DIR/.bashrc       $HOME/.bashrc
init $DIR/.tmux.conf    $HOME/.tmux.conf
init $DIR/.config/tmux  $HOME/.config/tmux

