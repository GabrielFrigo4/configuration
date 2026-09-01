#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Wireshark Packet Capture
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD Wireshark]: Instalando e configurando captura de pacotes..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

${SUDO} pkg install --yes wireshark

DEVFS_CONF="/etc/devfs.rules"
if [ ! -f "${DEVFS_CONF}" ]; then
	${SUDO} touch "${DEVFS_CONF}"
fi

if ! grep -q "own.*bpf" "${DEVFS_CONF}" 2> "/dev/null"; then
	cat <<- 'EOF' | ${SUDO} tee -a "${DEVFS_CONF}" > "/dev/null"

	[system=10]
	add path 'bpf*' mode 0660 group wheel
	EOF
	${SUDO} sysrc devfs_system_ruleset="system"
	${SUDO} service devfs restart > "/dev/null" 2>&1 || true
fi

${SUDO} pw groupmod wheel -m "${TARGET_USER}" 2> "/dev/null" || true

echo "✅ [FreeBSD Wireshark]: Configurado! Usuário '${TARGET_USER}' autorizado a capturar via BPF."
