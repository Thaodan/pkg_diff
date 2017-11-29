include ../../../rules.mk
SCRIPTS	= source config cache diff

all: $(SCRIPTS) source.d

../../config.shh:
	$(MAKE) -C ../.. config.shh

$(SCRIPTS): ${SCRIPTS:=.in.sh} ../../config.shh
	$(SHPP) $(SHPPFLAGS) $(@).in.sh -o $(@)

source.d:
	make -C source.d
install: install_modules install_source
install_modules: $(SCRIPTS) 
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)

install_source:
	make -C source.d install

clean: 
	rm -f $(SCRIPTS)

.PHONY: clean install source.d install_source

