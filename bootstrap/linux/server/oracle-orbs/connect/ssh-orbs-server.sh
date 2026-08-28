#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# SSH: Oracle Orbs Server
# ------------------------------------------------------------------------------
set -eu

SERVER_IP="${ORBS_SERVER_IP:-137.131.238.161}"
SERVER_USER="${ORBS_SERVER_USER:-ubuntu}"
SERVER_KEY="${ORBS_SERVER_KEY:-${HOME}/.vault/keys/ssh-key-orbs-server.key}"

ssh -i "${SERVER_KEY}" "${SERVER_USER}@${SERVER_IP}"
