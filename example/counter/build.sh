#!/usr/bin/bash

if [[ $# -lt 1 ]];then
  echo "usage: $0 BRAFT_INCLUDE_PATH"
  exit 1
fi

set -x

BRAFT_INCLUDE_PATH=$1

cd $(dirname $0) || exit 2

rm -rf ./build/
cmake -B build -DBRAFT_INCLUDE_PATH="$BRAFT_INCLUDE_PATH"
cmake --build build -j"$(nproc)"

echo "Build done."

