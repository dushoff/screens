## This is the mli dirdir
## makestuff/direct.mk

current: target
-include target.mk

######################################################################

## Screens

projdirs += tz_pipeline R0 correlations grant glasgow
rprojdirs += grant rdc thesis phyloglmm

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## projdirs

thesis: rhdir/git_wzmli_mli_thesis
	$(rhsetup)

R0: rhdir/git_wzmli_rabies_R0
	$(rhsetup)

tz_pipeline: rhdir/git_wzmli_rabies_db_pipeline
	$(rhsetup)

rdc: rhdir/git_wzmli_rdc
	$(rhsetup)

phyloglmm: rhdir/git_wzmli_phyloglmm
	$(rhsetup)

grant: rhdir/git_wzmli_rabies_cihr
	$(rhsetup)

correlations: rhdir/git_wzmli_rabies_correlations
	$(rhsetup)

glasgow: rhdir/git_wzmli_glasgow
	$(rhsetup)

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
