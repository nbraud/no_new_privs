PREFIX = /usr/local
installables := bin/no_new_privs

.PHONY: clean default install uninstall
default: $(notdir $(installables))

no_new_privs: main.c
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)


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
