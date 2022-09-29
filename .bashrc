#
# ~/.bashrc
#

## colors for the prompt
#BLACK='\[\e[0;30m\]'
#BBLACK='\[\e[1;30m\]'
#BGBLACK='\[\e[40m\]'
#RED='\[\e[0;31m\]'
BRED='\[\e[1;31m\]'
#BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
BGREEN='\[\e[1;32m\]'
#BGGREEN='\[\e[1;32m\]'
#YELLOW='\[\e[0;33m\]'
BYELLOW='\[\e[1;33m\]'
#BGYELLOW='\[\e[1;33m\]'
#BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
#BGBLUE='\[\e[1;34m\]'
#MAGENTA='\[\e[0;35m\]'
BMAGENTA='\[\e[1;35m\]'
#BGMAGENTA='\[\e[1;35m\]'
#CYAN='\[\e[0;36m\]'
#BCYAN='\[\e[1;36m\]'
#BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
#BWHITE='\[\e[1;37m\]'
#BGWHITE='\[\e[1;37m\]'

# prompt (colors are defined in .bash_profile)
PS1="${BRED}[${BYELLOW}\u${BGREEN}@${BBLUE}\h ${BMAGENTA}\W${BRED}]${GREEN}\$ ${WHITE}"

# vi mode
set -o vi
bind -m vi-insert "\C-l":clear-screen

## some functions to make life easier
# compiles a basic C program
c () {
   PROGDIR="$(dirname "$1")"
   gcc -g -Wall -O2 "$1" -lm -o "$PROGDIR"/a.out #&& "$PROGDIR"/a.out
}
# compiles a C math program that uses the GSL library
cgsl () {
   PROGDIR="$(dirname "$1")"
	gcc -std=gnu99 -g -Wall -O2 "$1" -lgsl -lgslcblas -lm -o "$PROGDIR"/a.out
}
# compiles a basic C++ program
cpp () {
   PROGDIR="$(dirname "$1")"
   g++ -g -Wall -O2 "$1" -o "$PROGDIR"/a.out #&& "$PROGDIR"/a.out
}

# environmental variables
export LESS="-R --use-color -Dd+G\$-Du+r\$-DS+kY\$-DE+Y\$-DP+Y"
export MANPAGER="less -R --use-color -Dd+G -Du+r -DS+kY -DE+Y -DP+Y"
export EDITOR="vim"
export BROWSER="firefox"
