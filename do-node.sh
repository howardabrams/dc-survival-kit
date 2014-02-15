#!/bin/sh

VERSION=0.10.25
SRC=~/src
DEST=$INSTALL_HOME/node

if [ ! -d $SRC/node-v$VERSION ]
then
    mkdir -p $SRC
    cd $SRC

    wget http://nodejs.org/dist/v$VERSION/node-v$VERSION.tar.gz
    tar xfvz node-v$VERSION.tar.gz
fi

mkdir -p $DEST    # We will install it here

cd $SRC/node-v$VERSION
./configure clean
./configure --prefix $DEST
make && make install

# Seems like at this point, we should change the PATH in ~/.profile
# to include $HOME/node/bin

HOME=$INSTALL_HOME $DEST/bin/npm install -g underscore-cli
