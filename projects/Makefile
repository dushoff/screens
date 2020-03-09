
## This is projects, a dirdir under screens
## makestuff/direct.Makefile
current: target
-include target.mk

##################################################################

## Screens

projdirs += diversity_metrics insurance rubella plague checkPlots weitzAsymp so_lysogeny
rprojdirs += Mummies polarization
## linkdirs += link

screen_session: 
	$(plvscreens)
	$(MAKE) Mummies/

## Vim

vim_session:
	bash -cl "vi Makefile target.mk"

######################################################################

## Directories

## repohome

insurance: dir=rhdir/git_SACEMA_epidemicInsurance

rubella: dir=rhdir/git_ICI3D_rubellaSA

plague: dir=rhdir/git_davidearn_plague

checkPlots: dir=rhdir/checkPlots

so_lysogeny:
	git clone https://github.com/Apeirogons/3BM6-Modelling.git $@

## Working on accessing a subdirectory directly
Mummies: dir=rhdir/git_ElishaBayode_Babies_mummies_growth_rates_MS

weitzAsymp:
	git clone https://github.com/mac-theobio/coronavirus_asymptomatic.git $@

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
-include makestuff/visual.mk
-include makestuff/repohome.mk
-include makestuff/git.mk
