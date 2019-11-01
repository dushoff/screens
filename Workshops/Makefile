
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

## Vim

vim_session:
	bash -cl "vmt"

######################################################################

## Project directories

generations: rhdir/Generation_talks/
	$(rhsetup)

## Service directories

Disease_data: rhdir/git_mac-theobio_Disease_data/
	$(rhsetup)

WA_Ebola_Outbreak: rhdir/git_Outbreak-analysis_WA_Ebola_Outbreak
	$(rhsetup)

## Directories whose simple rhdir names we're keeping for now
ddirs += Generation_distributions Endemic_curves link_calculations 
ddirs += SIR_model_family SIR_simulations ss_pix
$(ddirs): %: rhdir/%
	$(rhsetup)

rprojdirs += ddirs

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
