3SS: 2020 Jun 22 (Mon)
=====================

## Find desired repos on disk

* Pulled makestuff/screendir.Makefile as a starting point
* Populated screens.list with a list of project files
* Used :%s/.*/0. &: ..\/3SS_top\/&^M/ to try to find files to move
* `make screen_session` crashes
* `make screens.arc` (why necessary?)
* `make screen_session` is not doing anything?
	* Did the first attempt to make screen_session trample screens.list?

Try for next time:
* Populate screens.list
* `make screens.arc`
* `make screens_session`

## Confirm sync
`make all.time`

## Record permanent repo locations
`make screens_resource`

This worked surprisingly well.
