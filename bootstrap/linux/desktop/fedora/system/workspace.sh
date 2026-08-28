#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Workspace Templates
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Fedora Workspace]: Criando modelos de documentos em ~/Modelos..."

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

echo "✅ [Fedora Workspace]: Modelos prontos no menu de contexto do GNOME!"
