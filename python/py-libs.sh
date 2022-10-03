#!/bin/sh

THISDIR=$(realpath "$(dirname "$0")")

getAns () {
   # $1 = opt1, $2 = opt2, $3 = question, $4 = ans
   printf "\n%s [%s/%s] " "$3" "$1" "$2"
   read -r _ans
   if [ "$_ans" != "$1" ]; then
      [ "$_ans" != "$2" ] && getAns "$1" "$2" "$3" "$4"
   else
      eval "$4"="'$_ans'" ; unset _ans
   fi
}

# check if pip is installed, if not we install it
if python3 -m pip --version >/dev/null 2>&1; then
   echo "pip is already installed."
else
   echo "pip is not installed. We are going to install it."
   "$THISDIR"/get-pip.py
fi

# python packages for the shell
getAns "y" "n" "Install ranger and ipython?" "_PYSHELL"
if [ "$_PYSHELL" = "y" ]; then
   echo "Installing ranger and ipython..."
   pip install ranger-fm ipython pygments
fi

# python packages for scientific computing
getAns "y" "n" "Install numpy, scipy, matplotlib and sympy?" "_PYSCI"
if [ "$_PYSCI" = "y" ]; then
   echo "Installing numpy, scipy, matplotlib and sympy..."
   pip install numpy scipy matplotlib sympy
fi
