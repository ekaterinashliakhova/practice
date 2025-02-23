TARGET = fibonacci
TEST_TARGET = test_fibonacci
PACKAGE_NAME = fibonacci_package

CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++14 

SRCS = fibonacci.cpp
TEST_SRCS = test_fibonacci.cpp
MAIN_SRCS = main.cpp

OBJS = $(SRCS:.cpp=.o)
TEST_OBJS = $(TEST_SRCS:.cpp=.o)
MAIN_OBJS = $(MAIN_SRCS:.cpp=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

test: $(TEST_TARGET)

$(TEST_TARGET): $(OBJS) $(TEST_SRCS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(TEST_SRCS) -lgtest -lgtest_main -pthread

clean:
	rm -f $(OBJS) $(TARGET) $(TEST_OBJS) $(TEST_TARGET) $(PACKAGE_NAME).tar.gz

package: clean
	mkdir -p $(PACKAGE_NAME)
	cp $(SRCS) $(TEST_SRCS) $(MAIN_SRCS) fibonacci.h Makefile run_tests.sh $(PACKAGE_NAME)/
	tar -czvf $(PACKAGE_NAME).tar.gz $(PACKAGE_NAME)
	rm -rf $(PACKAGE_NAME)

.PHONY: all clean test package
