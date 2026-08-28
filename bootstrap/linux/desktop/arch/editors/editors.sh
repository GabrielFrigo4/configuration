#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Arch Linux Code Editors & Launchers
# ------------------------------------------------------------------------------
set -eu

yay -S --needed --noconfirm mg micro helix neovim vim emacs geany

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
