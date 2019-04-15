# Game configurations

This section has all configuration needed to run specific games properly on linux

------

## Cities: Skylines

**Endless loading** - Disable coredump as the game causes excessive amount of dumping and hangs. Edit the file /etc/systemd/coredump.conf:

```
Storage=none
ProcessSizeMax=0
```
