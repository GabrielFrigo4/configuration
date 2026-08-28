#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: WSL Arch Linux System, User & Development Environment
# ------------------------------------------------------------------------------
set -eu

echo "📦 [WSL Arch Linux]: Configurando usuário, systemd e ferramentas base..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-gabriel}"

if ! id "${TARGET_USER}" > "/dev/null" 2>&1; then
	useradd -m -G wheel -s /usr/bin/bash "${TARGET_USER}"
fi

cat << 'EOF' | ${SUDO} tee "/etc/sudoers.d/wheel" > "/dev/null"
%wheel ALL=(ALL:ALL) ALL
EOF
${SUDO} chmod 0440 "/etc/sudoers.d/wheel"

cat << EOF | ${SUDO} tee "/etc/wsl.conf" > "/dev/null"
[boot]
systemd=true

[user]
default=${TARGET_USER}
EOF

${SUDO} pacman-key --init 2> "/dev/null" || true
${SUDO} pacman-key --populate archlinux 2> "/dev/null" || true

${SUDO} pacman -Syu --needed --noconfirm \
	archlinux-keyring \
	opendoas \
	base-devel \
	git \
	curl \
	wget \
	mandoc \
	eza \
	bat \
	ripgrep \
	fd \
	fastfetch

cat << 'EOF' | ${SUDO} tee "/etc/doas.conf" > "/dev/null"
permit persist :wheel
EOF
${SUDO} chmod 0440 "/etc/doas.conf"

echo "✅ [WSL Arch Linux]: Ambiente Arch WSL2 configurado com sucesso!"
