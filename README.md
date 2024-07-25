# Eigen find_package repro

Repro case demonstrating oddities with `find_package` behavior.
`CMAKE_FIND_ROOT_PATH` is set to the root of the NDK to avoid CMake wrongly
finding host tools/libraries/packages, but that seemingly prevents apps from
using most of CMake's `find_*` even when they've set package paths explicitly.

To build:

```
cd app/src/main/cpp
NDK=path/to/ndk ./prepare_eigen.sh
cd -
./gradlew build
```

It will build correctly because the `find_package` call includes
`NO_CMAKE_FIND_ROOT_PATH`, but that disables the "don't use the host's stuff"
safety mechanism, so that workaround probably breaks other things on systems
where the thing being searched for is also present on the host system.

For some reason these problems _don't_ impact package discovery when they come
from an AAR. I'm not sure if that's a mistake I've made here, or if there's a
behavior difference allowing the AAR path to avoid the problem.
