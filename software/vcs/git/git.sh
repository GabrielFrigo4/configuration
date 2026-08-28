#!/usr/bin/env sh
set -eu

# Git Global Configuration
# Configura Git com boas práticas e consome dados do Vault se disponíveis.

if [ -n "${GIT_AUTHOR_NAME-}" ]; then
	git config --global user.name "${GIT_AUTHOR_NAME}"
fi

if [ -n "${GIT_AUTHOR_EMAIL-}" ]; then
	git config --global user.email "${GIT_AUTHOR_EMAIL}"
fi

git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf input
git config --global core.quotepath false
