include ../../rules.mk
SCRIPTS 	= parse_options debug message \
			prepare_local download

all: $(SCRIPTS) options

../config.shh:
	$(MAKE) -C .. config.shh

$(SCRIPTS): ${SCRIPTS:=.in.sh} ../config.shh
	$(SHPP) $(SHPPFLAGS) -Dlibdir=$(libdir)/$(APPNAME) $(@).in.sh -o $(@)

options:
	make -C options

install: install_lib install_options	
install_lib: $(SCRIPTocS) 
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)
install_options:
	make -C options install

clean_options:
	make -C options clean
clean: clean_options 
	rm -f $(SCRIPTS)

.PHONY: clean install install_options options

