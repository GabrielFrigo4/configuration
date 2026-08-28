#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Arch Linux Hardware Video Acceleration & Udev Rules
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pacman -S --needed --noconfirm \
	mesa \
	vulkan-devel \
	intel-media-driver \
	libva-intel-driver \
	libva-utils \
	libva

curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/develop/platformio/assets/system/99-platformio-udev.rules | ${SUDO} tee /etc/udev/rules.d/99-platformio-udev.rules > "/dev/null" 2>&1 || true

cat << 'EOF' | ${SUDO} tee "/etc/udev/rules.d/99-ds4.rules" > "/dev/null"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="05c4", MODE="0666"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="09cc", MODE="0666"
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ba0", MODE="0666"
EOF

${SUDO} udevadm control --reload-rules 2> "/dev/null" || true
${SUDO} udevadm trigger 2> "/dev/null" || true
