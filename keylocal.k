# In order to specify the default input/output MIDI ports that
# keykit uses, just rename this file as keylocal.k,
# and provide the appropriate statements in the function.
#
# You can also put any other site-specific local things in this function.
#
# On Windows, you can put this file in c:\keylocal.k, and it will be
# used for all version of keykit (later than 7.0i, anyway) on your machine.
# This way, you can install new versions in separate directories, and
# still have all your local changes available without having to edit prerc.k.

function keylocal() {
	colormix(0,0,0,0)
	colormix(1,65535,65535,65535)
	initBinGlobals("x")
	PI=3.1415926535897932
	# inport("UA-100 MIDI 1")
	# sca = outport("UA-100 MIDI 1")
	# mapport(0,sca)			# default to output sca
}
