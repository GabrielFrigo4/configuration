#!/usr/bin/sh

### ################################################################################################################################

### ################################
### Setup System
### ################################

usermod -aG sudo gabriel

sudo sed -i 's/main non-free-firmware/main non-free-firmware contrib non-free/' /etc/apt/sources.list

sudo apt update
sudo apt upgrade -y

sudo apt install --yes manpages
sudo apt install --yes man-db

### ################################
### Installing Graphics Drivers
### ################################

sudo apt install --yes libgl1-mesa-dev
sudo apt install --yes libglu1-mesa-dev
sudo apt install --yes mesa-common-dev
sudo apt install --yes mesa-utils

### ################################
### Installing NVIDIA Drivers
### ################################

sudo apt install --yes nvidia-driver
sudo apt install --yes firmware-misc-nonfree

### ################################
### Installing Prerequisites
### ################################

sudo apt install --yes gnupg
sudo apt install --yes software-properties-common
sudo apt install --yes apt-transport-https
sudo apt install --yes ca-certificates

### ################################
### Setup DOAS
### ################################

sudo apt install --yes doas
cat << 'EOF' | sudo tee "/etc/doas.conf" > "/dev/null"
permit persist :sudo
EOF
sudo chmod 0440 "/etc/doas.conf"

### ################################################################################################################################

### ################################
### Setup Init
### ################################

cat << 'EOF' | tee "${HOME}/init" > "/dev/null"
#!/usr/bin/bash

emacs --fg-daemon &

disown
EOF
chmod +x "${HOME}/init"

mkdir -p "${HOME}/.config/autostart"
cat << 'EOF' | tee "${HOME}/.config/autostart/init.desktop" > "/dev/null"
[Desktop Entry]
Type=Application
Name=Init Shell Script
Exec=/home/gabriel/init
Icon=utilities-terminal
Comment=Executa um Script Shell Init
X-GNOME-Autostart-enabled=true
EOF

### ################################
### Setup Templates
### ################################

touch "${HOME}/Modelos/blank"
touch "${HOME}/Modelos/text.txt"
touch "${HOME}/Modelos/markdown.md"
touch "${HOME}/Modelos/orgmode.org"
cat << 'EOF' | "${HOME}/Modelos/shell.sh" > "/dev/null"
#!/usr/bin/bash

EOF

### ################################
### Setup Workspace
### ################################

mkdir -p "${HOME}/Workspace"

cat << 'EOF' | tee "${HOME}/.local/bin/firefox-nvc" > "/dev/null"
#!/usr/bin/bash
DRI_PRIME=1 /usr/bin/firefox "$@"
EOF
chmod +x "${HOME}/.local/bin/firefox-nvc"

### ################################################################################################################################

### ################################
### Installing Packages
### ################################

sudo apt install --yes flatpak
sudo apt install --yes gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub "https://dl.flathub.org/repo/flathub.flatpakrepo"
alias flatall="flatpak override --user --filesystem=host --share=ipc --share=network --socket=system-bus --socket=session-bus --device=all --talk-name=org.freedesktop.Flatpak"

sudo apt install --yes gnome-themes-extra

sudo apt install --yes musl
sudo apt install --yes musl-dev
sudo apt install --yes musl-tools

sudo apt install --yes binutils
sudo apt install --yes coreutils

sudo apt install --yes unzip
sudo apt install --yes zip
sudo apt install --yes tar

sudo apt install --yes wget
sudo apt install --yes wget2
sudo apt install --yes curl

### ################################
### Setup Git
### ################################

sudo apt install --yes git
sudo apt install --yes git-credential-oauth
sudo apt install --yes gh

### ################################
### Installing Git Credential Manager
### ################################

GCM_VER="$(curl -Ls -o "/dev/null" -w %{url_effective} "https://github.com/git-ecosystem/git-credential-manager/releases/latest" | awk -F/ '{print $(NF)}' | sed 's/^v//')"
wget -O gcm.deb "https://github.com/git-ecosystem/git-credential-manager/releases/download/v${GCM_VER}/gcm-linux-x64-${GCM_VER}.deb"
sudo apt install --yes "./gcm.deb"
rm "./gcm.deb"

