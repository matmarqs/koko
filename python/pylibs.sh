#!/bin/sh

PYDIR=$(realpath "$(dirname "$0")")
[ -z "$KOKO" ] && KOKO=$(realpath "$PYDIR/..")
[ -z "$PYTHONPATH" ] && PYTHONPATH="$KOKO/python"  # this is important for the module python3-distutils

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

configureIPython () {
   [ -z "$IPYTHONDIR" ] && IPYTHONDIR="${XDG_DATA_HOME:-$HOME/.local/share}/.local/share/ipython"
   mkdir -p "$IPYTHONDIR/profile_default/startup"
   cp "$PYDIR"/ipython_config.py "$IPYTHONDIR/profile_default"
   cp "$PYDIR"/00-functions.py "$IPYTHONDIR/profile_default/startup"
}

configureRanger () {
   [ ! -d "$HOME"/.config ] && mkdir -p "$HOME"/.config
   cp "$PYDIR"/rc.conf "$HOME"/.config
}

# check if pip is installed, if not we install it
if python3 -m pip --version >/dev/null 2>&1; then
   echo "pip is already installed."
else
   echo "pip is not installed. We are going to install it."
   if "$PYDIR"/get-pip.py --user; then # here we are using the variable $PYTHONPATH
      echo "pip was installed succesfully."
   else
      echo "There was an error when installing pip." && exit 1
   fi
fi

# python packages for the shell
getAns "y" "n" "Install ranger and ipython?" "_PYSHELL"
if [ "$_PYSHELL" = "y" ]; then
   echo "Installing ranger and ipython..."
   pip3 install ranger-fm ipython && configureRanger && configureIPython
fi

# python packages for scientific computing
getAns "y" "n" "Install numpy, scipy, matplotlib and sympy?" "_PYSCI"
if [ "$_PYSCI" = "y" ]; then
   echo "Installing numpy, scipy, matplotlib and sympy..."
   pip3 install numpy scipy matplotlib sympy
fi
