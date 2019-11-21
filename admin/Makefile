
## This is the admin (direct) subdirectory of the screens repo
## Makefile based on makestuff/direct.Makefile

current: target
-include target.mk

##################################################################

## Defs

Sources += Makefile

Ignore += makestuff
Makefile: makestuff/Makefile
	touch $@
makestuff/Makefile:
	ls ../makestuff/Makefile && /bin/ln -s ../makestuff 

-include makestuff/os.mk

######################################################################

## What are my screens?

## projdirs += Planning linux_config notebook Lab_meeting theobio_site coreFaculty cron CV Correspondence
projdirs += Lab_meeting coreFaculty notebook Correspondence tp cron CV

## Alled but not screened? Where are the rules?
## rprojdirs = coreFaculty

screen_session: 
	$(plvscreens)

######################################################################

screens: dir=~
screens: ; $(linkdir)

## Repos

## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

Lab_meeting: rhdir/git_mac-theobio_Lab_meeting

coreFaculty: rhdir/git_ICI3D_coreFaculty

## cp -rf cron rhdir/ ##
cron: %: rhdir/%

CV: rhdir/bit_dushoff_New_CV/

Correspondence: rhdir/bit_dushoff_Correspondence

######################################################################

### Makestuff

-include makestuff/dirdir.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/repohome.mk
