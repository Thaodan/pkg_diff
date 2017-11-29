include ../rules.mk
VER	     	 	= $(shell ./../tools/git_revgen)
SCRIPTS			= pkg_diff
all: $(SCRIPTS) lib

config.shh: 
	@echo $@: generating 
	@echo '#\\define VER=$(VER)' > $@
	@echo '#\\define libdir=$(libdir)' >> $@

$(SCRIPTS): ${SCRIPTS:=.in.sh} config.shh
	$(SHPP) $(SHPPFLAGS)\
		$(@).in.sh  -o $@

lib: 
	$(MAKE) -C lib

install: install_bin
install_bin: $(SCRIPTS)
	$(INSTALL) -dm755 $(bindir)
	$(INSTALL) -m755 $(^) $(bindir) 
	$(MAKE) -C lib install

clean:
	rm -f $(SCRIPTS)
	$(MAKE) -C lib clean

.PHONY: clean lib install
