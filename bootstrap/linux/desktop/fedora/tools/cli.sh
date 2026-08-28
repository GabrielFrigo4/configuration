#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Terminal UI Frameworks (FTXUI / Notcurses)
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora TUI]: Instalando bibliotecas de Terminal UI..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} dnf install -y ftxui notcurses

echo "✅ [Fedora TUI]: Bibliotecas FTXUI e Notcurses instaladas!"
