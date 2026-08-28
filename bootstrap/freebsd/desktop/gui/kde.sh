#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: KDE Plasma Wayland Desktop
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD KDE]: Configurando ambiente gráfico KDE Plasma..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pkg install --yes desktop-installer wl-clipboard xclip octopkg

echo "✅ [FreeBSD KDE]: Ambiente pronto! Execute 'desktop-installer' para seleção interativa se necessário."
