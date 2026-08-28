#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Modern Filesystems & FUSE
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD Filesystems]: Instalando drivers de sistemas de arquivos..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pkg install --yes fusefs-exfat exfat-utils fusefs-ntfs fusefs-ext2
${SUDO} sysrc kld_list+="fusefs"
${SUDO} kldload fusefs 2> "/dev/null" || true

echo "✅ [FreeBSD Filesystems]: Drivers FUSE instalados e módulo carregado!"
