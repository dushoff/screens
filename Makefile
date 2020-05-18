## screens
current: target
-include target.mk

-include makestuff/perl.def

######################################################################

start: setup buildscreen

setup: pull makestuff.pull
## setup: planning/Planning.pull planning/linux_config.pull
## cd planning/linux_config && $(MAKE) main.load && $(MAKE) relink

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
%.subscreen: %.makescreen
	screen -t $(notdir $*) screen -x $(notdir $*)

## Make the directory exist, then:
## Find a screen with this name or make a new one
## Subdirectory use may be deprecated
%.makescreen:
	cd $(dir $*) && $(MAKE) $(notdir $*)
	screen -S $(notdir $*) -p 0 -X select 0 || $(MAKE) $*.newscreen

## Sleep line under test 2020 Jan 11 (Sat)
## bash -cl here (before screen -dm) led to a very weird disaster
%.newscreen:
	cd $* && screen -dm $(notdir $*)
	screen -list $(notdir $*) || sleep 1
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

## compare makestuff/dirdir.mk
## -include makestuff/topdir.mk
-include makestuff/listdir.mk

-include makestuff/git.mk
-include makestuff/visual.mk

