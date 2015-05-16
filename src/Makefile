include ../rules.mk
VER	     	 	= 0.1
GIT_REV    		= $(shell ./../tools/git_revgen)
SCRIPTS			= pkg_diff
all: $(SCRIPTS) lib

$(SCRIPTS): ${SCRIPTS:=.in.sh} 
	$(SHPP) $(SHPPFLAGS) -DVER=$(VER) \
		-Dlibdir=$(libdir)/$(APPNAME) \
		$(@).in.sh  -o $@

#config.shh: 
#	@echo $@: generating 
#	@echo '#\\define use_ver=$(USE_VER)' > $@
#	@echo '#\\define prefix=$(PREFIX)' >> $@
#	@echo '#\\define git_rev=$(GIT_REV)' >> $@


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
.PHONY: all clean lib install
