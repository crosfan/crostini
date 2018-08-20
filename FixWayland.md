If you can't get X11 or Wayland GUI Linux apps to start anymore on Chrome OS, try the following.

In the Terminal app, this will show the status of your systemd user services/units:
```
systemctl --user
```

If `sommelier@0.service` and `sommelier-x@0.service` show a failed status, the following worked for me:
```
sudo ln -s /opt/google/cros-containers/bin/sommelier.elf /usr/bin/
systemctl --user restart sommelier@0.service
systemctl --user restart sommelier-x@0.service
export DISPLAY=:0
```

Check again to see if those services are started now:
```
systemctl --user
```

Hopefully now X/Wayland apps work again.
```
xclock
```
