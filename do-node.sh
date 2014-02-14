#!/bin/sh

VERSION=0.10.25
SRC=~/src
DEST=~/node

mkdir -p $SRC
cd $SRC

mkdir -p $DEST    # We will install it here

wget http://nodejs.org/dist/v$VERSION/node-v$VERSION.tar.gz
tar xfvz node-v$VERSION.tar.gz
cd node-v$VERSION

./configure --prefix ~/node
make && make install

# Seems like at this point, we should change the PATH in ~/.profile
# to include $HOME/node/bin
