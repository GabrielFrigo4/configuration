#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Debian Code Editors & Launchers
# ------------------------------------------------------------------------------
set -eu

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} apt install -y mg micro neovim vim emacs geany

mkdir -p "${HOME}/.local/bin"

cat << 'EOF' | tee "${HOME}/.local/bin/hx" > "/dev/null"
#!/usr/bin/sh
/usr/bin/hx "$@"
echo -e -n "\x1b[\x30 q"
EOF
chmod 0755 "${HOME}/.local/bin/hx"

flatpak install -y flathub com.visualstudio.code 2> "/dev/null" || true

cat << 'EOF' | tee "${HOME}/.local/bin/code" > "/dev/null"
#!/usr/bin/sh
flatpak run com.visualstudio.code "$@"
EOF
chmod 0755 "${HOME}/.local/bin/code"

cat << 'EOF' | tee "${HOME}/.local/bin/geany" > "/dev/null"
#!/usr/bin/sh
GTK_THEME=Adwaita:dark /usr/bin/geany "$@"
EOF
chmod 0755 "${HOME}/.local/bin/geany"

${SUDO} mkdir -p "/etc/apt/keyrings"
curl -fsSL "https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg" | \
	${SUDO} gpg --dearmor --yes -o "/etc/apt/keyrings/antigravity-repo-key.gpg" 2> "/dev/null" || true
echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | \
	${SUDO} tee "/etc/apt/sources.list.d/antigravity.list" > "/dev/null"

${SUDO} apt update 2> "/dev/null" || true
${SUDO} apt install -y antigravity 2> "/dev/null" || true
