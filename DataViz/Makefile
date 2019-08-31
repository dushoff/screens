
## This is the XXX (direct) subdirectory of the YYY/screens repo
## makestuff/direct.mk

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

screen_session: ..vscreen

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## repo locations
## makestuff/repohome.list
## makestuff/repohome.auto.mk

## rhdir_drop:

# projdirs += sample
sample: rhdir/sample_sample_sample
	$(rcopy)

alldirs += $(projdirs)

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/repohome.mk
