
## This is staging, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Keep this directory clean. Stage, commit, delete
## The main purpose is to have a local rhdir, I think.
## It might be good to combine the screen_session with legacy to save
## a higher-level screen

phyloglmm: rhdir/git_wzmli_phyloglmm
	$(rhsetup)

######################################################################

## Screens

rprojdirs += insurance 1MP
## linkdirs += link

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## repohome

insurance: rhdir/git_SACEMA_epidemicInsurance
	$(rhsetup)

1MP: rhdir/git_bbolker_math1mp
	$(rhsetup)

## This is done automatically in makestuff; just here for hooks
## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

## linkdirs

sample: dir=~
sample: ; $(linkdir)

######################################################################

## Use only local rhdir for staging
## 2019 Sep 07 (Sat) Bailing on making a good rule to make this.
## Instead make the directory once by staging an empty file

## mkdir rhdir; touch rhdir/null ##
## git add -f rhdir/null ##


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
