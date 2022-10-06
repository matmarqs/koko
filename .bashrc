#!/bin/bash

#
# ~/.bashrc
#

## colors for the prompt
#BLACK='\[\e[0;30m\]'
#BBLACK='\[\e[1;30m\]'
#BGBLACK='\[\e[40m\]'
#RED='\[\e[0;31m\]'
#BRED='\[\e[1;31m\]'
#BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
#BGREEN='\[\e[1;32m\]'
#BGGREEN='\[\e[1;32m\]'
#YELLOW='\[\e[0;33m\]'
#BYELLOW='\[\e[1;33m\]'
#BGYELLOW='\[\e[1;33m\]'
#BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
#BGBLUE='\[\e[1;34m\]'
MAGENTA='\[\e[0;35m\]'
#BMAGENTA='\[\e[1;35m\]'
#BGMAGENTA='\[\e[1;35m\]'
#CYAN='\[\e[0;36m\]'
BCYAN='\[\e[1;36m\]'
#BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
#BWHITE='\[\e[1;37m\]'
#BGWHITE='\[\e[1;37m\]'

# prompt (colors are defined in .bash_profile)
PS1="${BBLUE}[${BCYAN}λ ${MAGENTA}\W${BBLUE}]${GREEN}\$ ${WHITE}"

# vi mode
set -o vi
bind -m vi-insert "\C-l":clear-screen

# compiles a basic C program
c () {
   PROGDIR="$(dirname "$1")"
   gcc -g -Wall -O2 "$1" -lm -o "$PROGDIR"/a.out #&& "$PROGDIR"/a.out
}

# aliases
# colors for commands
alias \
    ls="ls -hN --color=auto --group-directories-first" \
    la='ls -A' \
    ll='ls -lA' \
    grep='grep --color=auto' \
    egrep='grep -E --color=auto' \
    fgrep='grep -F --color=auto' \
    diff='diff --color=auto' \
    ip='ip --color=auto'
# abbreviations
alias \
    py="python3" \
    python="python3" \
    pip="pip3" \
    v="vim" \
    vi="vim" \
    nvi="vim" \
    nv="vim" \
    rg="ranger" \
    m="make" \
    mc="make clean" \
    pg="ps aux | grep -i" \
    chx="chmod +x" \
    ka="killall" \
    p="ping -c 3 google.com" \
    cptex="cp \$KOKO/templates/*.tex ." \
    cppy="cp \$KOKO/templates/*.py ."

## Less Colors for Man Pages
export LESS_TERMCAP_md=$'\E[1;38;5;39m'  # begin bold
export LESS_TERMCAP_us=$'\E[4;38;5;51m'  # underline
export LESS_TERMCAP_so=$'\E[30;42m'      # highlighting: green
export LESS_TERMCAP_me=$'\E[0;38;5;9m'   # end mode
export LESS_TERMCAP_mb=$'\E[0m'          # begin blinking
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode
export LESS="-R"
export MANPAGER="less -R"

# environmental variables
export RANGER_LOAD_DEFAULT_RC="FALSE"  # ranger config file
export IPYTHONDIR="${XDG_DATA_HOME:-$HOME/.local/share}/ipython"
export EDITOR="vim"
export BROWSER="firefox"
