#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: WSL Debian System, User & Development Environment
# ------------------------------------------------------------------------------
set -eu

echo "📦 [WSL Debian]: Configurando usuário, systemd e ferramentas base..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-gabriel}"

if ! id "${TARGET_USER}" > "/dev/null" 2>&1; then
	useradd -m -G sudo -s /usr/bin/bash "${TARGET_USER}"
fi

cat << 'EOF' | ${SUDO} tee "/etc/sudoers.d/wheel" > "/dev/null"
%sudo ALL=(ALL:ALL) ALL
EOF
${SUDO} chmod 0440 "/etc/sudoers.d/wheel"

cat << EOF | ${SUDO} tee "/etc/wsl.conf" > "/dev/null"
[boot]
systemd=true

[user]
default=${TARGET_USER}
EOF

${SUDO} apt update
${SUDO} apt upgrade -y
${SUDO} apt install -y \
	doas \
	build-essential \
	git \
	curl \
	wget \
	mandoc \
	eza \
	bat \
	ripgrep \
	fd-find \
	fastfetch

cat << 'EOF' | ${SUDO} tee "/etc/doas.conf" > "/dev/null"
permit persist :sudo
EOF
${SUDO} chmod 0440 "/etc/doas.conf"

echo "✅ [WSL Debian]: Ambiente Debian WSL2 configurado com sucesso!"
