#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Debian Desktop Applications & Browsers
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Debian Apps]: Instalando navegadores e aplicativos desktop..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} mkdir -p "/usr/share/keyrings"

if [ ! -f "/etc/apt/sources.list.d/google-chrome.list" ]; then
	curl -fsSL "https://dl.google.com/linux/linux_signing_key.pub" | \
		${SUDO} gpg --dearmor --yes -o "/usr/share/keyrings/google-chrome.gpg" 2> "/dev/null" || true
	echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | \
		${SUDO} tee "/etc/apt/sources.list.d/google-chrome.list" > "/dev/null"
fi

if [ ! -f "/etc/apt/sources.list.d/microsoft-edge.list" ]; then
	curl -fsSL "https://packages.microsoft.com/keys/microsoft.asc" | \
		${SUDO} gpg --dearmor --yes -o "/usr/share/keyrings/microsoft-edge.gpg" 2> "/dev/null" || true
	echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-edge.gpg] https://packages.microsoft.com/repos/edge stable main" | \
		${SUDO} tee "/etc/apt/sources.list.d/microsoft-edge.list" > "/dev/null"
fi

${SUDO} apt update 2> "/dev/null" || true
${SUDO} apt install -y google-chrome-stable microsoft-edge-stable 2> "/dev/null" || true

if command -v flatpak > "/dev/null" 2>&1; then
	flatpak install -y flathub \
		io.github.shiftey.Desktop \
		org.onlyoffice.desktopeditors \
		org.pgadmin.pgadmin4 2> "/dev/null" || true
fi

echo "✅ [Debian Apps]: Aplicativos instalados com sucesso!"
