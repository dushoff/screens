## screens
current: target
-include target.mk

-include makestuff/perl.def

######################################################################

setup: sync adminkd admin/Planning.sync

######################################################################

## Keep sink under control
## Control what shows up and what syncs at the same time

## run is special; don't shoehorn it in
## Let Dropbox float, though

Ignore += run

## r prefix indicates things we are not currently alling or screening
## These could perhaps use recalcitrant vim (don't auto-close!) for safety
## A dirdir is a direct subdirectory
## It is alled and screened
dirdirs += admin DataViz Sandbox
dirdirs += 1M
dirdirs += mli 

## We can handle Sandbox's Sandbox-iness from inside?`

## A linkdir is screened but not alled
linkdirs += Dropbox legacy

## Start the subscreens and the desk
screen_session: 
	$(MAKE) run.subscreen
	$(MAKE) $(dirdirs:%=%.subscreen)
	$(MAKE) $(linkdirs:%=%.subscreen)
	screen -S run -p 0 -X stuff "deskstart"

######################################################################

## bash hooks

knowndirs += $(dirdirs) $(linkdirs) $(rdirdirs) $(rlinkdirs)

dirnames.mk: Makefile
	echo $(knowndirs:%=%.subscreen) : > $@

Ignore += dirnames.mk
-include dirnames.mk

######################################################################

Sources += README.md

## Subscreens

Dropbox: dir = ~
Dropbox:
	$(linkdir)

legacy: dir = ~/gitroot
legacy: ; $(linkdirname)

######################################################################

## Build the main screen

## We may want to fail if mainscreen exists so we don't get duplication
## Also, what about attaching from inside?
buildscreen: mainscreen subscreens

## Create a screen
## Fail to attach, and then create
## Not failing to attach gives an error:
## We don't want to call this rule if the screen exists, since it will screen_session again
mainscreen:
	! screen -x main && exec screen -c ~/.escreenrc -dm main

## Populate a screen and attach to it
## Call screen_session indirectly to control the environment 
subscreens:
	screen -S main -p 0 -X exec make screen_session
	screen -x main

## Attach to a subscreen (making sure it exists)
## Here's where we might want to do the ssx magic?
%.subscreen: %.makescreen
	screen -t $(notdir $*) screen -x $(notdir $*)

## The logic here of what happens when we make from where is confusing
## Goal 2019 Aug 30 (Fri): go to main screen 0 and do something like ssx from there
## Make the directory (or subdirectory, deprecated?) exist, then:
## Find a screen with this name or make a new one
%.makescreen:
	cd $(dir $*) && $(MAKE) $(notdir $*)
	screen -S $(notdir $*) -p 0 -X select 0 || $(MAKE) $*.newscreen

## bash -cl here (before screen -dm) led to a very weird disaster
%.newscreen:
	cd $* && screen -dm $(notdir $*)
	screen -S $(notdir $*) -p 0 -X exec make screen_session

######################################################################

Sources += Makefile 

-include makestuff/os.mk

msrepo = https://github.com/dushoff

Ignore += makestuff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

### Makestuff rules

-include makestuff/topdir.mk
-include makestuff/git.mk
-include makestuff/visual.mk

