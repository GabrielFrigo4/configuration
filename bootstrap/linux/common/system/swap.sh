#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Linux Universal 2GB Swap & Swappiness Setup
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Linux Swap]: Configurando swap de 2GB e swappiness=10..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

if [ ! -f "/swap" ]; then
	${SUDO} fallocate -l 2G "/swap"
	${SUDO} chmod 0600 "/swap"
	${SUDO} mkswap "/swap"
	${SUDO} swapon "/swap"
	echo "/swap none swap sw 0 0" | ${SUDO} tee -a "/etc/fstab" > "/dev/null"
fi

${SUDO} sysctl vm.swappiness=10 > "/dev/null" 2>&1 || true
if ! grep -q "vm.swappiness=10" "/etc/sysctl.conf" 2> "/dev/null"; then
	echo "vm.swappiness=10" | ${SUDO} tee -a "/etc/sysctl.conf" > "/dev/null"
fi

echo "✅ [Linux Swap]: Swap configurado com sucesso!"
