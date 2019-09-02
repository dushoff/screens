## This is the mli dirdir
## makestuff/direct.mk

current: target
-include target.mk

######################################################################

## Screens

projdirs += thesis R0 correlations
rprojdirs += grant rdc 

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## projdirs

thesis: rhdir/git_wzmli_mli_thesis
	$(rcopy)

R0: rhdir/git_wzmli_rabies_R0
	$(rcopy)

rdc: rhdir/git_wzmli_rdc
	$(rcopy)

grant: rhdir/git_wzmli_rabies_cihr
	$(rcopy)

correlations: rhdir/git_wzmli_rabies_correlations
	$(rcopy)

## linkdirs

sample: dir=~
sample: ; $(linkdir)

## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/os.mk
-include makestuff/dirdir.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/repohome.mk
