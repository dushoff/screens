## This is Workshops, a dirdir under screens
current: target
-include target.mk

##################################################################

## Screens

## linkdirs += link

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vmt notes.md"

######################################################################

## Project directories

generations: dir=rhdir/Generation_talks

math: dir=rhdir/math_talks

disease: dir=rhdir/disease_dynamics

stats: dir=rhdir/statistics_talks

projdirs += generations
generations: rhdir/Generation_talks

projdirs += math
math: dir=rhdir/math_talks

## Service directories

rprojdirs += Disease_data
Disease_data: dir=rhdir/git_mac-theobio_Disease_data/

rprojdirs += WA_Ebola_Outbreak
WA_Ebola_Outbreak: dir=rhdir/git_Outbreak-analysis_WA_Ebola_Outbreak

rprojdirs += LatexTemplates
LatexTemplates: dir=rhdir/git_ICI3D_LatexTemplates

## Directories whose simple rhdir names we're keeping for now
ddirs += Generation_distributions Endemic_curves link_calculations 
ddirs += SIR_model_family SIR_simulations ss_pix
$(ddirs):
	$(MAKE) rhdir/$@
	$(CPR) rhdir/$@ .

## 3SS dirs (worth a rule?)
bdirs += Exponential_figures Birth_death_models
$(bdirs):
	$(MAKE) rhdir/git_Bio3SS_$@
	$(CPR) rhdir/git_Bio3SS_$@ $@

## This is done automatically in makestuff; just here for hooks
## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

## linkdirs

sample: dir=~
sample: ; $(linkdir)

######################################################################

### Makestuff

Sources += Makefile notes.md

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
