#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Wireshark Packet Capture
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora Wireshark]: Instalando Wireshark e configurando permissões..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

${SUDO} dnf install -y wireshark wireshark-cli

if getent group wireshark > "/dev/null" 2>&1; then
	${SUDO} usermod -aG wireshark "${TARGET_USER}"
fi

echo "✅ [Fedora Wireshark]: Concluído! Usuário '${TARGET_USER}' configurado para captura de pacotes."
