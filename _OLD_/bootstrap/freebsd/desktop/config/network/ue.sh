#!/bin/sh

# Stop on Error
set -e

# Check Privileges
if [ "$(id -u)" != "0" ]; then
	echo "Erro: Execute como root."
	exit 1
fi

# Setup Target Configuration
INTERFACE="ue0"

# Enable DHCP
sysrc ifconfig_${INTERFACE}="DHCP"

# Start Interface
service netif restart "${INTERFACE}"
