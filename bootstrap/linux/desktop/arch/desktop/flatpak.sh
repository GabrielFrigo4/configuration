#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Arch Linux Flatpak & Flathub Integration
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pacman -S --needed --noconfirm flatpak
flatpak remote-add --if-not-exists flathub "https://dl.flathub.org/repo/flathub.flatpakrepo"
