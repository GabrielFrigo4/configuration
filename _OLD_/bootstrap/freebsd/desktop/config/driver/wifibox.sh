#!/bin/sh

# Stop on Error
set -e

# Check Privileges
if [ "$(id -u)" != "0" ]; then
    echo "Erro: Execute como root."
    exit 1
fi

# Ensure Package Installation
if ! pkg info -e wifibox > "/dev/null" 2>&1; then
    echo "Instalando o pacote wifibox..."
    pkg install --yes wifibox
fi

# Detect Wireless Hardware (PCI address for passthrough)
echo "Detectando hardware Wi-Fi para o Wifibox..."
PCI_RAW="$(pciconf -l | grep "class=0x0280" | head -n 1 | awk '{print $1}')"

if [ -z "${PCI_RAW}" ]; then
    PCI_RAW="$(pciconf -lv | grep -B 1 -iE "wireless|wi-fi|802\.11" | grep "@pci" | head -n 1 | awk '{print $1}')"
fi

if [ -z "${PCI_RAW}" ]; then
    echo "Erro: Nenhuma placa de rede sem fio PCI foi detectada pelo pciconf."
    exit 1
fi

PCI_ADDR="$(echo "${PCI_RAW}" | awk -F'@pci' '{print $2}' | awk -F: '{print $2"/"$3"/"$4}')"

if [ -z "${PCI_ADDR}" ]; then
    echo "Erro: Não foi possível determinar o endereço PCI da placa Wi-Fi."
    exit 1
fi

echo "Placa PCI detectada: ${PCI_RAW} (Endereço: ${PCI_ADDR})"

# Block native FreeBSD driver if active
PCI_DRIVER="$(echo "${PCI_RAW}" | awk -F'@' '{print $1}')"
if [ -n "${PCI_DRIVER}" ] && [ "${PCI_DRIVER}" != "none" ]; then
    sysrc devmatch_enable="YES" > /dev/null
    sysrc devmatch_blocklist+="if_${PCI_DRIVER}" > /dev/null
fi

# Configure bhyve.conf for Wifibox
mkdir -p "/usr/local/etc/wifibox"
if [ ! -f "/usr/local/etc/wifibox/bhyve.conf" ] && [ -f "/usr/local/etc/wifibox/bhyve.conf.sample" ]; then
    cp "/usr/local/etc/wifibox/bhyve.conf.sample" "/usr/local/etc/wifibox/bhyve.conf"
fi

if [ -f "/usr/local/etc/wifibox/bhyve.conf" ]; then
    if grep -q "^passthru=" "/usr/local/etc/wifibox/bhyve.conf"; then
        sed -i '' "s|^passthru=.*|passthru=\"${PCI_ADDR}\"|" "/usr/local/etc/wifibox/bhyve.conf"
    else
        echo "passthru=\"${PCI_ADDR}\"" >> "/usr/local/etc/wifibox/bhyve.conf"
    fi
fi

# Configure boot/loader.conf for Passthrough
sysrc -f /boot/loader.conf vmm_load="YES" > "/dev/null"
sysrc -f /boot/loader.conf pptdevs="${PCI_ADDR}" > "/dev/null"

# Configure rc.conf
sysrc wifibox_enable="YES" > "/dev/null"
sysrc ifconfig_wifibox0="SYNCDHCP" > "/dev/null"
sysrc background_dhclient_wifibox0="YES" > "/dev/null"

# Setup WPA Supplicant for Wifibox
mkdir -p "/usr/local/etc/wifibox/wpa_supplicant"
cat << 'EOF' | tee "/usr/local/etc/wifibox/wpa_supplicant/wpa_supplicant.conf" > "/dev/null"
ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=wheel
update_config=1
EOF

# Set Permissions
chmod 0600 "/usr/local/etc/wifibox/wpa_supplicant/wpa_supplicant.conf"

# Start Wireless
echo "Reiniciando os serviços de rede e Wifibox..."
service wifibox restart > "/dev/null" 2>&1 || service wifibox start > "/dev/null" 2>&1 || true
service netif restart wifibox0 > "/dev/null" 2>&1 || service netif restart > "/dev/null" 2>&1 || true

# Finish Configuration
echo "Configuração do Wifibox concluída com sucesso!"
