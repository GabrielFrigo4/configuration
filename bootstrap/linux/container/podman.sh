#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Linux Universal Container Engines (Podman & Docker)
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Linux Containers]: Instalando Podman e Docker..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

if command -v dnf > "/dev/null" 2>&1; then
	${SUDO} dnf install -y podman
elif command -v apt > "/dev/null" 2>&1; then
	${SUDO} apt install -y podman docker.io
elif command -v pacman > "/dev/null" 2>&1; then
	${SUDO} pacman -S --needed --noconfirm podman docker
fi

${SUDO} systemctl enable --now docker 2> "/dev/null" || true
${SUDO} usermod -aG docker "${TARGET_USER}" 2> "/dev/null" || true
${SUDO} loginctl enable-linger "${TARGET_USER}" 2> "/dev/null" || true

echo "✅ [Linux Containers]: Engines de container configuradas com sucesso!"
