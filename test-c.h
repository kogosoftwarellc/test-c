#ifndef TEST_C_H
#define TEST_C_H
#include <stdio.h>
#define TEST_C_PASSED 0
#define TEST_C_FAILED 1

#define TEST_C_START(name) \
  int name() {

#define TEST_C_END \
    return TEST_C_PASSED; \
  }

#define TEST_C_ASSERT_INT_EQUAL(expected, actual) \
  if (expected != actual) { \
    printf("TEST_C_ASSERT_INT_EQUAL failed!  Expected to find %d but was %d\n", expected, actual); \
    return TEST_C_FAILED; \
  }
#endif
