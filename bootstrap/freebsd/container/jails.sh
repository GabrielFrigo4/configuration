#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: FreeBSD Native Jails Subsystem
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD Jails]: Ativando subsistema nativo de Jails..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} sysrc jail_enable="YES"
${SUDO} mkdir -p "/usr/jails"

echo "✅ [FreeBSD Jails]: Subsistema de Jails ativo no rc.conf!"
