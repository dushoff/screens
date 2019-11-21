## This is 1M, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Screens

projdirs += Lectures web Tests Archive
## linkdirs += link

## Test stuff on bitbucket and elsewhere
## https://dushoff@bitbucket.org/dushoff/1m_2017.git
## https://dushoff@bitbucket.org/dushoff/1m_private.git
## https://github.com/Bio1M/Archive

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## repohome

Lectures: rhdir/git_Bio1M_Lectures

web: rhdir/git_Bio1M_Bio1M.github.io 

Tests: rhdir/bit_dushoff_1m_private

Archive: rhdir/git_Bio1M_Archive

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
