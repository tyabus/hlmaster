# HLMaster Makefile
CCX=g++
SRC=src/*.cpp
CFLAGS=-O2 -Wall -Ilib/pfc++/include -Iinclude
PFCFLAGS=-O2 -Wall -shared -Ilib/pfc++/include
BINARY=hlmaster-$(COMPILE_ARCH)
COMPILE_ARCH=$(shell uname -m | sed -e 's/i.86/x86/' | sed -e 's/^arm.*/arm/')
LDFLAGS=-s
PFCSRC=lib/pfc++/src/*.cpp
LIBS=libpfc++.so

all: libpfc++ hlmaster

libpfc++:
	$(CCX) $(PFCSRC) $(PFCFLAGS) -o libpfc++.so

hlmaster:
	$(CCX) $(SRC) $(LIBS) $(CFLAGS) -o $(BINARY) $(LDFLAGS)
	strip $(BINARY)

clean:
	rm -rf libpfc++.so
	rm -rf $(BINARY)
