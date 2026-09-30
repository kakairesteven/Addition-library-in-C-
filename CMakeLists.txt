cmake_minimum_required(VERSION 3.15)

# 
project(Addition
    VERSION 1.0.0
    LANGUAGES CXX
)

add_library(addition STATIC
    src/addition.cpp
)

target_include_directories(addition
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

target_compile_features(addition PUBLIC cxx_std_23)

install(
    TARGETS addition
    EXPORT AdditionTargets
    ARCHIVE DESTINATION lib
)

install(
    FILES include/addition
    DESTINATION include
)

install(
    EXPORT AdditionTargets
    FILE AdditionTargets.cmake
    NAMESPACE Addition::
    DESTINATION lib/cmake/Addition
)