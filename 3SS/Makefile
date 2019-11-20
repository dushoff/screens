
## This is 3SS, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Screens

projdirs += Lectures web
rprojdirs += exponential ts
linkdirs += subLectures

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

$(projdirs) $(rprojdirs):
	$(rhsetup)

Lectures: rhdir/git_Bio3SS_Lectures/

web: rhdir/git_Bio3SS_Bio3SS.github.io

exponential: rhdir/git_Bio3SS_Exponential_figures/
ts: rhdir/git_Bio3SS_Population_time_series/

## This is done automatically in makestuff; just here for hooks
## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

## linkdirs

subLectures: rhdir/git_Bio3SS_submodLectures
	$(rhsetup)
	chmod -R a-w $@

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
