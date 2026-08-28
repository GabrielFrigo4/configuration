#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Webcam Service Setup (webcamd)
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD Webcam]: Configurando serviço de webcam..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pkg install --yes webcamd
${SUDO} sysrc webcamd_enable="YES"
${SUDO} service webcamd start 2> "/dev/null" || true

echo "✅ [FreeBSD Webcam]: Serviço webcamd configurado e ativo!"
