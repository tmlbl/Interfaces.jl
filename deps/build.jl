"""
Edit the JULIA_ROOT variable to point to were the root folder of your julia install.
This directory should contain an include and lib directories.
"""
BUILDFILE_PATH = @__FILE__
DEPS_PATH = dirname(BUILDFILE_PATH)

JULIA_INCLUDE = "$(JULIA_HOME)/../include"
JULIA_SRC = "$(JULIA_HOME)/../../src"
JULIA_LIB = "$(JULIA_HOME)/../lib"

mkpath("$(DEPS_PATH)/usr/lib/")

run(`gcc -c -Wall -Werror -fPIC -I$(JULIA_INCLUDE) -I$(JULIA_SRC) -I $(JULIA_SRC)/support $(DEPS_PATH)/src/mutable_union.c -o $(DEPS_PATH)/usr/lib/mutable_union.o`)
run(`gcc -shared -ljulia -L$(JULIA_LIB) -o $(DEPS_PATH)/usr/lib/lib_mutable_union.so $(DEPS_PATH)/usr/lib/mutable_union.o`)
