#!/bin/bash -ex

if [ -z "$NDK" ]; then
  echo >&2 NDK is not set
  exit 1
fi

if [ ! -e eigen ]; then
  git clone https://gitlab.com/libeigen/eigen.git
fi

rm -rf eigen-build eigen-install
mkdir eigen-build eigen-install
cd eigen-build
cmake \
  -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=android-21 \
  -DCMAKE_INSTALL_PREFIX=../eigen-install \
  ../eigen

cmake --install .
