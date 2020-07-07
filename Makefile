## screens
current: target
-include target.mk

######################################################################

Sources += history.md listnotes.md

new_session:
	bash -cl "exec vim Makefile" 

vim_session: 
	bash -cl "vmt screens.list makestuff/listdir.mk makestuff/topdir.mk"

######################################################################

start: setup mainscreen

setup: pull makestuff.pull screenpull

## Why was this so awkward?
screenpull = $(screendirs:%=%.pull)
screenpull: 
	$(MAKE) $(screenpull)

######################################################################

## Dev
screens.mk: screens.list makestuff/lmk.pl

## 2020 May 22 (Fri) Does ANYTHING?? need to be here?
## relink and Planning etc, should be here, other stuff can be in topdir

## -pi example worked like a charm
## perl -pi -e "s/screen_session:.*/screen_session: screens_update/" */Makefile ##

## Create a screen
## Fail to attach, and then create
## Not failing to attach gives an error:
## We don't want to call this rule if the screen exists, since it will screen_session again
escreen:
	! screen -x main && exec screen -c ~/.escreenrc -dm main

mainscreen:
	$(MAKE) escreen
	screen -S main -p 0 -X exec make screen_session
	screen -x main

## top_session calls %.subscreen, which makes and then attaches
%.subscreen: %.makescreen
	screen -t $(notdir $*) screen -x $(notdir $*)

%.screen: %.makescreen
	screen -x $(notdir $*)

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

-include makestuff/listdir.mk
-include makestuff/topdir.mk

-include makestuff/git.mk
-include makestuff/visual.mk

