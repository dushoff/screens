## This the DataViz dirdir
## makestuff/direct.Makefile

current: target
-include target.mk

##################################################################

## Screens

projdirs += public
deepdirs += QMEE
## linkdirs += link

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## Repos

public: rhdir/git_mac-theobio_DataViz
	$(rcopy)

QMEE: rhdir/git_mac-theobio_QMEE
	$(rcopy)

## Other links

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
