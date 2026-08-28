#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Universal Prettier CLI Formatter Installation
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Prettier CLI]: Instalando runtime Node e Prettier global..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
elif [ "$(id -u)" -ne 0 ] && command -v doas > "/dev/null" 2>&1; then
	SUDO="doas"
else
	SUDO=""
fi

if command -v pkg > "/dev/null" 2>&1; then
	${SUDO} pkg install --yes node npm
elif command -v dnf > "/dev/null" 2>&1; then
	${SUDO} dnf install -y nodejs npm
elif command -v apt > "/dev/null" 2>&1; then
	${SUDO} apt install -y nodejs npm
elif command -v pacman > "/dev/null" 2>&1; then
	${SUDO} pacman -S --needed --noconfirm prettier 2> "/dev/null" || ${SUDO} pacman -S --needed --noconfirm nodejs npm
fi

if ! command -v prettier > "/dev/null" 2>&1 && command -v npm > "/dev/null" 2>&1; then
	${SUDO} npm install -g prettier
fi

echo "✅ [Prettier CLI]: Prettier configurado com sucesso!"
