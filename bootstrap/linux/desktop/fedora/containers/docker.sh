#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Docker CE Engine
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora Docker]: Instalando e configurando Docker CE..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

TARGET_USER="${SUDO_USER:-$(id -un)}"

${SUDO} dnf config-manager addrepo --from-repofile="https://download.docker.com/linux/fedora/docker-ce.repo" 2> "/dev/null" || true
${SUDO} dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

${SUDO} systemctl enable --now docker
${SUDO} usermod -aG docker "${TARGET_USER}"

echo "✅ [Fedora Docker]: Docker ativo e usuário '${TARGET_USER}' adicionado ao grupo docker!"
