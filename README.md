# test-c
> Super minimal robust test framework for C.

Shut up and [test some C]

## Why?

* Because every other testing framework out there for C is a pain.

## Goals

* Make C Unit Testing fast, easy, and fun.
* Reduce boilerplate.
* Keep tests focused on testing, not setup.
* Do the simplest thing possible.
* Avoid root priveleges.

## Project Layout

test-c assumes a project layout similar to the following:
```
.
├── include
├── README.md
├── src
│   ├── add.c
│   └── add.h
└── tests
    └── test_add.c
```

## Sample Test

Here's what `tests/test_add.c` looks like in our project layout:

```c
#include "test.h"
#include "add.h"

TEST_START(it_works_oh_yea)
  int sum = add(5, 6);
  TEST_ASSERT_INT_EQUAL(sum, 11);
TEST_END

TEST_START(it_works)
  TEST_ASSERT_INT_EQUAL(6, 6);
TEST_END
```

## Installing

```
curl -sk https://raw.githubusercontent.com/kogosoftwarellc/test-c/master/install.bash | bash
```

Once that completes, you'll have `~/.test-c/test-c` available in your `PATH`.

## Running

```
test-c --help
```

## LICENSE

[MIT](./LICENSE)
