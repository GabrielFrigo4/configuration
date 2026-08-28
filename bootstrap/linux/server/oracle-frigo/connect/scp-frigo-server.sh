#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# SCP: Oracle Frigo Server
# ------------------------------------------------------------------------------
set -eu

if [ -z "${1-}" ]; then
	echo "Uso: $0 <arquivo_ou_pasta>"
	exit 1
fi

SERVER_IP="${FRIGO_SERVER_IP:-144.22.210.65}"
SERVER_USER="${FRIGO_SERVER_USER:-ubuntu}"
SERVER_KEY="${FRIGO_SERVER_KEY:-${HOME}/.vault/keys/ssh-key-frigo-server.key}"

scp -r -i "${SERVER_KEY}" "${1}" "${SERVER_USER}@${SERVER_IP}:/home/${SERVER_USER}/${1}"
