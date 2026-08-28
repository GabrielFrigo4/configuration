#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Incus System Containers
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora Incus]: Instalando gerenciador de containers Incus..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

${SUDO} dnf install -y incus
${SUDO} usermod -aG incus-admin "${TARGET_USER}"
${SUDO} systemctl enable --now incus

echo "✅ [Fedora Incus]: Incus instalado e serviço habilitado!"
