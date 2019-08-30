
## This is the mli (direct) subdirectory of the screens repo
## makestuff/direct.mk

current: target
-include target.mk

##################################################################

## Defs

Sources += Makefile

ms = makestuff
Ignore += $(ms)
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/os.mk

######################################################################

screen_session: mli_thesis.vscreen rabies_R0.vscreen rabies_correlations.vscreen
	# rdc.vscreen is resting

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## repo locations
## include makestuff/repohome.auto.mk

## rhdir_drop:

projdirs += mli_thesis
mli_thesis: rhdir/git_wzmli_mli_thesis
	$(rcopy)

projdirs += rabies_cihr
rabies_R0: rhdir/git_wzmli_rabies_R0
	$(rcopy)

projdirs += rabies_cihr
rabies_cihr: rhdir/git_wzmli_rabies_cihr
	$(rcopy)

alldirs += $(projdirs)

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/repohome.mk
