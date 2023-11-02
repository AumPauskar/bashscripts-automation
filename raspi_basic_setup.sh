#!/bin/bash
# installation of basic softwares in raspberrry pi

# installing latest software
apt update && apt upgrade -y

# Enable VNC
sudo raspi-config nonint do_vnc 0

# installing software
apt install gcc vim -y