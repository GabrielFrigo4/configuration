#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Debian Base System & Doas Setup
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"
${SUDO} usermod --append --groups sudo "${TARGET_USER}" 2> "/dev/null" || true

if [ -f "/etc/apt/sources.list" ]; then
	${SUDO} sed -i 's/main non-free-firmware/main non-free-firmware contrib non-free/' "/etc/apt/sources.list" 2> "/dev/null" || true
fi

${SUDO} apt update
${SUDO} apt install --yes gnupg ca-certificates apt-transport-https doas

cat << 'EOF' | ${SUDO} tee "/etc/doas.conf" > "/dev/null"
permit persist :sudo
EOF
${SUDO} chmod 0440 "/etc/doas.conf"
