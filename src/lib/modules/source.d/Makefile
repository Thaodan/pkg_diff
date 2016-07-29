include  ../../../../rules.mk

SCRIPTS    = git local
all: $(SCRIPTS)

$(SCRIPTS): ${SCRIPTS:=.in.sh} 
	$(SHPP) $(SHPPFLAGS) -Dlibdir=$(libdir)/$(APPNAME) $(@).in.sh -o $(@)


install: $(SCRIPTS)	
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)/modules/source.d
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)/modules/source.d

clean:
	rm -f $(SCRIPTS)

.PHONY: clean install

