# Fedora specific configurations/installations

Section specific for Fedora. Since some packages are not present in their repos and some configurations may be different from Manjaro(my previous distro), i made this section os my README.

------

**H.264** -  Youtube videos require the H.264 codec. Since it is not present on Fedora's base repo, add the RPM Fusion repo using the following command:

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

After that finishes, install it normally:

```
sudo dnf install x264
```

