include ../../rules.mk
SCRIPTS 	= conf cache parse_options debug diff source prepare_local download

all: $(SCRIPTS) 

$(SCRIPTS): ${SCRIPTS:=.in.sh} 
	$(SHPP) $(SHPPFLAGS) -Dlibdir=$(libdir)/$(APPNAME) $(@).in.sh -o $(@)


#../config.shh:
#	$(MAKE) -C .. config.shh

install: install_lib install_options	

install_lib: $(SCRIPTS) 
	$(INSTALL) -dm755 $(libdir)/$(APPNAME)
	$(INSTALL) -Dm644 $(^) $(libdir)/$(APPNAME)

install_options:
	make -C options
clean: 
	rm -f $(SCRIPTS)

.PHONY: all clean install install_options

