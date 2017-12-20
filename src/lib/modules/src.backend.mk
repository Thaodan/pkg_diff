include ../../../src.base.mk
BACKEND =
all: $(SCRIPTS)

include $(srcdir)/src.body.mk

install: $(SCRIPTS)	
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)/modules/$(BACKEND)
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)/modules/$(BACKEND)

clean:
	rm -f $(SCRIPTS)

.PHONY: clean install

