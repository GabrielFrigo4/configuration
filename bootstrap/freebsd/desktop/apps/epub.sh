#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: ePub & Document Readers
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD Readers]: Instalando leitor de ePub e navegadores TUI..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pkg install --yes arianna
${SUDO} pkg install --yes w3m lynx

mkdir -p "${HOME}/.w3m"
touch "${HOME}/.w3m/history"

echo "✅ [FreeBSD Readers]: Arianna e leitores de documentos instalados com sucesso!"
