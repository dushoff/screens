
## This is the admin subdirectory of the screens repo

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

screen_session: Planning.vscreen linux_config.vscreen screens.vscreen

######################################################################

screens: dir=~
screens: ; $(linkdir)

## Repos

## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/repohome.mk

