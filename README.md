# screens

Manage jd workflow through /usr/bin/screen

## Notes

I hope this is not as dysfunctional as it seems. The gitroot/mat lossage is definitely adding up, though.

## Todo

What is happening in run?

Breakpoint; is it safe to make twice? Can it be?

Slow makestuff in direct directories

Find a place for this screens directory under itself

Environments; can we make from vim and keep everything clean?

### non-core

Think about (document?) alling logic?

Split makestuff stuff up and make some of it simple again

Make a simplegit that's really simple (-am simple)?

## Ideas

TRY to FRY before you DRY or else you'll DIE

Each super-project is a direct subdirectory here. It has its own repos, and its own screen_session

The repos will generally have their own vim_sessions. We hope

Use the alldirs variable!

### Questions

If I am syncing in subdirectories, how can I _clean_?
* The exclude file changes, and so things can always look dirty (at least to the subdirectory)
* Possibly minimize work in super-directories so that they don't have stray files?
* Include ignore-ish files from above?

How to deal with/access the home directory? What's even there?

Go SLOW with changing makestuff and sub-repos in general?
* not sure

### Answers

Should I try to push things up to ~, or to live virtually my whole life through ~/screens?
* The latter. We need a ~/screens directory to serve as the repo container, so it just seems simpler.

How to deal with projects/screens etc?
* A logical project is a directory which generates a screen session (an a-screen). That directory is a subdirectory _part_ of this repo
	* makestuff is shared (by uplinking)
