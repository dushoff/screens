
## This is ici3d, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Screens

projdirs += MMED DAIDD io
webdirs += mmedweb daiddweb
linkdirs += $(webdirs)
alldirs += $(webdirs)

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vmt"

######################################################################

## Directories

## repohome

MMED: dir=rhdir/git_ICI3D_MMED/

mmedweb: dir=MMED/pages
mmedweb:
	$(MAKE) MMED MMED/pages
	cd MMED && $(MAKE) pages
	$(linkdirname)

DAIDD: dir=rhdir/git_ICI3D_DAIDD/
daiddweb: dir=DAIDD/pages
daiddweb:
	$(MAKE) DAIDD
	cd DAIDD && $(MAKE) pages
	$(linkdirname)

io: dir=rhdir/git_ICI3D_ICI3D.github.io/

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
