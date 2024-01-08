#!/bin/bash

# Install OpenSSH server
sudo apt update
sudo apt install -y openssh-server

# Allow root SSH login
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
sudo service ssh restart

# Display SSH server status
sudo service ssh status
