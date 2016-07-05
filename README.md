# csaopt-tidings

This repository contains the CapnProto message schema that CSAOpt uses for communication between master, messagequeue and worker nodes.

## Usage

I have set this up to include it as a dependency to the other CSAOpt projects with the CMake command ```ExternalProject_Add()```. It includes a CMake Module to locate CapnProto.
It expects a parameter called ```CAPNPC_OUTPUT_DIR``` which can be passed to the ExternalProject_Add() using the ```CMAKE_CACHE_ARGS``` option. It will generate header and source files into 
the specified folder. If that parameter is not provided, it will emit a warning and create a src folder in the current CMake build folder.

Example use:
```CMake
ExternalProject_Add(
        csaopt-tidings
        GIT_REPOSITORY https://github.com/d53dave/csaopt-tidings.git
        TIMEOUT 10
        LOG_DOWNLOAD ON
        CMAKE_CACHE_ARGS -DCAPNPC_OUTPUT_DIR:STRING=${CMAKE_CURRENT_SOURCE_DIR}/include/tidings
        BUILD_COMMAND "make"
        INSTALL_COMMAND ""
)
```

## Development

Including this as an external project creates a custom target that generates header and source files with ```CapnProto```, but this happens at project generation time (e.g. when the ```cmake``` command is run).
The target can also be run separately, adding the headers and sources to the provided folder so that they can be included and linked against during development (i.e. stopping the IDE from whining).
