#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: UEFI Firmware Daemon Masking
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora UEFI]: Desativando serviço fwupd..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} systemctl mask --now fwupd fwupd.socket 2> "/dev/null" || true
${SUDO} rm -rf /var/cache/fwupd/

echo "✅ [Fedora UEFI]: fwupd mascarado com sucesso!"
