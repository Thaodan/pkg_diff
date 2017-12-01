include ../src.base.mk
SCRIPTS 	= parse_options debug message \
			prepare_local download

all: $(SCRIPTS) options modules

$(config_shh):
	$(MAKE) -C $(srcdir) $(config_shh)

include $(srcdir)/src.body.mk

options:
	make -C options
modules:
	make -C modules

install: install_lib install_options install_modules
install_lib: $(SCRIPTS) 
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)
install_options:
	make -C options install
install_modules:
	make -C modules install
clean_options:
	make -C options clean
clean: clean_options 
	rm -f $(SCRIPTS)
.PHONY: clean install install_options install_modules options modules

