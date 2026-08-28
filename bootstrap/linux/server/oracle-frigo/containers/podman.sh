#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Oracle Frigo Containers (Podman & Docker)
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Frigo Server]: Instalando engines de container..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

${SUDO} apt install -y podman docker.io
${SUDO} systemctl enable --now docker 2> "/dev/null" || true
${SUDO} usermod -aG docker "${TARGET_USER}" 2> "/dev/null" || true
${SUDO} loginctl enable-linger "${TARGET_USER}" 2> "/dev/null" || true

echo "✅ [Frigo Server]: Containers configurados com sucesso!"
