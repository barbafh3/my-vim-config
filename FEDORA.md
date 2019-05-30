# Fedora specific configurations/installations

Section specific for Fedora. Since some packages are not present in their repos and some configurations may be different from Manjaro(my previous distro), i made this section os my README.


------

**Fedora hangs on shutdown** - Some incompatibility between plymouth and nvidia proprietary drivers causes shutdown to hang. Remove rhgb from the default grub file:

```
sed -i 's/rhgb //g' /etc/default/grub
```

Then re-generate GRUB:

```
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

------

**H.264 Codec** -  Some Youtube videos and Twitch require the H.264 codec. Since it is not present on Fedora's base repo, add the RPM Fusion repo using the following command:

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

After that finishes, install it normally:

```
sudo dnf install x264
```

