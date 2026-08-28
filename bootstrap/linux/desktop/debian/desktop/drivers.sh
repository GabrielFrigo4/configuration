#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Debian Mesa & Nvidia Proprietary Graphics Drivers
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} apt update
${SUDO} apt install --yes \
	mesa-utils \
	mesa-common-dev \
	libgl1-mesa-dev \
	nvidia-driver \
	firmware-misc-nonfree
