
## This is the admin (direct) subdirectory of the screens repo
## Makefile based on makestuff/direct.mk

current: target
-include target.mk

##################################################################

## Defs

Sources += Makefile

Ignore += makestuff
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/os.mk

######################################################################

## What are my screens?

projdirs += Planning linux_config 
resting += screens ## It's confuzzling to have two versions of screens; let's go with one for a while?

screen_session: 
	$(plvscreens)

######################################################################

screens: dir=~
screens: ; $(linkdir)

## Repos

## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

######################################################################

### Makestuff

-include makestuff/dirdir.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/repohome.mk

