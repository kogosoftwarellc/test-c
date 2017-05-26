# test-c
> Minimal and robust test framework to facilitate  C unit testing.

Shut up and [test some C]

## Why?

* Because every other testing framework for C is a pain.

## Installing

```
curl -sk https://raw.githubusercontent.com/kogosoftwarellc/test-c/master/install.bash | bash
```

Once that completes, you'll have `~/.test-c/test-c` available in your `PATH`.

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

Starting from scratch?  Let `test-c --init-project` get you up and running quickly.

## Sample Test

Here's what `tests/test_add.c` looks like in our project layout:

```c
#include "test.h"
#include "add.h"

TEST_START(it_works)
  int sum = add(5, 6);
  TEST_ASSERT_INT_EQUAL(sum, 11);
TEST_END
```

## Running

```
test-c [OPTIONS] [FILES]
```

See `test-c --help` for the full list of options.

## LICENSE

[MIT](./LICENSE)
