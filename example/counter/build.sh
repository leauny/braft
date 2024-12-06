#!/usr/bin/bash

cd $(dirname $0) || exit 2

BRAFT_BUILD_DIR=$(find ../..  -type d -path "*output/include/braft" | xargs dirname | xargs dirname | xargs dirname)

if [[ $BRAFT_BUILD_DIR == "" ]]; then
    echo "braft not found"
    exit 1
fi

if (cat $BRAFT_BUILD_DIR/CMakeCache.txt | grep ninja) &> /dev/null ; then
    ninja -C $BRAFT_BUILD_DIR -j"$(nproc)"
else
    make --directory $BRAFT_BUILD_DIR -j"$(nproc)"
fi

rm -rf ./build/
cmake -B build
cmake --build build -j"$(nproc)"

echo "Build done."

