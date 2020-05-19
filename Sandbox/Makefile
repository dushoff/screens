
## This is Sandbox a dirdir under screens
## makestuff/direct.mk
current: target
-include target.mk

##################################################################

## Screens

## projdirs += project
## linkdirs += link

screen_session: screens_update
	$(plvscreens)

screens_setup: url= https://github.com/dushoff/screens.git
DataViz_setup: url= https://github.com/mac-theobio/DataViz.git
%_setup:
	- rm -rf $*
	git clone $(url) $*
	make $*.vscreen ##

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## repohome

example: dir=rhdir/host_group_name
example:
	$(rcopy)

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
