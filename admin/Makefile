
## This is the XXX subdirectory of the YYY repo

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

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk


