## screens
current: target
-include target.mk

## Makestuff setup
Sources += Makefile 
msrepo = https://github.com/dushoff

Ignore += makestuff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/perl.def

######################################################################

## Build the main screen

## Create a screen
## TEMP Use a different name and different hotkey
## Fail to attach, and then create
## Not failing to attach means we're confused to call this rule – an error.
mainscreen:
	! screen -x gain && screen -c .gscreenrc -dm gain

## Populate it and attach to it
subscreens:
	screen -S gain -p 0 -X exec make screen_session
	screen -x gain

## Start the subscreens and the desk
screen_session: 
	$(MAKE) run.subscreen
	## $(MAKE) run.subscreen gitroot.subscreen Dropbox.subscreen
	## $(MAKE) gitroot/3SS.subscreen
	## $(MAKE) gitroot/708.subscreen
	## $(MAKE) gitroot/Workshops.subscreen
	screen -S run -p 0 -X stuff "deskstart"

## Attach to a subscreen (making sure it exists)
%.subscreen: %.makescreen
	screen -t $(notdir $*) screen -x $(notdir $*)

## Find a screen with this name or make a new one
%.makescreen:
	cd $(dir $*) && $(MAKE) $(notdir $*)
	screen -S $(notdir $*) -p 0 -X select 0 || $(MAKE) $*.newscreen

######################################################################

Sources += README.md

alldirs += run

Ignore += $(alldirs)

######################################################################

### Makestuff rules

-include makestuff/git.mk
-include makestuff/visual.mk

