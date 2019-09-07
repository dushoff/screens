
## This is staging, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Keep this directory clean. Stage, commit, delete
## The main purpose is to have a local rhdir, I think.
## It might be good to combine the screen_session with legacy to save
## a higher-level screen

stageTarget = git_wzmli_phyloglmm

vscreen: $(stageTarget:%=%.vscreen)
graduate: $(stageTarget:%=%.graduate)

## Use canonical names in future; stuff shouldn't stay here anyway

Ignore += local_rhdir
%: local_rhdir/%
	$(rhsetup)

## 2019 Sep 07 (Sat)
## Graduation not tested and not necessarily implemented properly!
## We need to keep canonical names for graduation to work well

## Graduate by moving the directory to a permanent rhdir location

## Don't graduate unless you can all
%.graduate: rhdir %.all
	$(MV) $* $<
	$(RMR) local_rhdir/$*

######################################################################

## Screens

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## repohome

insurance: local_rhdir/git_SACEMA_epidemicInsurance
	$(rhsetup)

1MP: local_rhdir/git_bbolker_math1mp
	$(rhsetup)

## This is done automatically in makestuff; just here for hooks
## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

## linkdirs

sample: dir=~
sample: ; $(linkdir)

######################################################################

## None of this is needed anymore 2019 Sep 07 (Sat)
## Unless I want to rethink any of it

## Use only local rhdir for staging
## 2019 Sep 07 (Sat) Bailing on making a good rule to make this.
## Instead make the directory once by staging an empty file

## mkdir local_rhdir; touch local_rhdir/null ##
## git add -f local_rhdir/null ##

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
