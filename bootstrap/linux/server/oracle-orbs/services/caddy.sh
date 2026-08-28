#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Oracle Orbs Caddy Web Server & Reverse Proxy
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Orbs Server]: Configurando servidor web Caddy..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} apt install -y debian-keyring debian-archive-keyring apt-transport-https curl

if [ ! -f "/etc/apt/sources.list.d/caddy-stable.list" ]; then
	curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | ${SUDO} gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
	curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | ${SUDO} tee /etc/apt/sources.list.d/caddy-stable.list > "/dev/null"
	${SUDO} apt update
fi

${SUDO} apt install -y caddy

cat << 'EOF' | ${SUDO} tee "/etc/caddy/Caddyfile" > "/dev/null"
orbs.gabrielfrigo.dev.br, shop.gabrielfrigo.dev.br {
	reverse_proxy [::1]:35440
}
EOF

${SUDO} systemctl restart caddy

echo "✅ [Orbs Server]: Caddy configurado e ativo!"
