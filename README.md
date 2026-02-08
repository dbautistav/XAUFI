# XAUFI

An opinionated selection of tools and configurations, mostly for coding, for an [Ubuntu](http://ubuntu.org/) fresh install

## What's Included?

- Updates packages
- Enables firewal (`ufw`)
- Installs:
    - `build-essential`, `git`, and `vim`
    - `brew`, [for Homebrew: a package manager](https://brew.sh/)
    - `fnm`, [a Fast **Node** Manager](https://github.com/Schniz/fnm#readme), and `node v22`
    - `bun`, [a **JavaScript** all-in-one toolkit](https://bun.com)
    - `uv` [an extremely fast **Python** package and project manager, written in Rust](https://docs.astral.sh/uv/)
    - [VS **Code**](https://code.visualstudio.com/)
    - [**Firefox** Browser](https://www.firefox.com/en-US/)
        - Removes the `snap` install, and installs it from Mozilla's `ppa`
        - You might get a transparent firefox launcher (known issue)
    - Zip & Rar utilities (i.e., `unzip`, `p7zip-full`, `p7zip-rar`, `rar`, `unrar`)
- Installs and set custom configuration for a **next-level shell experience**:
    - `zsh`
    - [**Starship**, a cross-shell prompt (minimal, blazing-fast, customizable)](https://starship.rs/)
    - [**Antidote**, a performant Zsh plugin manager](https://antidote.sh/)
    - [**zoxide**, a smarter `cd` command](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#zoxide)
    - [**fzf**, a general-purpose command-line fuzzy finder](https://github.com/junegunn/fzf?tab=readme-ov-file#highlights)
- Removes unnecessary dependencies at OS-level

For more details, explore the scripts, starting with [./main.sh].

## Install instructions
- Download the repo files (zip) OR `git clone https://github.com/dbautistav/XAUFI.git`
- In your terminal, go to the project's root folder, and execute **without admin privileges**: `./main.sh`
- Enter your super user password when asked
- Wait for it to finish
- Enjoy!

## OS Version
All scripts have been successfully tested on **Ubuntu 24.04.x LTS 64-bit**

## What does XAUFI stands for?
It is the recursive acronym for *XAUFI: After Ubuntu Fresh Install*

## License
This project is [Free Software](https://raw.githubusercontent.com/dbautistav/XAUFI/master/LICENSE).
