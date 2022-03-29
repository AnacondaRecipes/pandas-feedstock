#!/bin/bash

set -ex
test -e $PREFIX/pandas/_libs/lib.${SHLIB_EXT}
test -e $PREFIX/pandas/_libs/interval.${SHLIB_EXT}
echo "Triggering pandas tests"
make prefix=$PREFIX CC=$CC
echo "completed triggering the tests"
echo "----------------------------------"
pwd
echo "----------------------------------"

