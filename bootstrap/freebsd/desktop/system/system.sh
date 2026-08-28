#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Base System Setup
# ------------------------------------------------------------------------------
set -eu

echo "📦 [FreeBSD System]: Iniciando configuração base..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

${SUDO} pw groupmod wheel -m "${TARGET_USER}" 2> "/dev/null" || true
${SUDO} pw groupmod operator -m "${TARGET_USER}" 2> "/dev/null" || true
${SUDO} pw groupmod video -m "${TARGET_USER}" 2> "/dev/null" || true
${SUDO} pw groupmod webcamd -m "${TARGET_USER}" 2> "/dev/null" || true

${SUDO} pkg bootstrap --yes
${SUDO} pkg update

${SUDO} sysrc allscreens_flags="-f spleen-16x32"

${SUDO} sysctl kern.coredump=0 > "/dev/null" 2>&1 || true
grep -qxF "kern.coredump=0" "/etc/sysctl.conf" 2> "/dev/null" || echo "kern.coredump=0" | ${SUDO} tee -a "/etc/sysctl.conf" > "/dev/null"

mkdir -p "${HOME}/Workspace"

echo "✅ [FreeBSD System]: Configuração base concluída com sucesso!"
