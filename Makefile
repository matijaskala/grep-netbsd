CFLAGS += $(shell pkg-config --cflags libbsd-overlay) -D_GNU_SOURCE -I.
LDLIBS += -lz -lbz2 $(shell $(LD) -lfts -o /dev/null && echo -lfts)

all: grep

grep: fastgrep.c file.c grep.c queue.c util.c  regcomp.c regerror.c regexec.c regfree.c

install: all
	install -d $(DESTDIR)/usr/bin
	install grep $(DESTDIR)/usr/bin
	ln -sf grep $(DESTDIR)/usr/bin/egrep
	ln -sf grep $(DESTDIR)/usr/bin/fgrep
	ln -sf grep $(DESTDIR)/usr/bin/rgrep
	install -d $(DESTDIR)/usr/share/man/man1
	install -m644 grep.1 $(DESTDIR)/usr/share/man/man1
	ln -sf grep.1 $(DESTDIR)/usr/share/man/man1/egrep.1
	ln -sf grep.1 $(DESTDIR)/usr/share/man/man1/fgrep.1
	ln -sf grep.1 $(DESTDIR)/usr/share/man/man1/rgrep.1

clean:
	$(RM) grep
