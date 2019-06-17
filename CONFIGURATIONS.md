# Configurations

All configurations that I made that are not on files inside my home folder are in this file.


------

**Disable Youtube player hotkeys** - Since Youtube hotkeys coflict with vim keys, you can disable them using the uBlock Origin add-on for Firefox, go to its dashboard, then My Filters and add the following line:

```
youtube.com##+js(addEventListener-defuser.js, /^(?:keypress|keydown|keyup)$/)
```

------

**Crackling/buggy sound with pulseaudio** - Edit the file /usr/share/pulseaudio/default.pa and add `tsched=0` to the line:

`load-module module-udev-detect`

End result:

`load-module module-udev-detect tsched=0`

------

**Touchpad Natural Scrolling on i3/i3-gaps** - I created the file /etc/X11/xorg.conf.d/30-touchpad.conf and added the following lines (as explained in the ArchWiki page https://wiki.archlinux.org/index.php/Libinput#Common_options):

```
Section "InputClass"
	Identifier "devname"
	Driver "libinput"
	MatchIsTouchpad "on"
	Option "NaturalScrolling" "true"
EndSection
```

------

**Vim as diff tool for git** - Use the following commands on the terminal:

```fish
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
```

------

**Disable ipv6** - Add the following lines to the file /etc/sysctl.conf or create it if it doesn't exist (at this time ipv6 causes slowdown on every action that is internet dependant)

```fish
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```

After that, use the folowing command to commit the changes:

```fish
sudo sysctl -p /etc/sysctl.conf
```
