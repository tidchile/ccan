CC=gcc
# Includes, cflags
INCLUDES= -I../../include -L../../lib
COPTS=-Wall -g -std=gnu99
CFLAGS=$(COPTS) $(INCLUDES)
# Libs flags
LDLIBS=-lccan

TARGETS=run

all:$(TARGETS)

clean:
	rm -f $(TARGETS)

default:
	$(CC) $(CFLAGS) $< -o $@ $(LDLIBS)

