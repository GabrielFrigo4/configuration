#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Google Antigravity IDE & CLI
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora Antigravity]: Instalando Antigravity IDE & CLI..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

if ! command -v antigravity > "/dev/null" 2>&1; then
	curl -fsSL https://antigravity.google/cli/install.sh | bash
fi

if [ -f "/opt/antigravity/antigravity-ide" ]; then
	${SUDO} ln -sf "/opt/antigravity/antigravity-ide" "/usr/local/bin/antigravity"
	${SUDO} ln -sf "/opt/antigravity/antigravity-ide" "/usr/local/bin/antigravity-ide"

	cat << "EOF" | ${SUDO} tee "/usr/share/applications/antigravity.desktop" > "/dev/null"
[Desktop Entry]
Name=Antigravity IDE
Comment=Antigravity IDE
Exec=/opt/antigravity/antigravity-ide %U
Terminal=false
Type=Application
Icon=/opt/antigravity/resources/app/resources/linux/code.png
Categories=Development;IDE;
StartupWMClass=antigravity-ide
MimeType=x-scheme-handler/antigravity;
EOF
fi

echo "✅ [Fedora Antigravity]: Antigravity configurado com sucesso!"
