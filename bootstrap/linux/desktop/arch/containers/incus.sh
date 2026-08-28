#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Arch Linux LXC & Incus System Containers
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

${SUDO} pacman -S --needed --noconfirm lxc incus

${SUDO} systemctl enable --now lxc-net.service 2> "/dev/null" || true
${SUDO} systemctl enable --now lxc.service 2> "/dev/null" || true
${SUDO} systemctl enable --now incus.socket 2> "/dev/null" || true
${SUDO} usermod -aG incus-admin "${TARGET_USER}" 2> "/dev/null" || true

if ! grep -q "^root:100000:65536" "/etc/subuid" 2> "/dev/null"; then
	echo "root:100000:65536" | ${SUDO} tee -a "/etc/subuid" > "/dev/null"
fi

if ! grep -q "^root:100000:65536" "/etc/subgid" 2> "/dev/null"; then
	echo "root:100000:65536" | ${SUDO} tee -a "/etc/subgid" > "/dev/null"
fi

${SUDO} systemctl restart incus 2> "/dev/null" || true
