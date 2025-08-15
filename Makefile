PREFIX ?= /usr
LIBDIR = $(PREFIX)/lib
LIBEXECDIR = $(PREFIX)/libexec
SYSTEMD_USER_DIR = $(LIBDIR)/systemd/user

.PHONY: all install uninstall

all:
	@echo "Nothing to build. Run 'make install' to install."

install:
	install -d $(DESTDIR)$(LIBDIR)
	install -d $(DESTDIR)$(LIBEXECDIR)
	install -d $(DESTDIR)$(SYSTEMD_USER_DIR)/obex.service.d

	cp -r obex_capabilities $(DESTDIR)$(LIBDIR)/

	install -m 644 data/10-capabilities.conf $(DESTDIR)$(SYSTEMD_USER_DIR)/obex.service.d/

	ln -sf ../lib/obex_capabilities/__init__.py $(DESTDIR)$(LIBEXECDIR)/obex-capabilities

uninstall:
	rm -rf $(DESTDIR)$(LIBDIR)/obex_capabilities
	rm -f $(DESTDIR)$(SYSTEMD_USER_DIR)/obex.service.d/10-capabilities.conf
	rm -f $(DESTDIR)$(LIBEXECDIR)/obex-capabilities
