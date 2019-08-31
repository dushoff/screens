## This is the mli dirdir
## makestuff/direct.mk

current: target
-include target.mk

######################################################################

## Screens

projdirs += mli_thesis R0 correlations
rprojdirs += grant rdc 

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## Links

R0: rhdir/git_wzmli_rabies_R0
	$(rcopy)

rdc: rhdir/git_wzmli_rdc
	$(rcopy)

grant: rhdir/git_wzmli_rabies_cihr
	$(rcopy)

correlations: rhdir/git_wzmli_rabies_correlations
	$(rcopy)

sample: dir=~
sample: ; $(linkdir)

## Repos

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
