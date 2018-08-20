  systemctl --user

  sudo ln -s /opt/google/cros-containers/bin/sommelier.elf /usr/bin/
  systemctl --user restart sommelier@0.service
  systemctl --user restart sommelier-x@0.service
  export DISPLAY=:0
