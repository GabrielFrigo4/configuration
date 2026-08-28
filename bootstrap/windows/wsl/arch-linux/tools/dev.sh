#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: WSL Arch Linux Essential Development Tools
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pacman -S --needed --noconfirm \
	base-devel \
	git \
	github-cli \
	curl \
	wget \
	unzip \
	ripgrep \
	fd \
	bat \
	eza \
	fastfetch \
	zsh
