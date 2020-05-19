## This the DataViz dirdir
## makestuff/direct.Makefile

current: target
-include target.mk

##################################################################

## Screens

projdirs += public private
linkdirs += QMEE 17 p17
## linkdirs += link

screen_session: screens_update
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## Repos

public: dir=rhdir/git_mac-theobio_DataViz

private: dir=rhdir/git_mac-theobio_DataViz_private

QMEE: dir=rhdir/git_mac-theobio_QMEE

17: dir=rhdir/git_bbolker_stat744

p17: dir=rhdir/git_bbolker_stat744_private

$(linkdirs):
	$(rhsetup)

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
