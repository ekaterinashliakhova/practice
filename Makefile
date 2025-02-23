TARGET = fibonacci
TEST_TARGET = test_fibonacci

CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++14 

SRCS = fibonacci.cpp
TEST_SRCS = test_fibonacci.cpp

OBJS = $(SRCS:.cpp=.o)
TEST_OBJS = $(TEST_SRCS:.cpp=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

test: $(TEST_TARGET)

$(TEST_TARGET): $(OBJS) $(TEST_SRCS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(TEST_SRCS) -lgtest -lgtest_main -pthread

clean:
	rm -f $(OBJS) $(TARGET) $(TEST_OBJS) $(TEST_TARGET)

.PHONY: all clean test
