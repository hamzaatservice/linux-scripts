#!/bin/bash

# Install ClamAV
sudo apt-get update
sudo apt install clamav clamav-daemon -y

# Enable ClamAV scans for files and emails
sudo freshclam
sudo systemctl start clamav-freshclam
sudo systemctl enable clamav-freshclam
sudo systemctl start clamav-daemon
sudo systemctl enable clamav-daemon
sudo freshclam

