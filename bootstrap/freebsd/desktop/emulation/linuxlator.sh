#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Linuxlator Compatibility Layer
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD Linuxlator]: Ativando camada de compatibilidade Linux..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} sysrc linux_enable="YES"
${SUDO} service linux start 2> "/dev/null" || true

echo "✅ [FreeBSD Linuxlator]: Compatibilidade Linux ativa no kernel!"
