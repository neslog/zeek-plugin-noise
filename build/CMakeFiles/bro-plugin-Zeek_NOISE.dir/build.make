# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake3

# The command to remove a file.
RM = /usr/bin/cmake3 -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /zeek-plugin-noise

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /zeek-plugin-noise/build

# Utility rule file for bro-plugin-Zeek_NOISE.

# Include the progress variables for this target.
include CMakeFiles/bro-plugin-Zeek_NOISE.dir/progress.make

CMakeFiles/bro-plugin-Zeek_NOISE:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/zeek-plugin-noise/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Creating __bro_plugin__ for Zeek::NOISE"
	echo Zeek::NOISE >/zeek-plugin-noise/build/__bro_plugin__

bro-plugin-Zeek_NOISE: CMakeFiles/bro-plugin-Zeek_NOISE
bro-plugin-Zeek_NOISE: CMakeFiles/bro-plugin-Zeek_NOISE.dir/build.make

.PHONY : bro-plugin-Zeek_NOISE

# Rule to build all files generated by this target.
CMakeFiles/bro-plugin-Zeek_NOISE.dir/build: bro-plugin-Zeek_NOISE

.PHONY : CMakeFiles/bro-plugin-Zeek_NOISE.dir/build

CMakeFiles/bro-plugin-Zeek_NOISE.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bro-plugin-Zeek_NOISE.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bro-plugin-Zeek_NOISE.dir/clean

CMakeFiles/bro-plugin-Zeek_NOISE.dir/depend:
	cd /zeek-plugin-noise/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /zeek-plugin-noise /zeek-plugin-noise /zeek-plugin-noise/build /zeek-plugin-noise/build /zeek-plugin-noise/build/CMakeFiles/bro-plugin-Zeek_NOISE.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bro-plugin-Zeek_NOISE.dir/depend