### ################################
### Setup Git Config
### ################################

rm -f "${HOME}/.gitconfig"
git config --global credential.helper '!gh auth git-credential'
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global user.name "$GIT_AUTHOR_NAME"
git config --global init.defaultBranch "main"
git config --global pull.rebase false
git config --global color.ui auto

gh auth login
gh auth setup-git

### ################################
### Setup LXC
### ################################

sudo apt install --yes lxc
sudo apt install --yes lxc-templates
sudo systemctl enable --now lxc-net
sudo systemctl enable --now lxc

sudo apt install --yes incus
sudo systemctl enable --now incus.socket
sudo usermod -aG incus-admin "$(id -un)"
newgrp incus-admin

cat << 'EOF' | sudo tee -a "/etc/subuid" > "/dev/null"
root:100000:65536
EOF
cat << 'EOF' | sudo tee -a "/etc/subgid" > "/dev/null"
root:100000:65536
EOF
sudo systemctl restart incus

### ################################################################################################################################

### ################################
### Installing Bash
### ################################

sudo apt install --yes bash

### ################################
### Installing Zsh
### ################################

sudo apt install --yes zsh
sudo chsh -s "$(which zsh)" "$(id -un)"
sudo chsh -s "$(which zsh)" "root"

### ################################
### Installing Nushell
### ################################

curl -fsSL "https://apt.fury.io/nushell/gpg.key" | sudo gpg --dearmor -o "/etc/apt/trusted.gpg.d/fury-nushell.gpg"
echo "deb https://apt.fury.io/nushell/ /" | sudo tee "/etc/apt/sources.list.d/fury.list" > "/dev/null"
sudo apt update
sudo apt install --yes nushell

curl -sL "https://ohmyposh.dev/install.sh" | bash -s
mkdir "${HOME}/.oh-my-posh"
wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip" -O "${HOME}/.oh-my-posh/themes.zip"
unzip "${HOME}/.oh-my-posh/themes.zip" -d "${HOME}/.oh-my-posh"
chmod u+rw ~/.oh-my-posh/*.json
rm "${HOME}/.oh-my-posh/themes.zip"
oh-my-posh init nu --config "${HOME}/.oh-my-posh/atomic.omp.json" > "${HOME}/.oh-my-posh.nu"

cat << 'EOF' | tee -a "${HOME}/.config/nushell/config.nu" > "/dev/null"
### ################################
### SHELL ENVIRONMENT
### ################################

### ################################
### SHELL OH-MY-POSH
### ################################

source "~/.oh-my-posh.nu";

### ################################
### SHELL ALIAS
### ################################

### ################################
### SHELL FUNCTIONS
### ################################

### ################################
### SHELL CONFIGURATION
### ################################
EOF

### ################################################################################################################################

### ################################
### Installing System Fonts
### ################################

sudo apt install --yes fontconfig
mkdir -p "${HOME}/.local/share/fonts"

### ################################
### Microsoft System Fonts
### ################################

sudo apt install --yes ttf-mscorefonts-installer
sudo apt install --yes fonts-crosextra-carlito

### ################################
### Nerd Fonts
### ################################

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
. "${SCRIPT_DIR}/../../../common/fonts.sh"

### ################################################################################################################################

### ################################
### Installing System Tools
### ################################

sudo apt install --yes universal-ctags
sudo apt install --yes wl-clipboard
sudo apt install --yes xclip xsel

### ################################
### Installing Container Tools
### ################################

sudo apt install --yes podman

sudo apt install --yes docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker "$(id -un)"

### ################################
### Installing Web/Net Tools
### ################################

sudo apt install --yes network-manager-openvpn-gnome
sudo apt install --yes network-manager-openvpn
sudo apt install --yes openvpn

touch "${HOME}/.w3m/history"
sudo apt install --yes elinks w3m lynx

### ################################
### Installing Wine Tools
### ################################

sudo apt install --yes wine

### ################################
### Installing System Fetch
### ################################

sudo apt install --yes fastfetch

### ################################################################################################################################

# Execute additional setups if needed
# ./softwares.sh
# ./editors.sh
# ./tools.sh
