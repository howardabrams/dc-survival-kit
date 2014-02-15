#!/bin/sh

VERSION=1.8
SRC=~/src
DEST=~/tmux

if [ ! -d $SRC/tmux-$VERSION ]
then
    mkdir -p $SRC
    cd $SRC
    wget http://sourceforge.net/projects/tmux/files/tmux/tmux-$VERSION/tmux-$VERSION.tar.gz
    tar xfvz tmux-$VERSION.tar.gz
fi

mkdir -p $DEST    # We will install it here

cd $SRC/tmux-$VERSION
./configure --prefix ~/tmux
make && make install

# Seems like at this point, we should change the PATH in ~/.profile
# to include $HOME/tmux/bin
