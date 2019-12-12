
## This is projects, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Screens

projdirs += diversity_metrics insurance rubella polarization plague checkPlots
## linkdirs += link

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## repohome

insurance: dir=rhdir/git_SACEMA_epidemicInsurance

rubella: dir=rhdir/git_ICI3D_rubellaSA

plague: dir=rhdir/git_davidearn_plague

checkPlots: dir=rhdir/checkPlots

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
-include makestuff/visual.mk
-include makestuff/repohome.mk
-include makestuff/git.mk
