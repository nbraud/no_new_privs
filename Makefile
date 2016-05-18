CFLAGS = -Wall -Wextra
PREFIX = /usr/local
export RONN_ORGANIZATION = Nicolas Braud-Santoni

installables := bin/no_new_privs man/man1/no_new_privs.1

.PHONY: clean default install uninstall
default: $(notdir $(installables))

no_new_privs: main.c
	$(CC) --std=c99 -o $@ $^ $(CFLAGS) $(LDFLAGS)

%.1: %.1.md
	ronn --roff $^

clean:
	rm -f $(notdir $(installables))

install: $(notdir $(installables))
	for file in $(installables); do                             \
		mkdir -p $(DESTDIR)$(PREFIX)/`dirname $$file`;      \
		cp -v `basename $$file` $(DESTDIR)$(PREFIX)/$$file; \
	done

uninstall:
	for file in $(installables); do            \
		rm -vf $(DESTDIR)$(PREFIX)/$$file; \
	done
