CFLAGS += $(shell pkg-config --cflags --libs libbsd-overlay) -lz -lbz2

all: grep

grep: fastgrep.c file.c grep.c queue.c util.c

install: all
	install -d $(DESTDIR)/usr/bin
	install grep $(DESTDIR)/usr/bin
	ln -sf grep $(DESTDIR)/usr/bin/egrep
	ln -sf grep $(DESTDIR)/usr/bin/fgrep
	install -d $(DESTDIR)/usr/share/man/man1
	install -m644 grep.1 $(DESTDIR)/usr/share/man/man1
	ln -sf grep.1 $(DESTDIR)/usr/share/man/man1/egrep.1
	ln -sf grep.1 $(DESTDIR)/usr/share/man/man1/fgrep.1
