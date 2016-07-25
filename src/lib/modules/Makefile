include ../../../rules.mk
SCRIPTS 	= source conf cache

all: $(SCRIPTS) 

../../config.shh:
	$(MAKE) -C ../.. config.shh

$(SCRIPTS): ${SCRIPTS:=.in.sh} ../../config.shh
	$(SHPP) $(SHPPFLAGS) -Dlibdir=$(libdir)/$(APPNAME) $(@).in.sh -o $(@)


install: install_lib install_options	
install_lib: $(SCRIPTocS) 
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)


clean: 
	rm -f $(SCRIPTS)

.PHONY: clean install

