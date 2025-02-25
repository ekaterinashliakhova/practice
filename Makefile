TARGET = fibonacci
TARGET_TEST = test_fibonacci

HEADER = usr/

CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -I $(HEADER)
LIBS_TEST = -lgtest -lgtest_main -pthread

USR_DIR = usr/
SRC_DIR = src/
CICD_DIR = cicd/

SRCS_SRC = $(wildcard $(SRC_DIR)*.cpp) #включает main.cpp
OBJS_SRC = $(patsubst $(SRC_DIR)%.cpp, $(USR_DIR)%.o, $(SRCS_SRC))

SRCS_TEST = $(wildcard $(CICD_DIR)*.cpp)
OBJS_TEST = $(patsubst $(CICD_DIR)%.cpp, $(USR_DIR)%.o, $(SRCS_TEST))

all: $(TARGET) $(TARGET_TEST)

$(TARGET): $(OBJS_SRC)
	$(CXX) $(OBJS_SRC) -o $(USR_DIR)$(TARGET)

$(USR_DIR)%.o: $(SRC_DIR)%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

test: $(TARGET_TEST)

$(TARGET_TEST): $(OBJS_TEST)
	$(CXX) $(OBJS_TEST) $(USR_DIR)$(TARGET).o -o $(USR_DIR)$(TARGET_TEST) $(LIBS_TEST)

$(USR_DIR)%.o: $(CICD_DIR)%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

package:
	dpkg-deb --build .
	mv ..deb $(TARGET).deb

clean:
	rm $(USR_DIR)*.o $(USR_DIR)$(TARGET) $(TARGET).deb

.PHONY: all clean test package
