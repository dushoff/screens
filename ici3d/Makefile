
## This is ici3d, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Screens

projdirs += MMED web
## linkdirs += link

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vmt"

######################################################################

## Directories

## repohome

MMED: rhdir/git_ICI3D_MMED/
	$(rhsetup)

web: dir=MMED/pages
web: MMED MMED/pages
	$(linkdirname)

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
