[[ -f /etc/bashrc ]] && . /etc/bashrc

MAGENTA='\[\e[35m\]'
GREEN='\[\e[1;32m\]'
RESET='\[\e[0m\]'

PS1="${MAGENTA}\u${RESET}@${MAGENTA}\h${RESET}:\w\n${GREEN}\$${RESET} "

shopt -s extglob

export TERM=xterm-256color
export PATH="${HOME}/bin:${PATH}"
export PAGER=less

alias ssh='ssh -q'
alias ls='ls --color=auto'
alias ll='ls --color=auto -l'
alias k='kubectl'

function ff {
    if (( $# < 1 )); then return 1; fi
    find -L "${2:-.}" -type f -path "${1}" \( -empty -o -exec grep -Iq . {} \; \) -print 2>/dev/null
}

function vf {
    if (( $# < 1 )); then return 1; fi
    find -L "${2:-.}" -type f -path "${1}" \( -empty -o -exec grep -Iq . {} \; \) -print0 2>/dev/null | xargs -0 nvim
}

function fd {
    if (( $# < 1 )); then return 1; fi
    find -L "${2:-.}" -type f -path "${1}" \( -empty -o -exec grep -Iq . {} \; \) -delete
}

function fz {
    if (( $# < 1 )); then return 1; fi
    grep --color=auto -RIn "${2:-.}" -e "${1}" 2>/dev/null
}

function vz {
    if (( $# < 1 )); then return 1; fi
    find -L "${2:-.}" -type f -print0 2>/dev/null | xargs -0 grep -lIZ "${1}" | xargs -0 nvim -c "/${1}"
}

function fs {
    if (( $# < 2 )); then return 1; fi
    find -L "${3:-.}" -type f -print0 | xargs -0 sed -i.bak "s|${1}|${2}|g"
}

