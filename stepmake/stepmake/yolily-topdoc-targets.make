# Yolily_topdoc_targets.make

default: do-doc 

# urg
$(outdir)/%.html: %.yo
	$(YODL2HTML) -doutdir=$(outdir) --live-data=3 -o $@.in $<
	$(sed-version) < $@.in > $@
	rm -f $@.in

local-WWW:
	-cp $(outdir)/*png $(outdir)/index.html $(depth)  # don't fail if not making website

copy-to-top: 
	$(foreach i, $(TO_TOP_FILES), \
	  cp $(i) $(depth)/ && ) true
