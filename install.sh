#!/usr/bin/env bash

SOURCE=$(realpath $(dirname $0))

ln -sf $SOURCE/bin/tree-sitter-$(uname -s)-$(uname -m) $SOURCE/bin/tree-sitter

cd $SOURCE/src

make uninstall
make install

cd $SOURCE

