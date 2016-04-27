# This Makefile is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

# Authors: Felipe Ortiz
# Version: 0.9

CC=gcc -std=gnu99
INCLUDES=-Iinclude


ifeq (,$(filter $(DYNAMIC), true false))
 ifdef DYNAMIC
  $(error DYNAMIC can be true or false (false by deafult))
 endif
endif

ifeq ($(DYNAMIC),true)
 COPTS=-Wall -Og -fPIC
else
 COPTS=-Wall -Og
endif

CFLAGS=$(COPTS) $(INCLUDES)
LDFLAGS=
LDLIBS=
# Where .a file must be created
LIB=lib/libccan.a

default: all
# Object files
OBJS=src/block_pool.o\
     src/stringmap.o\
     src/talloc.o\
     src/tap.o\

all: lib $(LIB)

lib:
	mkdir lib

$(LIB): $(LIB)($(OBJS))

clean:
	rm -f lib/*.a src/*.o

%.d: %.c
	$(CC) -MM -MP -MF $@ -MT "$(@:.d=.o) $@" $(INCLUDES) $<

ifneq "$(MAKECMDGOALS)" "clean"
 -include $(OBJS:.o=.d)
endif
