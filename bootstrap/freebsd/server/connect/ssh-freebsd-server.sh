#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# SSH: FreeBSD Server (KVM / QEMU)
# ------------------------------------------------------------------------------
set -eu

FREEBSD_IP="$(virsh --connect "qemu:///system" domifaddr FreeBSD 2> "/dev/null" \
	| awk '$3 == "ipv4" {print $4}' | cut -d'/' -f1 || true)"

if [ -z "${FREEBSD_IP}" ]; then
	echo "❌ [FreeBSD Connect]: IP da VM 'FreeBSD' não detectado via virsh."
	exit 1
fi

ssh "freebsd@${FREEBSD_IP}"
