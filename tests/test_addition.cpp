#include <cassert>
#include "addition.hpp"

int main()
{
    assert(add(2, 3) == 5);
    assert(add(10, 20) == 30);
    assert(add(-5, 5) == 0);

    return 0;
}