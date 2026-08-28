#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# SCP: FreeBSD Server (KVM / QEMU)
# ------------------------------------------------------------------------------
set -eu

if [ -z "${1-}" ]; then
	echo "Uso: $0 <arquivo_ou_pasta>"
	exit 1
fi

FREEBSD_IP="$(virsh --connect "qemu:///system" domifaddr FreeBSD 2> "/dev/null" \
	| awk '$3 == "ipv4" {print $4}' | cut -d'/' -f1 || true)"

if [ -z "${FREEBSD_IP}" ]; then
	echo "❌ [FreeBSD Connect]: IP da VM 'FreeBSD' não detectado via virsh."
	exit 1
fi

scp -r "${1}" "freebsd@${FREEBSD_IP}:/home/freebsd/${1}"
