# This file is a part of the IncludeOS unikernel - www.includeos.org
#
# Copyright 2015-2016 Oslo and Akershus University College of Applied Sciences
# and Alfred Bratterud
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#################################################
#          IncludeOS LIBRARY makefile           #
#################################################

#####################
# Build Environment #
#####################

# C Compiler and Linker
CC=clang

# C++ Compiler and Linker
CXX=clang++

# Compiler Flags
COMMON=-O3 -Wall -Wextra -Wno-unused-function
CCFLAGS=-std=c11 ${COMMON}
CXXFLAGS=-std=c++14 ${COMMON}

# Name
LIBRARY=./lib/liburi.a

# Components
C_SOURCES=./dep/http_parser.c
CPP_SOURCES=${wildcard src/*.cpp}
COMPONENTS=${CPP_SOURCES:.cpp=.o}
COMPONENTS+=${C_SOURCES:.c=.o}

# Interface Files
INCLUDES=-I./include -I./dep

###############
# BUILD RULES #
###############

all: lib test

# Library
lib: ${COMPONENTS}
	mkdir -p lib
	ar -cq ${LIBRARY} ${COMPONENTS}
	ranlib ${LIBRARY}

# Test Module
test: test.cpp lib
	${CXX} ${CXXFLAGS} ${INCLUDES} -o test test.cpp $(LIBRARY)

# Components
%.o: %.c
	${CC} ${CCFLAGS} ${INCLUDES} -c $< -o $@

%.o: %.cpp
	${CXX} ${CXXFLAGS} ${INCLUDES} -c $< -o $@

#################
# Clean Package #
#################

clean:
	${RM} ${COMPONENTS}
	${RM} test
