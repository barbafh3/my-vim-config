Dotfiles
========

These are my configuration files specific for my laptop. 
There are many different files for similar software because 
I'm still working on my setup so i have been trying many different things. These files are open
and can be used at your own discretion.

For Touchpad natural scrolling I created the file /etc/X11/xorg.conf.d/30-touchpad.conf and added the following lines (as explained in the ArchWiki page https://wiki.archlinux.org/index.php/Libinput#Common_options):

```
Section "InputClass"
	Identifier "devname"
	Driver "libinput"
	MatchIsTouchpad "on"
	Option "NaturalScrolling" "true"
EndSection
```
