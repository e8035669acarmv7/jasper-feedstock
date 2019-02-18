#!/bin/bash

autoreconf -vfi
sh configure --prefix=$PREFIX \
             --enable-shared \
             --disable-debug \
             --disable-dependency-tracking

make
make check || {cat test/bin/test-suite.log; exit 1}
make install

# We can remove this when we start using the new conda-build.
find $PREFIX -name '*.la' -delete
