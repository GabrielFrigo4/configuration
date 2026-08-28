#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: FreeBSD Server Guest & System Configuration
# ------------------------------------------------------------------------------
set -eu

pw groupmod wheel -m "$(id -un)"

pkg bootstrap --yes
pkg update
pkg upgrade --yes

pkg install --yes qemu-guest-agent
sysrc qemu_guest_agent_enable="YES"
sysrc qemu_guest_agent_flags="-d -m virtio-serial -p /dev/ttyV0.1"
service qemu-guest-agent start 2> "/dev/null" || true

sysrc allscreens_flags="-f spleen-16x32"

pkg install --yes sudo doas

cat << 'EOF' | tee "/usr/local/etc/sudoers.d/wheel" > "/dev/null"
%wheel ALL=(ALL:ALL) NOPASSWD: ALL
EOF
chmod 0440 "/usr/local/etc/sudoers.d/wheel"

cat << 'EOF' | tee "/usr/local/etc/doas.conf" > "/dev/null"
permit nopass :wheel
EOF
chmod 0440 "/usr/local/etc/doas.conf"

sysctl kern.coredump=0 > "/dev/null" 2>&1 || true
if ! grep -q "kern.coredump=0" "/etc/sysctl.conf" 2> "/dev/null"; then
	echo "kern.coredump=0" | tee -a "/etc/sysctl.conf" > "/dev/null"
fi
