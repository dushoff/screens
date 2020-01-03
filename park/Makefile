
## This is park, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Screens

## park.screens: contact_trace.vscreen bayes_antigen.vscreen generation_links.vscreen speedstrength/doc.vscreen little_r.vscreen oldTalks.vscreen

projdirs += trace speed flumap
## linkdirs += link

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## repohome

trace: dir=rhdir/git_parksw3_contact_trace/

speed: dir=rhdir/git_parksw3_speedstrength

flumap: dir=rhdir/git_parksw3_bayesantigen2

## This is done automatically in makestuff; just here for hooks
## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

## linkdirs

sample: dir=~
sample: ; $(linkdir)

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
