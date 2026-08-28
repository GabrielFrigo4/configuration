#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Modern CLI & System Tools
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD CLI]: Instalando utilitários modernos de terminal..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pkg install --yes eza bat ripgrep fd-find grex

${SUDO} pkg install --yes mandoc zip unzip 7-zip

${SUDO} pkg install --yes fastfetch cpufetch

echo "✅ [FreeBSD CLI]: Utilitários de linha de comando instalados!"
