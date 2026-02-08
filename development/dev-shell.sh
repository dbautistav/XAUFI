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
# getnf -i 21,24,29,41,47,52,59
getnf -i JetBrainsMono
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
##  but default, "safe" exports could hurt performance ...
## Use the provided custom configuration instead!

backup_and_update_configs() {
    # Create timestamp for this backup session
    local TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    
    # Associative array: target_file => source_file
    # Note: requires bash 4+ or zsh for associative arrays
    declare -A CONFIG_FILES=(
        [".zprofile"]="zprofile_base"
        [".zshrc"]="zshrc_base"
        [".zshenv_secrets"]="zshenv_secrets_base"
        [".zsh_plugins.txt"]="zsh_plugins.txt_base"
    )
    
    echo "Backing up and updating config files with timestamp: $TIMESTAMP"
    echo ""
    
    # Process each config file
    for target_file in "${!CONFIG_FILES[@]}"; do
        local source_base="${CONFIG_FILES[$target_file]}"
        local target_path="$HOME/$target_file"
        
        # Backup existing file if it exists
        if [ -f "$target_path" ]; then
            local backup_path="${target_path}.backup_${TIMESTAMP}"
            cp "$target_path" "$backup_path"
            echo "✓ Backed up: $target_file -> $(basename $backup_path)"
        else
            echo "⊘ Skipped backup: $target_file (doesn't exist)"
        fi
        
        # Copy new version if source exists
        if [ -f "$source_base" ]; then
            cp "$source_base" "$target_path" && \
            sudo chown $USER "$target_path" && \
            echo "✓ Installed: $target_file"
        else
            echo "✗ Error: Source file $source_base not found"
        fi
        
        echo ""
    done
    
    echo "Done! Old files saved with timestamp: $TIMESTAMP"
}

backup_and_update_configs


echo '   [zsh, starship, antidote]     ...done!'
