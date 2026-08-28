#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Arch Linux Base System, SDDM & Journald
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pacman-mirrors --fasttrack 5 2> "/dev/null" || true
${SUDO} pacman -Syyu --needed --noconfirm

if [ -f "/etc/sddm.conf" ]; then
	${SUDO} sed -i 's/Numlock=none/Numlock=on/' "/etc/sddm.conf" 2> "/dev/null" || true
	${SUDO} sed -i 's/EnableHiDPI=false/EnableHiDPI=true/' "/etc/sddm.conf" 2> "/dev/null" || true
fi

${SUDO} mkdir -p "/etc/systemd/journald.conf.d/"
cat << 'EOF' | ${SUDO} tee "/etc/systemd/journald.conf.d/00-size-limit.conf" > "/dev/null"
[Journal]
SystemMaxUse=256M
EOF
${SUDO} systemctl restart systemd-journald 2> "/dev/null" || true

${SUDO} pacman -S --needed --noconfirm opendoas
cat << 'EOF' | ${SUDO} tee "/etc/doas.conf" > "/dev/null"
permit persist :wheel
EOF
${SUDO} chmod 0440 "/etc/doas.conf"
