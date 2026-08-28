#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Debian Code Editors Package Installation
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Debian Editors]: Instalando editores de código via apt e flatpak..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} apt install --yes mg micro neovim vim emacs geany

if command -v flatpak > "/dev/null" 2>&1; then
	flatpak install --assumeyes flathub com.visualstudio.code 2> "/dev/null" || true
fi

${SUDO} mkdir -p "/etc/apt/keyrings"
curl -fsSL "https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg" | \
	${SUDO} gpg --dearmor --yes -o "/etc/apt/keyrings/antigravity-repo-key.gpg" 2> "/dev/null" || true
echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | \
	${SUDO} tee "/etc/apt/sources.list.d/antigravity.list" > "/dev/null"

${SUDO} apt update 2> "/dev/null" || true
${SUDO} apt install --yes antigravity 2> "/dev/null" || true

echo "✅ [Debian Editors]: Editores instalados com sucesso!"
