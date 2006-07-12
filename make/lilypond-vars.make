##
## settings to run LilyPond
ifeq ($(LILYPOND_EXTERNAL_BINARY),)
# environment settings.
export PATH:=$(top-build-dir)/lily/$(outconfbase):$(top-build-dir)/buildscripts/$(outconfbase):$(top-build-dir)/scripts/$(outconfbase):$(PATH):
export LILYPONDPREFIX:=$(build_lilypond_datadir)/current
export DVIPSHEADERS:=$(top-build-dir)/mf/out::
export LILYPOND_BINARY=$(top-build-dir)/lily/$(outconfbase)/lilypond
else

## better not take the binaries  from a precompiled bundle, as they
## rely on env vars for relocation.
##

#export PATH:=$(dir $(LILYPOND_EXTERNAL_BINARY)):$(PATH)
export LILYPOND_BINARY=$(LILYPOND_EXTERNAL_BINARY)
endif

export PYTHONPATH:=$(top-build-dir)/python/$(outconfbase):$(PYTHONPATH)

the-script-dir=$(wildcard $(script-dir))

ABC2LY = $(script-dir)/abc2ly.py
CONVERT_LY = $(script-dir)/convert-ly.py
LILYPOND_BOOK = $(script-dir)/lilypond-book.py
LILYPOND_BOOK_INCLUDES = -I $(src-dir)/ -I $(outdir) -I $(input-dir) -I $(input-dir)/regression/ -I $(input-dir)/manual/ -I $(input-dir)/tutorial/ -I $(top-build-dir)/mf/$(outconfbase)/  -I $(top-build-dir)/mf/out/
LILYPOND_BOOK_LILYPOND_FLAGS=-dgs-font-load
LILYPOND_BOOK_FLAGS = --process="$(LILYPOND_BINARY) --backend=eps --formats=ps,png --header=texidoc -I $(top-src-dir)/input/manual -dinternal-type-checking -ddump-signatures -danti-alias-factor=2 $(LILYPOND_BOOK_LILYPOND_FLAGS)"
TEXINPUTS=$(top-src-dir)/tex/::
export TEXINPUTS

#texi-html for www only:
LILYPOND_BOOK_FORMAT=$(if $(subst out-www,,$(notdir $(outdir))),texi,texi-html)
LY2DVI = $(LILYPOND_BINARY)
LYS_TO_TELY = $(buildscript-dir)/lys-to-tely.py

