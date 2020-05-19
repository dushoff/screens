## screens
current: target
-include target.mk

######################################################################

vim_session: 
	bash -cl "vmt screens.list makestuff/listdir.mk makestuff/topdir.mk"

######################################################################

start: setup mainscreen

setup: pull makestuff.pull
## setup: planning/Planning.pull planning/linux_config.pull
## cd planning/linux_config && $(MAKE) main.load && $(MAKE) relink

######################################################################

## 2020 May 18 (Mon)
## Stuff I'm still organizing

## All a bit of a mess; now HOT in research 2020 May 19 (Tue)
Sources += lsd.scr screens.arc

######################################################################

## -pi example worked like a charm, I think
## perl -pi -e "s/screen_session:.*/screen_session: screens_update/" */Makefile ##

## Create a screen
## Fail to attach, and then create
## Not failing to attach gives an error:
## We don't want to call this rule if the screen exists, since it will screen_session again
mainscreen:
	! screen -x main && exec screen -c ~/.escreenrc -dm main
	screen -S main -p 0 -X exec make screen_session
	screen -x main

## top_session calls %.subscreen, which makes and then attaches
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

## Include screens.mk (via listdir.mk) first!
-include makestuff/listdir.mk
-include makestuff/topdir.mk

-include makestuff/git.mk
-include makestuff/visual.mk

