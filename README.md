# Exercise: Creating a Simple C++ Addition Library

## Objective

In this exercise, you will create a small C++ library that performs addition.

The purpose is to understand how a C++ library is structured, built, installed, and used by another C++ program.

You will also create the library's header file **without a file extension**, so that it can be included as:

```cpp
#include <addition>
```

---

## 1. Create the Project

Create a directory called:

```text
addition_library
```

Use the following structure:

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

The header file must be named:

```text
addition
```

Do **not** add `.h` or `.hpp`.

---

## 2. Create the Header File

Create:

```text
include/addition
```

Declare a function called `add()` that:

- accepts two integers;
- returns an integer;
- is placed inside the `addition` namespace.

The header should contain an include guard.

---

## 3. Implement the Function

Create:

```text
src/addition.cpp
```

Include the library header using:

```cpp
#include <addition>
```

Implement the `add()` function.

Do not repeat the function declaration unnecessarily in the `.cpp` file.

---

## 4. Create the CMake File

Create:

```text
CMakeLists.txt
```

Configure CMake to:

- create a static library called `addition`;
- use `src/addition.cpp`;
- make the `include` directory available to programs using the library;
- install the library;
- install the extensionless header file.

The resulting static library should be:

```text
libaddition.a
```

---

## 5. Create a Build Directory

From inside the project directory, create a separate build directory:

```bash
mkdir build
```

Configure the project with CMake:

```bash
cmake -S . -B build
```

This creates the build files inside the `build` directory.

---

## 6. Build the Library

Build the library using:

```bash
cmake --build build
```

After a successful build, you should have a library similar to:

```text
build/
└── libaddition.a
```

You can check the build directory with:

```bash
ls build
```

---

## 7. Install the Library

Install the library into your local user directory:

```bash
cmake --install build --prefix "$HOME/.local"
```

The installation should produce:

```text
~/.local/
├── include/
│   └── addition
└── lib/
    └── libaddition.a
```

Check that the header was installed:

```bash
ls "$HOME/.local/include"
```

You should see:

```text
addition
```

Check the library:

```bash
ls "$HOME/.local/lib"
```

You should see:

```text
libaddition.a
```

---

## 8. Create a Program That Uses the Library

Create:

```text
examples/main.cpp
```

The program should:

1. Include the addition library.
2. Call the `add()` function.
3. Add `10` and `20`.
4. Display the result.

Use:

```cpp
#include <iostream>
#include <addition>

int main()
{
    std::cout << addition::add(10, 20) << '\n';

    return 0;
}
```

---

## 9. Compile the Example Program

From the project directory, compile the example using:

```bash
g++ examples/main.cpp \
    -I"$HOME/.local/include" \
    -L"$HOME/.local/lib" \
    -laddition \
    -o addition_example
```

The options mean:

```text
-I    location of header files
-L    location of libraries
-l    library to link
-o    name of the executable
```

In this case:

```text
-I"$HOME/.local/include"
```

tells the compiler where to find:

```text
addition
```

and:

```text
-L"$HOME/.local/lib"
```

tells the linker where to find:

```text
libaddition.a
```

---

## 10. Run the Program

Run:

```bash
./addition_example
```

Expected output:

```text
30
```

---

## 11. Complete Build Sequence

Once all the files have been created, the complete sequence is:

```bash
mkdir build

cmake -S . -B build

cmake --build build

cmake --install build --prefix "$HOME/.local"

g++ examples/main.cpp \
    -I"$HOME/.local/include" \
    -L"$HOME/.local/lib" \
    -laddition \
    -o addition_example

./addition_example
```

Expected output:

```text
30
```

---

## 12. What You Should Understand

By the end of the exercise, you should be able to explain:

- Why the function declaration is placed in a header file.
- Why the function implementation is placed in a `.cpp` file.
- What a static library is.
- What happens during compilation.
- What happens during linking.
- What `-I` does.
- What `-L` does.
- What `-l` does.
- Why `#include <addition>` works.
- Why the header does not need a `.h` or `.hpp` extension.
- How another C++ program can reuse the library.
- Why a separate `build` directory is useful.
- The difference between building and installing a library.

---

## 13. Extension

Extend the library by adding another operation, such as:

```cpp
int subtract(int a, int b);
```

Keep the same project structure.

The additional function should also be accessible through:

```cpp
#include <addition>
```

Rebuild and reinstall the library, then modify `main.cpp` to test the new function.

---

## Expected Final Structure

After completing the exercise, your project should look like:

```text
addition_library/
├── CMakeLists.txt
├── include/
│   └── addition
├── src/
│   └── addition.cpp
├── examples/
│   └── main.cpp
└── build/
    └── libaddition.a
```

The installed files should be:

```text
~/.local/
├── include/
│   └── addition
└── lib/
    └── libaddition.a
```
