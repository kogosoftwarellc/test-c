#ifndef TEST_C_H
#define TEST_C_H
#include <stdio.h>
#include <string.h>
#define TEST_C_PASSED 0
#define TEST_C_FAILED 1

#define TEST_C_START(name) \
  int name() {

#define TEST_C_END \
    return TEST_C_PASSED; \
  }

#define TEST_C_ASSERT_CHAR_EQUAL(expected, actual) \
  if (expected != actual) { \
    printf("TEST_C_ASSERT_CHAR_EQUAL failed!  Expected %c was given %c\n", expected, actual); \
    return TEST_C_FAILED; \
  }

#define TEST_C_ASSERT_INT_EQUAL(expected, actual) \
  if (expected != actual) { \
    printf("TEST_C_ASSERT_INT_EQUAL failed!  Expected %d was given %d\n", expected, actual); \
    return TEST_C_FAILED; \
  }

#define TEST_C_ASSERT_LONG_EQUAL(expected, actual) \
  if (expected != actual) { \
    printf("TEST_C_ASSERT_LONG_EQUAL failed!  Expected %ld was given %ld\n", expected, actual); \
    return TEST_C_FAILED; \
  }

#define TEST_C_ASSERT_NOT_NULL(test, msg) \
  if (test == NULL) { \
    printf("TEST_C_ASSERT_NOT_NULL failed!  %s\n", msg); \
    return TEST_C_FAILED; \
  }

#define TEST_C_ASSERT_STRING_EQUAL(expected, actual) \
  if (strcmp(expected, actual)) { \
    printf("TEST_C_ASSERT_STRING_EQUAL failed!  Expected %s was given %s\n", expected, actual); \
    return TEST_C_FAILED; \
  }

#endif
