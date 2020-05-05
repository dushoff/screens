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

subscreens += run planning Dropbox 3SS admin coronavirus park cygu
nubscreens += staging shi outbreak projects rabies Workshops

######################################################################

## Use testing as a Sandbox-style environment. Watch out for Dropbox finding

Ignore += testing

## change together: what shows up and what syncs
## This is picky because there's only one topdir, and 
## it's good workflow to know what's where

Ignore += run

dirdirs += planning

Ignore += Dropbox

## dirdirs += 1M DataViz
containers += 3SS

dirdirs += admin

## FIXME need a container.Makefile and a pipeline for it
## Based on direct.Makefile (or maybe the same?)
containers += coronavirus
coronavirus:
	git clone https://github.com/dushoff/coronavirus.git

research:
	git clone https://github.com/dushoff/research.git

containers += rabies

dirdirs += park

dirdirs += cygu

containers += outbreak
outbreak: dir= rhdir/git_Outbreak-analysis_top

dirdirs += projects

dirdirs += Workshops

## Active, but not always opened

dirdirs += ici3d

dirdirs += staging

Ignore += shi
## Rebuild this, I think
## dirdirs += shi

## containers += stats

dirdirs += earn

#######################

## Container directories are like dirdirs, but they are repos
## This allows humans to build stuff without starting from Dushoff screen configuration

## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

3SS: dir=rhdir/git_Bio3SS_top

rabies: dir=rhdir/git_eliminaterabies_top

#######################

Ignore += legacy
linkdirs += legacy

rdirdirs += Sandbox
rdirdirs += 1M DataViz 

######################################################################

## Start the subscreens and the desk
screen_session: 
	$(MAKE) screen.list
	$(MAKE) $(subscreens:%=%.subscreen)
	screen -list run || sleep 1
	screen -S run -p 0 -X stuff "deskstart"

Ignore += screen.list
screen.list: Makefile
	echo $(subscreens) | perl -pe 'BEGIN { $$/ = " "; $$\ = "\n" } $$_ = "$$. $$_"' > $@
	- $(CP) $@ planning/Planning

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
%.subscreen: %.makescreen
	screen -t $(notdir $*) screen -x $(notdir $*)

## The logic here of what happens when we make from where is confusing
## Make the directory (or subdirectory, deprecated?) exist, then:
## Find a screen with this name or make a new one
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
-include makestuff/topdir.mk
-include makestuff/repohome.mk
-include makestuff/git.mk
-include makestuff/visual.mk

