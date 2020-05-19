## This is planning, a dirdir under screens
current: target
-include target.mk

##################################################################

## Screens

projdirs += Planning linux_config theobio_site notebook covid19
## notebook move back here!

screen_session: screens_update
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vmt"

######################################################################

### repohome is deprecated now; not sure what will happen when i try to make a brand-new version of this directory.

theobio_site: dir=rhdir/git_mac-theobio_mac-theobio.github.io

######################################################################

### new directories

covid19:
	git clone https://github.com/mac-theobio/covid19-projects.git $@

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
