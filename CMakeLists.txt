cmake_minimum_required(VERSION 3.5)
project(csaopt_tidings)

set(CMAKE_CXX_STANDARD 11) # adds -std=c++11
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/CMakeModules)

include(FindCapnProto)
find_package(CapnProto REQUIRED)
include_directories(${CAPNP_INCLUDE_DIRS})
add_definitions(${CAPNP_DEFINITIONS})

set(CAPNP_SCHEMA_FILES src/tiding.capnp)

if(NOT CAPNPC_OUTPUT_DIR)
    message(WARNING "CAPNPC_OUTPUT_DIR not set, generating to source dir")
endif()

capnp_generate_cpp(CAPNP_SRCS CAPNP_HDRS ${CAPNP_SCHEMA_FILES})

add_custom_target(capnp_output ALL DEPENDS ${CAPNP_SRCS} ${CAPNP_HDRS})
