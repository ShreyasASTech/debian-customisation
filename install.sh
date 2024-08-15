#!/usr/bin/env bash

# ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗  ████████╗██╗    ██╗███████╗ █████╗ ██╗  ██╗███████╗
# ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝  ╚══██╔══╝██║    ██║██╔════╝██╔══██╗██║ ██╔╝██╔════╝
# ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝█████╗██║   ██║ █╗ ██║█████╗  ███████║█████╔╝ ███████╗
# ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗╚════╝██║   ██║███╗██║██╔══╝  ██╔══██║██╔═██╗ ╚════██║
# ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗     ██║   ╚███╔███╔╝███████╗██║  ██║██║  ██╗███████║
# ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝     ╚═╝    ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

# Display a title in terminal
if [ -f ./scripts/common/main-title.sh ]; then
  ./scripts/common/main-title.sh
fi

# Source colors & functions
if [ -d ./functions ]; then
  for fn in ./functions/*; do
    . "$fn"
  done
fi

# Check if script is run as root
if [ "$(id -u)" -eq 0 ]; then
  printf "\n${BRED}You must NOT be a root user when running this script,${NC} please run ./install.sh as normal user\n\n" 2>&1
  exit 1
fi

# Change directory
SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )") && cd "$SCRIPT_DIR" || exit

# Check if system is NixOS
if grep -iq nixos /etc/os-release; then
  printf "\nDetected NixOS.\n"
  ./scripts/nixos/setup-nixos.sh
  exit 0
fi

# Install whiptail if not already
if ! command -v whiptail > /dev/null; then
  ./scripts/common/install-whiptail.sh
fi

# Take user choice
choices=$(whiptail --title "USER CHOICE" --checklist "      Choose one or more options:" 15 43 8 \
     1 "Install AutoCPUFreq" OFF \
     2 "Install Brave Browser" ON \
     3 "Install Cron" ON \
     4 "Install Extra Fonts" ON \
     5 "Install Flutter" ON \
     6 "Install Github Desktop" OFF \
     7 "Install GUI Apps" ON \
     8 "Install Joplin" OFF \
     9 "Install KDE/GSConnect" OFF \
    10 "Install Obsidian" ON \
    11 "Install OnlyOffice" ON \
    12 "Install Password Manager  " ON \
    13 "Install PDF Viewer" ON \
    14 "Install Terminal Tweaks" ON \
    15 "Install Torrect Client" ON \
    16 "Install UFW" ON \
    17 "Install VSCodium" OFF \
    18 "Setup Bluetooth" ON \
    19 "Setup Bootloader" ON \
    20 "Setup GNOME" ON \
    21 "Setup Multi-Audio" ON \
    2>&1 >/dev/tty)

# Exit if user choses 'Cancel'
exitstatus=$?
if [ $exitstatus = 1 ]; then
  exit 1
fi

# Convert choices variable into an array
eval "choices=($choices)"

# My custom scripts
./scripts/archlinux/install-aur-helper.sh      # Program that helps install packages from AUR (the user contributed arch linux repository)
./scripts/archlinux/install-paccache.sh        # Program that helps clear pacman cache in archlinux
./scripts/archlinux/setup-pacman.sh            # Make arch package manager work better
./scripts/common/update-system.sh              # Updating installed programs
_is_element_of_array choices[@]  1 && ./scripts/common/install-auto-cpufreq.sh       # Automatically change cpu freq to save battery
_is_element_of_array choices[@]  2 && ./scripts/common/install-brave.sh              # My fav browser
_is_element_of_array choices[@]  3 && ./scripts/common/install-cron.sh               # Program to automate tasks
_is_element_of_array choices[@]  4 && ./scripts/common/install-fonts.sh              # Install some fonts (eg: region-specific ones)
_is_element_of_array choices[@]  5 && ./scripts/common/install-flutter.sh            # For developing cross-platform apps (mainly for Android)
_is_element_of_array choices[@]  6 && ./scripts/common/install-github-desktop.sh     # Github-desktop for linux
_is_element_of_array choices[@]  7 && ./scripts/common/install-gui-apps.sh           # GUI apps common to all default package managers
_is_element_of_array choices[@]  8 && ./scripts/common/install-joplin.sh             # Cloud-synced note-taking app
_is_element_of_array choices[@]  9 && ./scripts/common/install-kde-or-gsconnect.sh   # connect phone to computer for copy pasting files & text
_is_element_of_array choices[@] 10 && ./scripts/common/install-obsidian.sh           # Note-taking app for those who love markdown
_is_element_of_array choices[@] 11 && ./scripts/common/install-onlyoffice.sh         # Office suite
_is_element_of_array choices[@] 12 && ./scripts/common/install-passwd-manager.sh     # As name suggests
_is_element_of_array choices[@] 13 && ./scripts/common/install-pdf-viewer.sh         # PDF viewer and editor
_is_element_of_array choices[@] 14 && ./scripts/common/install-terminal-tweaks.sh    # Some customizations to make my terminal experience better
_is_element_of_array choices[@] 15 && ./scripts/common/install-torrent-client.sh     # Also, as name suggests
_is_element_of_array choices[@] 16 && ./scripts/common/install-ufw.sh                # Install and Setup UFW - The Uncomplicated Firewall
_is_element_of_array choices[@] 17 && ./scripts/common/install-vscodium.sh           # Open source vscode
_is_element_of_array choices[@] 18 && ./scripts/common/setup-bluetooth.sh            # Bluetooth tweaks
_is_element_of_array choices[@] 19 && ./scripts/common/setup-bootloader.sh           # Bootloader Customisations
_is_element_of_array choices[@] 20 && ./scripts/common/setup-gnome.sh                # GNOME Desktop Environment Customisations
_is_element_of_array choices[@] 21 && ./scripts/common/setup-multi-audio.sh          # Enable audio routed to multiple devices at same time
./scripts/common/cleanup.sh                    # Cleanup package manager cache
./scripts/debian/install-nala.sh               # Good old apt, but colorful
./scripts/debian/setup-antix.sh                # Antix Linux Customisations
./scripts/rhel/setup-dnf.sh                    # Make DNF package manager faster

# Custom tweaks
sudo sysctl vm.swappiness=10                                        # Lower swappiness value for better utilization of RAM
sudo cp ./scripts/common/wifi-toggle.sh /usr/local/bin/wifi-toggle  # Script to toggle wifi

# Done
echo "Installation is complete. Reboot your system for the changes to take place."
