# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/egor/miniscience-4th-term/2022/02_vtk/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/egor/miniscience-4th-term/2022/02_vtk/cpp

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/bin/cmake-gui -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/egor/miniscience-4th-term/2022/02_vtk/cpp/CMakeFiles /home/egor/miniscience-4th-term/2022/02_vtk/cpp//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/egor/miniscience-4th-term/2022/02_vtk/cpp/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named cubic2d

# Build rule for target.
cubic2d: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 cubic2d
.PHONY : cubic2d

# fast build rule for target.
cubic2d/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/cubic2d.dir/build.make CMakeFiles/cubic2d.dir/build
.PHONY : cubic2d/fast

#=============================================================================
# Target rules for targets named cubic3d

# Build rule for target.
cubic3d: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 cubic3d
.PHONY : cubic3d

# fast build rule for target.
cubic3d/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/cubic3d.dir/build.make CMakeFiles/cubic3d.dir/build
.PHONY : cubic3d/fast

#=============================================================================
# Target rules for targets named tetr3d

# Build rule for target.
tetr3d: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 tetr3d
.PHONY : tetr3d

# fast build rule for target.
tetr3d/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/tetr3d.dir/build.make CMakeFiles/tetr3d.dir/build
.PHONY : tetr3d/fast

cubic2d.o: cubic2d.cpp.o
.PHONY : cubic2d.o

# target to build an object file
cubic2d.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/cubic2d.dir/build.make CMakeFiles/cubic2d.dir/cubic2d.cpp.o
.PHONY : cubic2d.cpp.o

cubic2d.i: cubic2d.cpp.i
.PHONY : cubic2d.i

# target to preprocess a source file
cubic2d.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/cubic2d.dir/build.make CMakeFiles/cubic2d.dir/cubic2d.cpp.i
.PHONY : cubic2d.cpp.i

cubic2d.s: cubic2d.cpp.s
.PHONY : cubic2d.s

# target to generate assembly for a file
cubic2d.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/cubic2d.dir/build.make CMakeFiles/cubic2d.dir/cubic2d.cpp.s
.PHONY : cubic2d.cpp.s

cubic3d.o: cubic3d.cpp.o
.PHONY : cubic3d.o

# target to build an object file
cubic3d.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/cubic3d.dir/build.make CMakeFiles/cubic3d.dir/cubic3d.cpp.o
.PHONY : cubic3d.cpp.o

cubic3d.i: cubic3d.cpp.i
.PHONY : cubic3d.i

# target to preprocess a source file
cubic3d.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/cubic3d.dir/build.make CMakeFiles/cubic3d.dir/cubic3d.cpp.i
.PHONY : cubic3d.cpp.i

cubic3d.s: cubic3d.cpp.s
.PHONY : cubic3d.s

# target to generate assembly for a file
cubic3d.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/cubic3d.dir/build.make CMakeFiles/cubic3d.dir/cubic3d.cpp.s
.PHONY : cubic3d.cpp.s

tetr3d.o: tetr3d.cpp.o
.PHONY : tetr3d.o

# target to build an object file
tetr3d.cpp.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/tetr3d.dir/build.make CMakeFiles/tetr3d.dir/tetr3d.cpp.o
.PHONY : tetr3d.cpp.o

tetr3d.i: tetr3d.cpp.i
.PHONY : tetr3d.i

# target to preprocess a source file
tetr3d.cpp.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/tetr3d.dir/build.make CMakeFiles/tetr3d.dir/tetr3d.cpp.i
.PHONY : tetr3d.cpp.i

tetr3d.s: tetr3d.cpp.s
.PHONY : tetr3d.s

# target to generate assembly for a file
tetr3d.cpp.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/tetr3d.dir/build.make CMakeFiles/tetr3d.dir/tetr3d.cpp.s
.PHONY : tetr3d.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... cubic2d"
	@echo "... cubic3d"
	@echo "... tetr3d"
	@echo "... cubic2d.o"
	@echo "... cubic2d.i"
	@echo "... cubic2d.s"
	@echo "... cubic3d.o"
	@echo "... cubic3d.i"
	@echo "... cubic3d.s"
	@echo "... tetr3d.o"
	@echo "... tetr3d.i"
	@echo "... tetr3d.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

