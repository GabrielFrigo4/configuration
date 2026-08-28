#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: FreeBSD Native Podman Container Engine
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD Podman]: Instalando Podman nativo..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pkg install --yes podman

echo "✅ [FreeBSD Podman]: Engine Podman nativa instalada com sucesso!"
