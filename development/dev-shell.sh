#!/bin/sh
echo ' > Development :: Zsh'

## Install `zsh` and set it as default shell ---------------

sudo apt-get install -y zsh
sudo apt-get install -y git-core

sudo chsh -s `which zsh`
echo $SHELL


## Install Nerd Fonts --------------------------------------

curl -fsSL https://raw.githubusercontent.com/getnf/getnf/main/install.sh | bash
source $HOME/.local/bin
getnf -i 21,24,29,41,47,52,59
fc-cache -fv

## Install Starship ----------------------------------------

curl -sS https://starship.rs/install.sh | sh
starship preset catppuccin-powerline -o ~/.config/starship.toml

## Install Antidote ----------------------------------------

brew install antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

## Install zoxide ------------------------------------------

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

## Install fzf ---------------------------------------------

sudo apt-get update
sudo apt install fzf

## Run command as login shell ------------------------------

## On a default Ubuntu install, you are likely using GNOME Terminal
## Setting GNOME Terminal to Login Shell via CLI:

# Get the default profile ID
PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")

# Set that profile to use a login shell
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE/ login-shell true


## Copy base configuration files ---------------------------

## Installing other tools like `fnm` and `uv` write to `~/.zshrc`,
##  but default, safe exports could hurt performance ...
## We use custom configuration instead!

# Create timestamp for this backup session
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Array of files to backup (in HOME directory)
FILES_TO_BACKUP=(".zprofile" ".zshrc" ".zshenv_secrets")

echo "Backing up files with timestamp: $TIMESTAMP"

# Backup existing files
for file in "${FILES_TO_BACKUP[@]}"; do
    SOURCE="$HOME/$file"
    
    # Check if file exists before backing up
    if [ -f "$SOURCE" ]; then
        BACKUP="${SOURCE}.backup_${TIMESTAMP}"
        cp "$SOURCE" "$BACKUP"
        echo "Backed up: $file -> $(basename $BACKUP)"
    else
        echo "Skipped: $file (doesn't exist)"
    fi
done

echo ""
echo "Coping new versions..."

# Copy new config file versions
cp zprofile_base ~/.zprofile && sudo chown $USER ~/.zprofile && echo "Copied ~/.zprofile"
cp zshrc_base ~/.zshrc && sudo chown $USER ~/.zshrc && echo "Copied ~/.zshrc"
cp zshenv_secrets ~/.zshenv_secrets && sudo chown $USER ~/.zshenv_secrets && echo "Copied ~/.zshenv_secrets"

echo ""
echo "Done! Your old files are saved with timestamp: $TIMESTAMP"

echo '   [zsh, starship, antidote]     ...done!'
