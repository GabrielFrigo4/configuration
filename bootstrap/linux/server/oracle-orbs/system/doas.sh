#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Oracle Orbs Doas Privileges Setup
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Orbs Server]: Configurando doas..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} apt install -y doas

cat << 'EOF' | ${SUDO} tee "/etc/doas.conf" > "/dev/null"
permit nopass :sudo
EOF
${SUDO} chmod 0440 "/etc/doas.conf"

echo "✅ [Orbs Server]: doas configurado com sucesso!"
