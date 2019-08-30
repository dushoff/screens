
## This is the admin subdirectory of the screens repo

current: target
-include target.mk

##################################################################

## Defs

Sources += Makefile

ms = makestuff
Ignore += $(ms)
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/os.mk

######################################################################

screen_session: Planning.vscreen linux_config.vscreen Lab_meeting.vscreen dweb.vscreen notebook.vscreen macweb.vscreen screen.vscreen

######################################################################

## Repos

######################################################################

### Makestuff

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/repohome.mk


