#!/usr/bin/sh

### ################################################################################################################################

### ################################
### Setup Pacman
### ################################

sudo pacman-mirrors --fasttrack 5
sudo pacman --needed --noconfirm -Syyu

### ################################
### Setup System
### ################################

sudo echo ${"$(sudo cat /etc/sddm.conf)"/'Numlock=none'/'Numlock=on'} | sudo tee "/etc/sddm.conf" > "/dev/null"
sudo echo ${"$(sudo cat /etc/sddm.conf)"/'EnableHiDPI=false'/'EnableHiDPI=true'} | sudo tee "/etc/sddm.conf" > "/dev/null"

### ################################
### Setup Journald
### ################################

sudo journalctl --vacuum-size=256M
sudo mkdir -p "/etc/systemd/journald.conf.d/"
cat << 'EOF' | sudo tee "/etc/systemd/journald.conf.d/00-size-limit.conf" > "/dev/null"
[Journal]
SystemMaxUse=256M
EOF
sudo systemctl restart systemd-journald

### ################################
### Setup DOAS
### ################################

sudo pacman --needed --noconfirm -S opendoas
cat << 'EOF' | sudo tee "/etc/doas.conf" > "/dev/null"
permit persist :wheel
EOF
sudo chmod 0440 "/etc/doas.conf"

### ################################################################################################################################

### ################################
### Installing Needed Tools
### ################################

sudo pacman --needed --noconfirm -S base-devel
sudo pacman --needed --noconfirm -S musl

sudo pacman --needed --noconfirm -S zip
sudo pacman --needed --noconfirm -S unzip
sudo pacman --needed --noconfirm -S 7zip

sudo pacman --needed --noconfirm -S wget
sudo pacman --needed --noconfirm -S wget2
sudo pacman --needed --noconfirm -S curl

sudo pacman --needed --noconfirm -S man-db
sudo pacman --needed --noconfirm -S man-pages
sudo pacman --needed --noconfirm -S qman

### ################################
### Installing Git Tools
### ################################

sudo pacman --needed --noconfirm -S git
sudo pacman --needed --noconfirm -S git-credential-oauth
sudo pacman --needed --noconfirm -S github-cli

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
### Installing LXC Tools
### ################################

sudo pacman --needed --noconfirm -S lxc
sudo systemctl enable --now lxc-net.service
sudo systemctl enable --now lxc.service

sudo pacman --needed --noconfirm -S incus
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

### ################################
### Installing Core Utils
### ################################

sudo pacman --needed --noconfirm -S coreutils
sudo pacman --needed --noconfirm -S uutils-coreutils

### ################################
### Installing Connection Tools
### ################################

sudo pacman --needed --noconfirm -S bluez-utils
sudo pacman --needed --noconfirm -S iwd

### ################################
### Installing Bootable Tools
### ################################

sudo pacman --needed --noconfirm -S ventoy

### ################################
### Setup Workspace
### ################################

mkdir -p "${HOME}/Workspace"

### ################################################################################################################################

### ################################
### Installing Graphics Drivers
### ################################

sudo pacman --needed --noconfirm -S intel-media-driver
sudo pacman --needed --noconfirm -S libva-nvidia-driver
sudo pacman --needed --noconfirm -S libva-intel-driver
sudo pacman --needed --noconfirm -S libva-utils
sudo pacman --needed --noconfirm -S libva
sudo pacman --needed --noconfirm -S mesa

### ################################
### Installing Vulkan Tools
### ################################

sudo pacman --needed --noconfirm -S vulkan-devel
sudo pacman --needed --noconfirm -S spirv-tools

### ################################
### Installing Shader Tools
### ################################

sudo pacman --needed --noconfirm -S directx-shader-compiler
sudo pacman --needed --noconfirm -S shaderc
sudo pacman --needed --noconfirm -S glslang

### ################################
### Installing OneAPI Tools
### ################################

sudo pacman --needed --noconfirm -S intel-oneapi-basekit

### ################################################################################################################################

### ################################
### Installing Linux Kernel
### ################################

export LINUX_VER="$(mhwd-kernel -li |grep running |cut -d"(" -f2 |cut -d")" -f1)"
sudo pacman --needed --noconfirm -S $LINUX_VER-headers
sudo pacman --needed --noconfirm -S dkms

### ################################################################################################################################

### ################################
### Installing System Rules
### ################################

# https://docs.platformio.org/en/latest/core/installation/udev-rules.html
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules > "/dev/null"

cat << 'EOF' | sudo tee "/etc/udev/rules.d/99-ds4.rules" > "/dev/null"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c4", MODE="0666"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", MODE="0666"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ba0", MODE="0666"
EOF

### ################################################################################################################################

### ################################
### Installing Pacman Contrib
### ################################

