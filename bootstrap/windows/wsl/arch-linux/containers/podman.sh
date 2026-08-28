#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: WSL Arch Linux Container Engines (Podman & Docker)
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

${SUDO} pacman -S --needed --noconfirm podman docker

${SUDO} systemctl enable --now docker 2> "/dev/null" || true
${SUDO} usermod -aG docker "${TARGET_USER}" 2> "/dev/null" || true
