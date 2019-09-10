
## This is staging, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Keep this directory clean. Stage, commit, delete
## The main purpose is to have a local rhdir, I think.
## It might be good to combine the screen_session with legacy to save
## a higher-level screen

## Use canonical names; stuff shouldn't stay here anyway

## makestuff/repohome.auto.mk: 
stageTarget = diversity_metrics

## Keep canonical names for smooth graduation pathway
vscreen: $(stageTarget:%=%.vscreen)
graduate: $(stageTarget:%=%.graduate)
forcegraduate: $(stageTarget:%=%.forcegraduate)

$(stageTarget):
	$(MAKE) rhdir/$@
	$(MV) rhdir/$@ $@

## 2019 Sep 07 (Sat)

## Graduate by moving the directory to a permanent rhdir location

## Don't graduate unless you can all
## And don't graduate into an existing thing
%.graduate: rhdir %.all
	(! ls $</$*) && $(MV) $* $<

%.forcegraduate: rhdir %.all
	$(RMR) $</$* && $(MV) $* $<

######################################################################

## Backlog

pending += $(stageTarget)

Ignore += $(pending)

######################################################################

## Screens

## rprojdirs += insurance 1MP
## linkdirs += link

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## repohome

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
