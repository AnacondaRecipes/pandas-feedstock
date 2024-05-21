#!/bin/bash

set -ex

cd ${SRC_DIR}

if [ "$(uname -m)" = "ppc64le" ]; then
  export PYTHONUNBUFFERED=1
fi

mkdir builddir
$PYTHON -m build --wheel --no-isolation --skip-dependency-check \
    -Cbuilddir=builddir \
    -Ccompile-args="-v" \
    || (cat builddir/meson-logs/meson-log.txt && exit 1)
$PYTHON -m pip install dist/pandas*.whl --no-deps --no-build-isolation