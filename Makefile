## screens
current: target
-include target.mk

-include makestuff/perl.def

######################################################################

## Don't start from inside vim
start: sync
	$(MAKE) screenstart

screenstart: setup buildscreen

sync: makestuff.sync

setup: sync planning/Planning.sync planning/linux_config.sync
	cd planning/linux_config && $(MAKE) main.load && $(MAKE) relink

######################################################################

## Use testing as a Sandbox-style environment. Watch out for Dropbox finding

Ignore += testing

## change together: what shows up and what syncs
## This is picky because there's only one topdir, and 
## it's good workflow to know what's where

## 1
Ignore += run
subscreens += run

## 2
dirdirs += planning
subscreens += planning

## 3
Ignore += Dropbox
subscreens += Dropbox

## Getting rid of 3SS 2019 Dec 12 (Thu)
## Teaching
dirdirs += 1M DataViz
containers += 3SS
subscreens += 1M DataViz 3SS

dirdirs += admin
subscreens += admin

## Active, but not always opened

dirdirs += ici3d

dirdirs += staging
## subscreens += staging

dirdirs += projects
## subscreens += projects

## dirdirs += shi
## subscreens += shi

## dirdirs += mli
containers += rabies
## subscreens += mli

dirdirs += park
## subscreens += park

dirdirs += cygu
## subscreens += cygu

dirdirs += Workshops

dirdirs += earn

#######################

## Container directories are like dirdirs, but they are repos
## This allows humans to build stuff without starting from Dushoff screen configuration

## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

3SS: dir=rhdir/git_Bio3SS_top

rabies: dir=rhdir/git_eliminaterabies_top

#######################

Ignore += legacy
rlinkdirs += legacy

rdirdirs += Sandbox

######################################################################

## Start the subscreens and the desk
screen_session: 
	$(MAKE) $(subscreens:%=%.subscreen)
	screen -S run -p 0 -X stuff "deskstart"

######################################################################

vim_session:
	bash -cl "vmt makestuff/topdir.mk"

## bash hooks (needs work)

knowndirs += $(dirdirs) $(containers) $(linkdirs) $(rdirdirs) $(rlinkdirs) 

dirnames.mk: Makefile
	echo $(knowndirs:%=%.subscreen) : > $@

Ignore += dirnames.mk
-include dirnames.mk

######################################################################

Sources += README.md

## Linked subscreens

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

## compare makestuff/dirdir.mk
-include makestuff/topdir.mk
-include makestuff/repohome.mk
-include makestuff/git.mk
-include makestuff/visual.mk

