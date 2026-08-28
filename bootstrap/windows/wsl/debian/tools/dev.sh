#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: WSL Debian Essential Development Tools
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} apt install -y \
	build-essential \
	git \
	gh \
	curl \
	wget \
	unzip \
	ripgrep \
	fd-find \
	bat \
	eza \
	fastfetch \
	zsh
