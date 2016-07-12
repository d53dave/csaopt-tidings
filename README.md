# csaopt-tidings

This repository contains the CapnProto message schema that CSAOpt uses for communication between master, messagequeue and worker nodes.

## Usage

I have set this up to include it as a dependency to the other CSAOpt projects with the CMake command ```ExternalProject_Add()```. This includes a CMake Module to locate CapnProto and set up appropriate variables for CMake.
The call to ExternalProject expects the caller to provide a path to an output folder using the parameter ```CAPNPC_OUTPUT_DIR``` which can be passed to the subsequent CMake call using the ```CMAKE_CACHE_ARGS``` option. If that parameter is not provided, it will emit a warning and use the current CMake build folder.

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
