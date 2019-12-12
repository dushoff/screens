## This is the mli dirdir
## makestuff/direct.mk

current: target
-include target.mk

######################################################################

## Screens

projdirs += tz_pipeline R0 correlations grant glasgow
deepdirs += rdc thesis phyloglmm

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## projdirs

thesis: dir=rhdir/git_wzmli_mli_thesis

R0: dir=rhdir/git_wzmli_rabies_R0

tz_pipeline: dir=rhdir/git_wzmli_rabies_db_pipeline

rdc: dir=rhdir/git_wzmli_rdc

phyloglmm: dir=rhdir/git_wzmli_phyloglmm

grant: dir=rhdir/git_wzmli_rabies_cihr

correlations: dir=rhdir/git_wzmli_rabies_correlations

glasgow: dir=rhdir/git_wzmli_glasgow

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
