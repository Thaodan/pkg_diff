include ../../../rules.mk
SCRIPTS 	= source conf cache diff

all: $(SCRIPTS) 

../../config.shh:
	$(MAKE) -C ../.. config.shh

$(SCRIPTS): ${SCRIPTS:=.in.sh} ../../config.shh
	$(SHPP) $(SHPPFLAGS) -Dlibdir=$(libdir)/$(APPNAME) $(@).in.sh -o $(@)


install: install_modules	
install_modules: $(SCRIPTS) 
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)


clean: 
	rm -f $(SCRIPTS)

.PHONY: clean install

