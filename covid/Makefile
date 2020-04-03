
## This is covid, a dirdir under screens

##################################################################

## Screens

## linkdirs += link

screen_session: 
	$(plvscreens)

######################################################################

## Directories

linkdirs += mac
mac:
	git clone https://github.com/bbolker/McMasterPandemic.git $@

######################################################################

## Resource repos

datarepos/JHU:
	$(MAKE) datarepos
	git clone https://github.com/CSSEGISandData/COVID-19.git $@

Ignore += datarepos
datarepos:
	$(mkdir)

######################################################################
### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/dirdir.mk
-include makestuff/git.mk
-include makestuff/visual.mk
## -include makestuff/repohome.mk
