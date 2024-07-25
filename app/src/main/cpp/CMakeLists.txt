
cmake_minimum_required(VERSION 3.22.1)
project("myapplication")

list(APPEND CMAKE_PREFIX_PATH eigen-install)

# NO_CMAKE_FIND_ROOT_PATH is an unfortunate requirement (it runs the risk of finding CMake packages
# installed for the host machine). We should see if there's something we can do to make that
# unnecessary.
find_package(Eigen3 3 REQUIRED CONFIG NO_CMAKE_FIND_ROOT_PATH)

add_library(${CMAKE_PROJECT_NAME} SHARED
    # List C/C++ source files with relative paths to this CMakeLists.txt.
    native-lib.cpp)

# Specifies libraries CMake should link to your target library. You
# can link libraries from various origins, such as libraries defined in this
# build script, prebuilt third-party libraries, or Android system libraries.
target_link_libraries(${CMAKE_PROJECT_NAME}
    # List libraries link to the target library
    android
    log)