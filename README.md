# Creating an Addition Library in C++

## 1. Objective

The objective of this exercise is to create a simple reusable C++ library that provides an addition operation.

By completing this exercise, you will learn how to:

* Separate a C++ interface from its implementation
* Create a static library
* Organize a C++ project
* Use namespaces
* Build a library using CMake
* Install a C++ library
* Use an installed library in another C++ program

---

## 2. Project Structure

Create the following directory structure:

```text
addition_library/
├── CMakeLists.txt
├── include/
│   └── addition
├── src/
│   └── addition.cpp
└── examples/
    └── main.cpp
```

The `include/addition` file is the library's public header.

---

## 3. Create the Header File

Create:

```text
include/addition
```

Add the following code:

```cpp
#ifndef ADDITION
#define ADDITION

namespace addition
{
    int add(int a, int b);
}

#endif
```

This file contains the **interface** of the library.

The user of the library only needs to know that an `add()` function exists. They do not need to know how the function is implemented.

---

## 4. Create the Implementation

Create:

```text
src/addition.cpp
```

Add:

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

This file contains the implementation of the `add()` function.

The implementation is separated from the public interface.

---

## 5. Create the CMake Configuration

Create:

```text
CMakeLists.txt
```

Add:

```cmake
cmake_minimum_required(VERSION 3.15)

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

target_compile_features(addition PUBLIC cxx_std_17)

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
```

This configuration tells CMake:

* The project is called `Addition`
* The library is a static library
* `src/addition.cpp` is part of the library
* `include/` contains public headers
* The library requires C++17
* The library and header should be installed

---

## 6. Build the Library

From the project directory, create a build directory:

```bash
cmake -S . -B build
```

Then compile:

```bash
cmake --build build
```

After a successful build, the static library will be created inside the build directory.

The library will typically be named:

```text
libaddition.a
```

---

## 7. Install the Library

For a user-local installation, use:

```bash
cmake --install build --prefix "$HOME/.local"
```

The library will be installed approximately as:

```text
~/.local/
├── include/
│   └── addition
└── lib/
    └── libaddition.a
```

A user-local installation does not require administrator privileges.

---

## 8. Create an Example Application

Create:

```text
examples/main.cpp
```

Add:

```cpp
#include <iostream>
#include <addition>

int main()
{
    std::cout << addition::add(10, 20) << '\n';

    return 0;
}
```

The application uses the installed library through:

```cpp
#include <addition>
```

---

## 9. Compile the Example Application

Because the library was installed under `$HOME/.local`, compile the application using:

```bash
g++ examples/main.cpp \
    -I"$HOME/.local/include" \
    -L"$HOME/.local/lib" \
    -laddition \
    -o addition_example
```

Run the program:

```bash
./addition_example
```

Expected output:

```text
30
```

---

## 10. Understanding the Compilation Process

The overall process is:

```text
addition.cpp
     │
     ▼
   Compiler
     │
     ▼
addition.o
     │
     ▼
Static Library
     │
     ▼
libaddition.a
     │
     ▼
Application
     │
     ▼
addition_example
```

The important distinction is between **compilation** and **linking**.

### Compilation

```bash
g++ -c addition.cpp
```

converts source code into object code.

### Library creation

The object code can be packaged into a static library.

```text
addition.o
    ↓
libaddition.a
```

### Linking

When compiling the application:

```bash
g++ main.cpp -laddition
```

the linker connects the application with the library implementation.

---

## 11. Why Separate the Header and Implementation?

The header provides the public interface:

```cpp
int add(int a, int b);
```

The implementation provides the details:

```cpp
int add(int a, int b)
{
    return a + b;
}
```

This separation provides:

* Modularity
* Abstraction
* Code reuse
* Easier maintenance
* Information hiding
* A clearly defined API

---

## 12. Testing the Library

Create a simple test program:

```text
tests/
└── test_addition.cpp
```

Example:

```cpp
#include <cassert>
#include <addition>

int main()
{
    assert(addition::add(2, 3) == 5);
    assert(addition::add(10, 20) == 30);
    assert(addition::add(-5, 5) == 0);

    return 0;
}
```

Compile:

```bash
g++ tests/test_addition.cpp \
    -I"$HOME/.local/include" \
    -L"$HOME/.local/lib" \
    -laddition \
    -o test_addition
```

Run:

```bash
./test_addition
```

If the program produces no output and exits successfully, the assertions passed.

---

## 13. Key Concepts Learned

This exercise introduces several important C++ and software-engineering concepts.

### C++ concepts

* Functions
* Header files
* Source files
* Namespaces
* Compilation
* Linking
* Static libraries
* Include paths

### Software-engineering concepts

* Modularity
* Abstraction
* Encapsulation
* API design
* Code reuse
* Testing
* Build automation
* Installation

---

## 14. Extension Exercise

Extend the library to provide additional mathematical operations.

For example:

```cpp
namespace addition
{
    int add(int a, int b);
    int add(int a, int b, int c);
    double add(double a, double b);
}
```

You could also create a more general mathematics library containing:

```text
add()
subtract()
multiply()
divide()
power()
absolute()
minimum()
maximum()
```

Students should maintain the separation between:

```text
include/
    Public interface

src/
    Implementation

tests/
    Tests

examples/
    Example applications
```

---

## 15. Expected Final Structure

A completed project may look like:

```text
addition_library/
├── CMakeLists.txt
├── README.md
├── include/
│   └── addition
├── src/
│   └── addition.cpp
├── tests/
│   └── test_addition.cpp
└── examples/
    └── main.cpp
```

The final objective is to produce a **reusable C++ library that can be built, tested, installed, and used by other C++ applications**.
