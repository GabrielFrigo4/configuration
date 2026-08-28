#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Fedora Base System, Filesystems & Workspace Initialization
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora Base]: Configurando sistema base, filesystems e workspace..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

# Suporte a sistemas de arquivos remotos
${SUDO} dnf install -y fuse-sshfs

# Desativação de daemons de firmware redundantes
${SUDO} systemctl mask --now fwupd fwupd.socket 2> "/dev/null" || true
${SUDO} rm -rf /var/cache/fwupd/

# Modelos de novos documentos para o menu de contexto do GNOME
MODELOS_DIR="${HOME}/Modelos"
mkdir -p "${MODELOS_DIR}"

touch "${MODELOS_DIR}/Empty"
touch "${MODELOS_DIR}/Text.txt"
touch "${MODELOS_DIR}/Markdown.md"

cat << 'EOF' > "${MODELOS_DIR}/Shell.sh"
#!/usr/bin/env sh
set -eu

EOF
chmod 0755 "${MODELOS_DIR}/Shell.sh"

echo "✅ [Fedora Base]: Sistema base configurado com sucesso!"
