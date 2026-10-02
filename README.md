# Creating a Simple C++ Addition Library

## Objective

Create a small C++ library that provides a function for adding two integers. Build the library using CMake, install it locally, and use it from a separate C++ program.

The exercise is designed to work on **Linux, macOS, and Windows**.

## 1. Create the Project Structure

Create the following directory structure:

```text
addition-library/
├── CMakeLists.txt
├── include/
│   └── addition
├── src/
│   └── addition.cpp
└── examples/
    └── main.cpp
```

## 2. Create the Header File

Create:

```text
include/addition
```

Add the following code:

```cpp
#ifndef ADDITION_HPP_INCLUDED
#define ADDITION_HPP_INCLUDED

namespace addition
{
    int add(int a, int b);
}

#endif
```

## 3. Implement the Library

Create:

```text
src/addition.cpp
```

Add the following code:

```cpp
#include <addition>

namespace addition
{
    int add(int a, int b)
    {
        return a + b;
    }
}
```

## 4. Create the CMake Configuration

Create:

```text
CMakeLists.txt
```

Add the following:

```cmake
cmake_minimum_required(VERSION 3.20)

project(addition_library LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_library(addition STATIC
    src/addition.cpp
)

target_include_directories(addition
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

install(
    TARGETS addition
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin
)

install(
    FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/include/addition
    DESTINATION include
)
```

## 5. Build the Library

### Linux and macOS

Run:

```bash
cmake -S . -B build
cmake --build build
```

### Windows

Run:

```powershell
cmake -S . -B build
cmake --build build
```

## 6. Install the Library

### Linux and macOS

Run:

```bash
cmake --install build --prefix "$HOME/.local"
```

### Windows

Using PowerShell, run:

```powershell
cmake --install build --prefix "$HOME\.local"
```

## 7. Create a Program That Uses the Library

Create:

```text
examples/main.cpp
```

Add the following code:

```cpp
#include <iostream>
#include <addition>

int main()
{
    std::cout << addition::add(10, 20) << '\n';

    return 0;
}
```

## 8. Compile and Run the Example

### Linux and macOS

#### Linux

Compile using:

```bash
g++ examples/main.cpp \
    -I"$HOME/.local/include" \
    -L"$HOME/.local/lib
```
