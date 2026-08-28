#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: FreeBSD Doas & Sudo Privilege Setup
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD Doas/Sudo]: Configurando elevação de privilégios..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} pkg install --yes doas sudo

cat << 'EOF' | ${SUDO} tee "/usr/local/etc/doas.conf" > "/dev/null"
permit nopass :wheel
EOF
${SUDO} chmod 0440 "/usr/local/etc/doas.conf"

mkdir -p "/usr/local/etc/sudoers.d"
cat << 'EOF' | ${SUDO} tee "/usr/local/etc/sudoers.d/wheel" > "/dev/null"
%wheel ALL=(ALL:ALL) NOPASSWD: ALL
EOF
${SUDO} chmod 0440 "/usr/local/etc/sudoers.d/wheel"

echo "✅ [FreeBSD Doas/Sudo]: Configurado com sucesso (permissões 0440 aplicadas)!"
