CFLAGS+= -framework ApplicationServices -framework Foundation -Wall -Wextra -Wno-unused-parameter

.PHONY: all clean

all: click
clean:
	rm -f click
