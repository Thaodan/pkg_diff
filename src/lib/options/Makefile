 include ../../../rules.mk

SCRIPTS 	= 0-conf  20-diff  5-debug 20-cache 20-prepare_local
#../config.shh:
#	$(MAKE) -C .. config.shh

install: $(SCRIPTS)	
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)/options
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)/options

.PHONY: all clean install

