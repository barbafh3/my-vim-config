# Solus OS specific configurations/installations

Section specific for Solus OS. Since some packages are not present in their repos and some configurations may be different from Manjaro(my previous distro), i made this section os my README.

------

**build-essential package** - Since it doesn't exist in Solus repos, use the following command: 

`sudo eopkg it -c system.devel`

------

**i3lock-fancy package** - Since it doesn't exist in Solus repos, use the following commands:

```
cd ~/.local/share
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install
```
