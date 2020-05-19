
## This is cygu, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Screens

projdirs += wash funs admins proview hh

screen_session: screens_update
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## repohome

wash: 
	git clone https://github.com/CYGUBICKO/wash.git $@

funs: dir=rhdir/git_cygubicko_funs/

admins: dir=rhdir/git_CYGUBICKO_admins/

proview: dir=rhdir/git_CYGUBICKO_proview/

hh: 
	git clone https://github.com/CYGUBICKO/hh.git $@

## This is done automatically in makestuff; just here for hooks
## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

## linkdirs

sample: dir=~
sample: ; $(linkdir)


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
