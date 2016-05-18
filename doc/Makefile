include ../rules.mk
SCRIPTS	= usage.sh
ORGFILE = usage.org
all: $(SCRIPTS) org-file

$(SCRIPTS): ${SCRIPTS:=.in} 
	$(SHPP) $(SHPPFLAGS)\
		-Dlibdir=$(libdir)/$(APPNAME) \
		$(@).in -o $@

org-file: 
	echo stub

install: install_doc
install_bin: $(SCRIPTS)
	$(INSTALL) -dm755 $(docdir)
	$(INSTALL) -m755 $(^) $(docdir)


clean:
	rm -f $(SCRIPTS) \
		$(ORGFILE)

.PHONY: clean lib install
