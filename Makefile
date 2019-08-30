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

# buildscreen: 

## Subscreens

%.direct:

Sources += README.md

projdirs += run
## run:

projdirs += admin
## admin:

######################################################################

$(projdirs):
	$(mkdir)
	cp makestuff/direct.mk $@/Makefile
	cd $@ && $(MAKE) makestuff

alldirs += $(projdirs)
Ignore += $(alldirs)

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

## Start the subscreens and the desk
screen_session: 
	$(MAKE) run.subscreen admin.subscreen
	## $(MAKE) Dropbox.subscreen
	## $(MAKE) gitroot/3SS.subscreen
	## $(MAKE) gitroot/708.subscreen
	## $(MAKE) gitroot/Workshops.subscreen
	## screen -S run -p 0 -X stuff "deskstart"

## Attach to a subscreen (making sure it exists)
%.subscreen: %.makescreen
	screen -t $(notdir $*) screen -x $(notdir $*)

## Find a screen with this name or make a new one
%.makescreen:
	cd $(dir $*) && $(MAKE) $(notdir $*)
	screen -S $(notdir $*) -p 0 -X select 0 || $(MAKE) $*.newscreen

%.newscreen:
	cd $* && screen -dm $(notdir $*)
	screen -S $(notdir $*) -p 0 -X exec make screen_session

######################################################################

### Makestuff rules

-include makestuff/git.mk
-include makestuff/visual.mk

