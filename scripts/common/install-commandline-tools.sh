#!/usr/bin/env bash

# Display title of script
if type _printtitle &> /dev/null; then
  _printtitle "INSTALLING - ANDROID CMDLINE TOOLS"
fi

# Install dependencies
if command -v apt-get > /dev/null; then # Install for debian-based distros
  sudo apt-get install -y curl libxml2-utils unzip
elif command -v pacman > /dev/null; then # Install for archlinux-based distros
  sudo pacman -S --noconfirm curl libxml2 unzip
elif command -v dnf > /dev/null; then # Install for RHEL-based distros
  sudo dnf install -y curl libxml2 unzip
fi

# Fetch the XML file with release information
xml_file=$(curl -s https://dl.google.com/android/repository/repository2-1.xml)

# Extract the latest version of the command-line tools
latest_version_file=$(echo "$xml_file" | xmllint --xpath "//*[local-name()='remotePackage'][@path='cmdline-tools;latest'][1]//*[local-name()='archives']//*[local-name()='archive']//*[local-name()='complete']//*[local-name()='url']/text()" - | grep linux 2>/dev/null)

# Construct the download URL
download_url="https://dl.google.com/android/repository/${latest_version_file}"

# Download the command-line tools using curl
curl -O "$download_url"

# Extract files
unzip "$latest_version_file"

# Remove zip file
rm "$latest_version_file"

# Create directory to store the files
mkdir -pv "$HOME"/.local/share/android-sdk

# Move the files
mv cmdline-tools/ "$HOME"/.local/share/android-sdk/
