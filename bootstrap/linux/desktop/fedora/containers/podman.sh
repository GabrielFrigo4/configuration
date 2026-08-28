#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Podman Daemonless Container Engine
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora Podman]: Instalando engine de containers Podman..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} dnf install -y podman podman-docker podman-compose

echo "✅ [Fedora Podman]: Podman instalado com sucesso (rootless por padrão)!"
