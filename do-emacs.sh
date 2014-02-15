#!/bin/sh

VERSION=24.3
SRC=~/src
DEST=$INSTALL_HOME/emacs

if [ ! -d $SRC/emacs-$VERSION ]
then
    mkdir -p $SRC
    cd $SRC
    wget http://ftp.gnu.org/gnu/emacs/emacs-$VERSION.tar.gz
    tar xfvz emacs-$VERSION.tar.gz
fi

mkdir -p $DEST    # We will install it here

cd $SRC/emacs-$VERSION
./configure clean
./configure --prefix $DEST --without-gui
make && make install

# Seems like at this point, we should change the PATH in ~/.profile
# to include $HOME/emacs/bin