sudo pacman --needed --noconfirm -S pacman-contrib

### ################################
### Installing Yay
### ################################

cd "/tmp"
git clone "https://aur.archlinux.org/yay.git"
cd yay
makepkg -si
cd ~

### ################################
### Updating Yay
### ################################

yay --needed --noconfirm -Syyuu

### ################################
### Installing Flatpak
### ################################

yay --needed --noconfirm -S flatpak

### ################################
### Setup Flathub
### ################################

flatpak remote-add --if-not-exists flathub "https://dl.flathub.org/repo/flathub.flatpakrepo"
alias flatall="flatpak override --user --filesystem=host --share=ipc --share=network --socket=system-bus --socket=session-bus --device=all --talk-name=org.freedesktop.Flatpak"

### ################################################################################################################################

### ################################
### Installing Bash
### ################################

yay --needed --noconfirm -S bash

### ################################
### Installing Zsh
### ################################

yay --needed --noconfirm -S zsh
sudo chsh -s "$(which zsh)" "$(id -un)"
sudo chsh -s "$(which zsh)" "root"

yay --needed --noconfirm -S zsh-theme-powerlevel10k
p10k configure

### ################################
### Installing Nushell
### ################################

yay --needed --noconfirm -S nushell
yay --needed --noconfirm -S oh-my-posh
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

### ################################
### Installing PowerShell
### ################################

yay --needed --noconfirm -S powershell-bin
oh-my-posh init pwsh --config "${HOME}/.oh-my-posh/atomic.omp.json" > "${HOME}/.oh-my-posh.ps1"
cat << 'EOF' | tee -a "${HOME}/.config/powershell/Microsoft.PowerShell_profile.ps1" > "/dev/null"
### ################################
### SHELL ENVIRONMENT
### ################################

### ################################
### SHELL OH-MY-POSH
### ################################

. "~/.oh-my-posh.ps1";
Import-Module Terminal-Icons;

### ################################
### SHELL FUNCTIONS
### ################################

### ################################
### SHELL ALIAS
### ################################

### ################################
### SHELL CONFIGURATION
### ################################
EOF

### ################################################################################################################################

### ################################
### Installing System Fonts
### ################################

yay --needed --noconfirm -S fontconfig
mkdir -p "${HOME}/.local/share/fonts"

### ################################
### Microsoft System Fonts
### ################################

yay --needed --noconfirm -S ttf-ms-win11-auto
yay --needed --noconfirm -S ttf-carlito

### ################################
### Nerd Fonts
### ################################

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
. "${SCRIPT_DIR}/../../../common/fonts.sh"

### ################################################################################################################################

### ################################
### Installing System Wayland
### ################################

yay --needed --noconfirm -S wayland
yay --needed --noconfirm -S lib32-wayland
yay --needed --noconfirm -S hyprwayland-scanner
yay --needed --noconfirm -S wayland-protocols

### ################################
### Installing System Tools
### ################################

yay --needed --noconfirm -S xremap-kde-bin
yay --needed --noconfirm -S wl-clipboard
yay --needed --noconfirm -S xclip xsel
yay --needed --noconfirm -S dbus

### ################################
### Installing Container Tools
### ################################

yay --needed --noconfirm -S podman

yay --needed --noconfirm -S docker
sudo systemctl enable --now docker
sudo usermod -aG docker "$(id -un)"

### ################################
### Installing Web/Net Tools
### ################################

yay --needed --noconfirm -S networkmanager-openvpn
yay --needed --noconfirm -S openvpn

touch "${HOME}/.w3m/history"
yay --needed --noconfirm -S elinks w3m lynx

yay --needed --noconfirm -S openssh mosh sshpass
yay --needed --noconfirm -S lftp mutt nettle rsync
yay --needed --noconfirm -S openbsd-netcat

yay --needed --noconfirm -S ngrok

### ################################
### Installing Wine Tools
### ################################

yay --needed --noconfirm -S wine

### ################################
### Installing System Fetch
### ################################

yay --needed --noconfirm -S fastfetch

### ################################################################################################################################

### ################################
### Installing KVM/QEMU
### ################################

yay --needed --noconfirm -S qemu-desktop
yay --needed --noconfirm -S libvirt
yay --needed --noconfirm -S dnsmasq
yay --needed --noconfirm -S iptables-nft
yay --needed --noconfirm -S edk2-ovmf
yay --needed --noconfirm -S virt-manager
yay --needed --noconfirm -S virt-viewer

sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt "$(id -un)"
sudo virsh --connect qemu:///system net-autostart default
sudo virsh --connect qemu:///system net-start default

### ################################################################################################################################

# Execute additional setups if needed
# ./softwares.sh
# ./editors.sh
# ./tools.sh
# ./servers.sh
