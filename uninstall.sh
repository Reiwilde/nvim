#!/usr/bin/env bash

SOURCE=$(realpath $(dirname $0))

rm $SOURCE/bin/tree-sitter

cd $SOURCE/src

make uninstall

cd $SOURCE
