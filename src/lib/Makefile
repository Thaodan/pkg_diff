include ../../rules.mk
SCRIPTS 	= conf cache parse_options debug diff \
			source prepare_local download

all: $(SCRIPTS) options

$(SCRIPTS): ${SCRIPTS:=.in.sh} 
	$(SHPP) $(SHPPFLAGS) -Dlibdir=$(libdir)/$(APPNAME) $(@).in.sh -o $(@)

options:
	make -C options

install: install_lib install_options	
install_lib: $(SCRIPTS) 
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)
install_options:
	make -C options install

clean_options:
	make -C options clean
clean: clean_options 
	rm -f $(SCRIPTS)

.PHONY: clean install install_options options

