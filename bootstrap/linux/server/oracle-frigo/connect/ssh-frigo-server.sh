#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# SSH: Oracle Frigo Server
# ------------------------------------------------------------------------------
set -eu

SERVER_IP="${FRIGO_SERVER_IP:-144.22.210.65}"
SERVER_USER="${FRIGO_SERVER_USER:-ubuntu}"
SERVER_KEY="${FRIGO_SERVER_KEY:-${HOME}/.vault/keys/ssh-key-frigo-server.key}"

ssh -i "${SERVER_KEY}" "${SERVER_USER}@${SERVER_IP}"
