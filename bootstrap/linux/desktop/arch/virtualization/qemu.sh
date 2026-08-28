#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Arch Linux Virtualization (KVM, QEMU & Libvirt)
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

${SUDO} pacman -S --needed --noconfirm \
	qemu-desktop \
	libvirt \
	dnsmasq \
	iptables-nft \
	edk2-ovmf \
	virt-manager \
	virt-viewer

${SUDO} systemctl enable --now libvirtd 2> "/dev/null" || true
${SUDO} usermod -aG libvirt "${TARGET_USER}" 2> "/dev/null" || true
${SUDO} virsh --connect qemu:///system net-autostart default 2> "/dev/null" || true
${SUDO} virsh --connect qemu:///system net-start default 2> "/dev/null" || true
