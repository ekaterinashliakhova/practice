#include <gtest/gtest.h>
#include "../src/fibonacci.h"

TEST(FibonacciTest, HandlesZeroInput) {
    EXPECT_EQ(fibonacci(0), 0);
}

TEST(FibonacciTest, HandlesOneInput) {
    EXPECT_EQ(fibonacci(1), 1);
}

TEST(FibonacciTest, HandlesTwoInput) {
    EXPECT_EQ(fibonacci(2), 1);
}

TEST(FibonacciTest, HandlesNegativeInput) {
    EXPECT_THROW(fibonacci(-1), std::invalid_argument);
}

TEST(FibonacciTest, HandlesLargeInput) {
    EXPECT_THROW(fibonacci(100), std::out_of_range);
}
