[[ -f /etc/bashrc ]] && . /etc/bashrc

MAGENTA='\[\e[35m\]'
GREEN='\[\e[1;32m\]'
RESET='\[\e[0m\]'

PS1="${MAGENTA}\u${RESET}@${MAGENTA}\h${RESET}:\w\n${GREEN}\$${RESET} "

shopt -s extglob

export TERM=xterm-256color
export PATH="${HOME}/bin:${PATH}"
export PAGER=less
export NVIM_THEME=kanagawa
export NVIM_ENABLE_ICONS=1

function ff {
    (( $# >= 1 )) && find -L "${2:-.}" -type f -path "${1}" 2>/dev/null
}

function fz {
    (( $# >= 1 )) && grep --color=auto -RIn "${2:-.}" -e "${1}" 2>/dev/null
}

function fs {
    (( $# >= 2 )) && find -L "${3:-.}" -type f -print0 | xargs -0 sed -i.bak "s|${1}|${2}|g"
}

function vf {
    (( $# >= 1 )) && find -L "${2:-.}" -type f -path "${1}" -exec nvim {} + 2>/dev/null
}

function vz {
    (( $# >= 1 )) && find -L "${2:-.}" -type f -print0 2>/dev/null | xargs -0 grep -lIZ "${1}" | xargs -0 nvim -c "/${1}"
}

alias ssh='ssh -q'
alias ls='ls --color=auto'
alias ll='ls --color=auto -l'

