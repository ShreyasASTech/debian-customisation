#!/usr/bin/env bash

# Display title of script
if type _printtitle &> /dev/null; then
  _printtitle "INSTALLING - FLUTTER"
fi

# Install dependencies
if command -v apt-get > /dev/null; then # Install for debian-based distros
  sudo apt-get install -y curl jq tar git
elif command -v pacman > /dev/null; then # Install for ar gitchlinux-based distros
  sudo pacman -S --noconfirm curl jq tar git
elif command -v dnf > /dev/null; then # Install for RHEL-based distros
  sudo dnf install -y curl jq tar git
fi

# Change directory
SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )") && cd "$SCRIPT_DIR" || exit

# Check if flutter is already present
if [ -d "$HOME"/github/flutter ]; then # Update flutter if already installed
  git -C "$HOME/github/flutter" fetch && git -C "$HOME"/github/flutter pull
else # Install flutter if not present
  # Fetch the Flutter SDK releases JSON file
  releases_json=$(curl -s https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json)

  # Extract the latest stable version
  LATEST_STABLE_VERSION=$(echo "$releases_json" | jq -r '.releases[] | select(.channel == "stable") | .version' | head -n 1)

  # Construct the download URL
  download_url="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${LATEST_STABLE_VERSION}-stable.tar.xz"

  # Download the Flutter SDK using curl
  curl -O "$download_url"

  # Extract the tar file
  tar -xvf "flutter_linux_${LATEST_STABLE_VERSION}-stable.tar.xz"

  # Remove the tar file
  rm "flutter_linux_${LATEST_STABLE_VERSION}-stable.tar.xz"

  # Create github directory if not present
  mkdir -pv "$HOME/github"

  # Move the flutter folder to correct place
  mv flutter/ "$HOME"/github/
fi

# Install commandline tools
./install-commandline-tools.sh

# Setup Android sdk path in flutter
"$HOME"/github/flutter/bin/flutter config --android-sdk "$HOME"/.local/share/android-sdk/

# Display shell config info
echo "Add the below line to your shell config file (.bashrc or .zshrc)"
echo "export PATH=\$HOME/github/flutter/bin:\$PATH"
