# Configurations

All configurations that I made that are not on files inside my home folder are in this file.

------

**Media keys have delay when used on Gnome** - When using two keyboards and one of them has the ABNT/ABNT2 format, the media keys have a big delay when used. To solve this, open the file /usr/share/X11/xkb/symbols/br and comment the following line:

```
modifier_map Mod3 { Scroll_Lock };
```

For the change to take effect either restart, relog or use the following command:

```
setxkbmap -layout br
```

------

**Caps to escape permanently, even when pluging/unppluging/reconnecting keyboards** - Since the setxkbmap is lost after keyboard disconnection, i started using a tool called Interception Tools with a plugin named caps2esc. Follow the instructions on the plugin's gitlab https://gitlab.com/interception/linux/plugins/caps2esc
>>>>>>> 983aa757ab0e3ea209cdbf49d6210c4d2eb2fd16

------

**Enable Bluetooth with AutoEnable on boot for Bluetooth Keyboards** - Since archlinux doesn't have bluetooth enable by default, follow the instructions on the arch wiki https://wiki.archlinux.org/index.php/Bluetooth_keyboard

------

**Change K380 Bluetooth keyboard default to FN keys instead of media keys** - Since there is no official software from logitech for this purpose, follow the instructions on this scripts github https://github.com/barbafh3/k380-function-keys-conf

------

**Disable Youtube player hotkeys** - Since Youtube default hotkeys conflict with vim keys, you can disable them using the uBlock Origin add-on for Firefox, go to its dashboard, then My Filters and add the following line:

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
