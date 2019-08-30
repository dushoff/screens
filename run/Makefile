
## This is the run subdirectory of the screens repo

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

screen_session: tilde.vscreen

## Home directory is linked here for convenient screening
## Makefile: tilde  ## vscreen is supposed to take care of this 2019 Aug 29 (Thu)

Ignore += tilde
tilde: dir=~
tilde:
	$(linkdirname)

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk
