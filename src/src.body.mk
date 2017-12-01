$(SCRIPTS): ${SCRIPTS:=.in.sh} $(config_shh)
	$(SHPP) $(SHPPFLAGS)\
		$(@).in.sh \
		-o $@
