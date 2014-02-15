#!/bin/sh
#
# In this script, we will start emacs which, with the right startup script,
# will download and install all the magical files into the .emacs.d/elpa
# directory...

$INSTALL_HOME/emacs/bin/emacs --eval '(kill-emacs)' && \
cp -r $HOME/.emacs.d $INSTALL_HOME
