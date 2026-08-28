#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Remote & Virtual Filesystems
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora Filesystems]: Instalando utilitários de arquivos..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} dnf install -y fuse-sshfs

echo "✅ [Fedora Filesystems]: Suporte a fuse-sshfs instalado!"
