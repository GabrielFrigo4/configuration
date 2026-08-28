#!/usr/bin/env sh
set -eu

# Game of Trees (Got) Configuration
# Configura Got (VCS nativo do ecossistema BSD) consumindo dados do Vault.

GOT_CONF="${HOME}/.gotconfig"

if [ -n "${GIT_AUTHOR_NAME-}" ] && [ -n "${GIT_AUTHOR_EMAIL-}" ]; then
	cat << EOF > "${GOT_CONF}"
author "${GIT_AUTHOR_NAME} <${GIT_AUTHOR_EMAIL}>"
EOF
fi
