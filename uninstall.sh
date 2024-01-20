#!/usr/bin/env bash

SOURCE=$(dirname $BASH_SOURCE)

rm $SOURCE/bin/tree-sitter

cd $SOURCE/src

make uninstall

cd $SOURCE
