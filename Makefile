## screens
current: target
-include target.mk

## Makestuff setup
Sources += Makefile 
msrepo = https://github.com/dushoff

Ignore += makestuff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/perl.def

######################################################################

Sources += README.md

alldirs += run

Ignore += $(alldirs)

######################################################################

### Makestuff rules

-include makestuff/git.mk
-include makestuff/visual.mk

