# Linux Tweaks
These are the customisations for Linux that I apply regardless of which version or distribution of Linux I choose to use. Tested to work on any distribution of Linux that is based on Debian, Archlinux, NixOS, and RHEL. 🚀

I am hopeful that you might find at least some of them useful. 🌟

## Screenshots
![desktop](https://github.com/shreyas-a-s/linux-tweaks/assets/137637016/39040215-2486-45f4-8009-1a6a6bdf833b)
## Features

### Applied automatically:
- Update the system.
- Installs for Arch-linux based distros:
  - [AUR Helper](https://github.com/Jguer/yay) - Install packages from AUR (the user contributed arch linux repository)
  - [Paccache](https://man.archlinux.org/man/paccache.8) - Automatically clear package manager cache
- Installs on Debian/Ubuntu-based distros:
  - [Nala](https://github.com/volitank/nala) - A better front-end to apt package manager
- Installs on RHEL-based distros:
  - Customise dnf package manager to work faster
- Lower swappiness value for better utilization of RAM
- Add a program named [`wifi-toggle`](https://github.com/shreyas-a-s/linux-tweaks/blob/de/scripts/common/wifi-toggle.sh) to toggle wifi.

### Applied based on user choice:
| ![user-choice](https://github.com/shreyas-a-s/linux-tweaks/assets/137637016/f6c94494-c85c-4fcd-b112-1917a24277c4) |
|:--:|

- Install [AutoCPUFreq](https://github.com/AdnanHodzic/auto-cpufreq) - It's a program to automatically adjust CPU speed and thereby saving battery. Useful for laptops.
- Install [Brave Browser](https://github.com/brave/brave-browser) - A fast, ad-free browser that respects your privacy.
- Install [Cron](https://github.com/Cron/Cron) - A job-scheduler for automating tasks in Linux.
- Install Extra Fonts - Fonts that support emoji, Indic fonts for indian language support on browsers and stuff.
- Install [Github Desktop](https://github.com/shiftkey/desktop) - Desktop client for Github
- Install GUI Apps - [GParted](https://github.com/GNOME/gparted), [OBS Studio](https://github.com/obsproject/obs-studio), and [VLC](https://github.com/videolan/vlc).
- Install [Joplin](https://github.com/laurent22/joplin) - It's a simple markdown-based note-taking app. Supports sync capabilities.
- Install [KDEConnect](https://github.com/KDE/kdeconnect-kde)/[GSConnect](https://github.com/GSConnect/gnome-shell-extension-gsconnect) - Allows to connect smartphone to Computer for things like transferring files, copy-pasting text, controlling presentation from phone, etc.
- Install [Obsidian](https://github.com/obsidianmd/obsidian-releases) - Another cool, feature-rich markdown-based note taking app that can rival Notion.
- Install [OnlyOffice](https://github.com/ONLYOFFICE/DesktopEditors) - One of the better office suite for Linux.
- Install Password Manager - Installs [Secrets](https://gitlab.gnome.org/World/secrets) if you're on GNOME, [KeepassXC](https://github.com/keepassxreboot/keepassxc) othewise.
- Install PDF Reader - Installs [Evince](https://github.com/GNOME/evince) (GNOME Document viewer)
- Install Terminal Tweaks
  - Installs these:
    - Command Not Found handler - It'll autocorrect if you've entered a wrong command to terminal.
    - [LSD](https://github.com/lsd-rs/lsd) - Colorful ls command
    - [Neovim](https://github.com/neovim/neovim) - The best text/code editor in the world 😉
    - [Starship](https://github.com/starship/starship) - Add a blink to your shell prompt
    - Terminal Apps:
      - [Bat](https://github.com/sharkdp/bat) - Cat with colors. I mean it.
      - [Fzf](https://github.com/junegunn/fzf) - Easily search files from terminal
      - Git - You don't know git?
      - [Htop](https://github.com/htop-dev/htop) - Terminal resource monitor.
      - [Ncdu](https://github.com/rofl0r/ncdu) - Terminal storage analyzer.
      - [Neofetch](https://github.com/dylanaraps/neofetch) - Show off your system info in screenshots.
      - [Ripgrep](https://github.com/BurntSushi/ripgrep) - Easily search contents of text files from terminal.
      - [Shellcheck](https://github.com/koalaman/shellcheck) - Test shell (bash/zsh) scripts without actually running them.
      - [Trash-cli](https://github.com/andreafrancia/trash-cli) - Ever `rm`-ed a file and wanted a trash-bin for terminal. Here it is.
      - [Zoxide](https://github.com/ajeetdsouza/zoxide) - Move around files and folders blazingly fast.
    - [Tldr](https://github.com/tldr-pages/tldr) - Simplified usage examples of commands.
  - Configures these:
    - User shell (bash/zsh/fish) by adding useful aliases and tweaks.
- Install Torrent Client - Installs [Fragments](https://gitlab.gnome.org/World/Fragments) if you're on GNOME, Qbittorrent otherwise.
- Install [UFW](https://github.com/jbq/ufw) - Uncomplicated Firewall for linux.
- Install [VSCodium](https://github.com/VSCodium/vscodium) - Open-source version of VSCode
- Setup Bluetooth - Install bluetooth drivers
- Setup Bootloader - Make bootup a little bit faster
- Setup GNOME
  - Installs Disk Usage Analyser, Image Viewer, GNOME Wallpapers, Calculator, Clock, Console (terminal emulator), Tweaks, File Manager, and Rounded window corners.
  - Uninstalls Firefox, Contacts, GNOME Terminal, Software Center, Gedit, Help.
- Setup Multi-Audio - Adds ability to connect a bluetooth earphone and a wired earphone simultaneousily.

## Prerequisites

- Any version of Linux that is based on either Debian, Ubuntu, Arch Linux, NixOS, RHEL, or Fedora.
- GNOME Desktop Environment installed and set as default. (Optional)

## Installation

Execute these commands from a terminal and follow the prompts:

```bash
 git clone https://github.com/shreyas-a-s/linux-tweaks.git
 cd linux-tweaks/
 ./install.sh
```

For those who would like a single-line command:
```bash
 git clone https://github.com/shreyas-a-s/linux-tweaks.git && cd linux-tweaks/ && ./install.sh
```

