#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# SCP: Oracle Orbs Server
# ------------------------------------------------------------------------------
set -eu

if [ -z "${1-}" ]; then
	echo "Uso: $0 <arquivo_ou_pasta>"
	exit 1
fi

SERVER_IP="${ORBS_SERVER_IP:-137.131.238.161}"
SERVER_USER="${ORBS_SERVER_USER:-ubuntu}"
SERVER_KEY="${ORBS_SERVER_KEY:-${HOME}/.vault/keys/ssh-key-orbs-server.key}"

scp -r -i "${SERVER_KEY}" "${1}" "${SERVER_USER}@${SERVER_IP}:/home/${SERVER_USER}/${1}"
