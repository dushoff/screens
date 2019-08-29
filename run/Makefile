
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

Makefile: tilde

Ignore += tilde
tilde: dir=~
tilde:
	$(linkdirname)

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk



