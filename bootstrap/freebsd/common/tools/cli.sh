#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: FreeBSD Universal CLI & System Tools
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD CLI]: Instalando utilitários essenciais de terminal..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pkg install --yes \
	bash \
	zsh \
	curl \
	wget \
	wget2 \
	git \
	git-credential-oauth \
	gh \
	mandoc \
	eza \
	bat \
	ripgrep \
	fd-find \
	grex \
	zip \
	unzip \
	7-zip \
	fastfetch \
	cpufetch

echo "✅ [FreeBSD CLI]: Utilitários instalados com sucesso!"
