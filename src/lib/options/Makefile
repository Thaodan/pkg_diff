include ../../../rules.mk

SCRIPTS    = 0-conf  20-diff  5-debug 20-cache \
		20-prepare_local 50-help

all: $(SCRIPTS)

$(SCRIPTS): ${SCRIPTS:=.in.sh} 
	$(SHPP) $(SHPPFLAGS) -Dlibdir=$(libdir)/$(APPNAME) $(@).in.sh -o $(@)


install: $(SCRIPTS)	
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)/options
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)/options

clean:
	rm -f $(SCRIPTS)

.PHONY: clean install

