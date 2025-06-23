## This is the screendir mmed25Projects
## See makestuff/listdir.md

current: target
-include target.mk

-include makestuff/perl.def

######################################################################

vim_session: 
	bash -cl "vmt screens.list"

screen_session: screens.update
	$(MAKE) $(vscreens)

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

### Includes

-include makestuff/os.mk

-include makestuff/listdir.mk
-include makestuff/screendir.mk
-include makestuff/mkfiles.mk

-include makestuff/git.mk
-include makestuff/visual.mk

