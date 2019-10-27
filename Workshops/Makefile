
## This is Workshops, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Screens

projdirs += generations
## linkdirs += link

screen_session: 
	$(plvscreens)

rprojdirs += Generation_distributions Endemic_curves

## Vim

vim_session:
	bash -cl "vmt"

######################################################################

## Directories

## repohome

generations: rhdir/Generation_talks/
	$(rhsetup)

Disease_data: rhdir/git_mac-theobio_Disease_data/
	$(rhsetup)

## Directories whose simple rhdir names we're keeping for now
ddirs = Generation_distributions Endemic_curves
$(ddirs): %: rhdir/%
	$(rhsetup)

## This is done automatically in makestuff; just here for hooks
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
