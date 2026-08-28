#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: FreeBSD Universal System & Kernel Tweaks
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD System]: Aplicando otimizações de kernel..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} sysctl kern.coredump=0 > "/dev/null" 2>&1 || true
if ! grep -q "kern.coredump=0" "/etc/sysctl.conf" 2> "/dev/null"; then
	echo "kern.coredump=0" | ${SUDO} tee -a "/etc/sysctl.conf" > "/dev/null"
fi

echo "✅ [FreeBSD System]: Otimizações aplicadas com sucesso!"
