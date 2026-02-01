#!/bin/sh
echo 'XAUFI: After Ubuntu Fresh Install'

./system/sys-update.sh
./system/sys-firewall.sh

./development/dev-build-essential.sh
./development/dev-git.sh
./system/sys-homebrew.sh

./development/dev-node.sh
./development/dev-python.sh
./development/dev-vscode.sh
./development/dev-shell.sh

./internet/internet-firefox.sh
./utilities/utils-zip-rar.sh
# ./extras/extras-numix.sh

### Some of these need manual intervention
#./extras/extras-restricted.sh

./system/sys-clean.sh

echo ''
echo 'Thank you for using XAUFI!'
echo 'See more at https://github.com/dbautistav/XAUFI'
