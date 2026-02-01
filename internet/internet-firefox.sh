#!/bin/sh
echo ' > Internet :: Firefox'

sudo snap remove --purge firefox

sudo tee /etc/apt/preferences.d/firefox-no-snap <<EOF
Package: firefox*
Pin: release o=Ubuntu*
Pin-Priority: -1
EOF

sudo add-apt-repository ppa:mozillateam/ppa

sudo tee /etc/apt/preferences.d/mozilla-firefox <<EOF
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
EOF

sudo apt update
sudo apt install firefox

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

echo '   [firefox-internet]     ...done!'
