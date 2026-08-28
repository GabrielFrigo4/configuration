#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Wi-Fi Setup (wpa_supplicant)
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD Wi-Fi]: Configurando serviço de rede sem fio..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

IFACE="${1:-wlan0}"

${SUDO} sysrc wpa_supplicant_enable="YES"
${SUDO} sysrc "ifconfig_${IFACE}"="WPA DHCP"

echo "✅ [FreeBSD Wi-Fi]: wpa_supplicant configurado para '${IFACE}'!"
