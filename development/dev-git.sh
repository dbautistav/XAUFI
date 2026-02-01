#!/bin/sh
echo ' > Development :: Git'

sudo apt-get update
sudo apt-get install -y git vim

git config --global core.editor "vim"
git config --global push.default simple
git config --global color.ui true
sudo chown $USER .gitconfig

echo '   [git-dev]     ...done!'
