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

cmake_minimum_required(VERSION 3.2 FATAL_ERROR)

enable_language(CXX)
set(CMAKE_CXX_STANDARD 14)

include_directories(../include/)
include_directories(./lest/include/lest/)

add_executable(uri_test uri_test.cpp)

target_link_libraries(uri_test LINK_PUBLIC uri)

add_test(NAME "URI Test" COMMAND uri_test)
