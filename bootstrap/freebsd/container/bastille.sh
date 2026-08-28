#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: BastilleBSD Jail Automation Manager
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Bastille]: Configurando gerenciador BastilleBSD..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pkg install --yes bastille
${SUDO} sysrc bastille_enable="YES"
${SUDO} service bastille start 2> "/dev/null" || true

echo "✅ [Bastille]: Gerenciador BastilleBSD pronto para uso!"
