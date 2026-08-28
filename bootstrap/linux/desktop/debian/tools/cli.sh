#!/usr/bin/env sh
set -eu

sudo apt install --yes eza
sudo apt install --yes bat
sudo apt install --yes fd-find
sudo apt install --yes ripgrep

### Alias Rust Tools

cat << 'EOF' | sudo tee "/usr/local/bin/bat" > "/dev/null"
#!/bin/bash
batcat "$@"
EOF
sudo chmod +x "/usr/local/bin/bat"

cat << 'EOF' | sudo tee "/usr/local/bin/fd" > "/dev/null"
#!/bin/bash
fdfind "$@"
EOF
sudo chmod +x "/usr/local/bin/fd"

sudo apt install --yes texlive-latex-extra
sudo apt install --yes texlive-lang-portuguese

sudo apt install --yes pandoc
sudo apt install --yes weasyprint

sudo apt install --yes imagemagick
sudo apt install --yes ffmpeg

sudo apt install --yes dos2unix

sudo apt install --yes checksec
sudo apt install --yes dirb

curl -sL "https://firebase.tools" | sudo upgrade=true bash

sudo apt install --yes wireshark
sudo dpkg-reconfigure wireshark-common
sudo usermod -aG wireshark "$(id -un)"
newgrp wireshark
cat << 'EOF' | sudo tee "/usr/local/bin/wireshark" > "/dev/null"
#!/bin/bash
QT_QPA_PLATFORMTHEME="" /usr/bin/wireshark "$@"
EOF
sudo chmod +x "/usr/local/bin/wireshark"

sudo wget -O /usr/share/keyrings/dbeaver.gpg.key https://dbeaver.io/debs/dbeaver.gpg.key
echo "deb [signed-by=/usr/share/keyrings/dbeaver.gpg.key] https://dbeaver.io/debs/dbeaver-ce /" | sudo tee "/etc/apt/sources.list.d/dbeaver.list" > "/dev/null"
sudo apt update
sudo apt install --yes dbeaver-ce

