#!/usr/bin/env bash

SOURCE=$(realpath $(dirname $0))

cd $SOURCE/src

make reinstall

cd $SOURCE
