SHELL := cmd
BIN  = gcc2cl.exe
OBJS = gcc2cl.obj system_return.obj

CC = cl
CXX = cl

win32ports_CFLAGS = $(shell pkgconf --cflags unistd)
win32ports_LDFLAGS = $(shell pkgconf --libs unistd)

CFLAGS   := /W4 -Ox /D_CRT_SECURE_NO_WARNINGS
LDFLAGS  := #-s

CLEANFILES = $(BIN) $(OBJS) $(BIN)_test tmp_test.* *.obj *.ilk *.pdb *.exe


all: $(BIN)

clean:
	-del $(CLEANFILES)

%.obj: %.cpp
	$(CXX) /c ${win32ports_CFLAGS} $(CFLAGS) $^

%.obj: %.c
	$(CC) /c ${win32ports_CFLAGS} $(CFLAGS) $^

$(BIN): $(OBJS)
	$(CXX) ${win32ports_LDFLAGS} $(LDFLAGS) $^ /Fe$@


test: $(BIN)
	./test.sh

