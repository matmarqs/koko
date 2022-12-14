#!/bin/sh

KOKOPY=$(realpath "$(dirname "$0")")
[ -z "$KOKO" ] && KOKO="$(realpath "$KOKOPY/..")"
PYTHONPATH="$HOME/.local/lib/py-modules"  # this is important for the module python3-distutils

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
   cp "$KOKOPY"/ipython_config.py "$IPYTHONDIR/profile_default"
   cp "$KOKOPY"/00-functions.py "$IPYTHONDIR/profile_default/startup"
}

configureRanger () {
   [ ! -d "$HOME"/.config/ranger ] && mkdir -p "$HOME"/.config/ranger
   cp "$KOKOPY"/rc.conf "$HOME"/.config/ranger
}

#getPythonVersion () {
#   PYVERSION=$(python3 --version | awk '{print $2}' | awk -F '.' '{print $1 "." $2;}')
#}

[ ! -d "$PYTHONPATH" ] &&
mkdir -p "$PYTHONPATH"
echo "Copying distutils module to PYTHONPATH=\"$PYTHONPATH\"."
cp -r "$KOKOPY"/distutils "$PYTHONPATH"

# install pip
echo "installing or upgrading pip..."
if PYTHONPATH="$PYTHONPATH" "$KOKOPY"/get-pip.py --user; then # we are using $PYTHONPATH
   echo "pip was installed succesfully."
else
   echo "There was an error when installing pip." && exit 1
fi

# python packages for the shell
getAns "y" "n" "Install ranger and ipython?" "_PYSHELL"
if [ "$_PYSHELL" = "y" ]; then
   echo "Installing ranger and ipython..."
   PYTHONPATH="$PYTHONPATH" "$HOME"/.local/bin/pip install --user ranger-fm ipython && configureRanger && configureIPython
fi

# python packages for scientific computing
getAns "y" "n" "Install numpy, scipy, matplotlib and sympy?" "_PYSCI"
if [ "$_PYSCI" = "y" ]; then
   echo "Installing numpy, scipy, matplotlib and sympy..."
   PYTHONPATH="$PYTHONPATH" "$HOME"/.local/bin/pip install --user numpy scipy matplotlib sympy
fi
