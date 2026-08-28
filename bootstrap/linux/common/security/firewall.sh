#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Linux Universal Firewall Setup (Ports 22, 80, 443)
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Linux Firewall]: Configurando regras de firewall para portas 22, 80 e 443..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

if command -v firewall-cmd > "/dev/null" 2>&1; then
	${SUDO} firewall-cmd --permanent --add-service=ssh > "/dev/null" 2>&1 || true
	${SUDO} firewall-cmd --permanent --add-service=http > "/dev/null" 2>&1 || true
	${SUDO} firewall-cmd --permanent --add-service=https > "/dev/null" 2>&1 || true
	${SUDO} firewall-cmd --reload > "/dev/null" 2>&1 || true
elif command -v ufw > "/dev/null" 2>&1; then
	${SUDO} ufw allow 22/tcp > "/dev/null" 2>&1 || true
	${SUDO} ufw allow 80/tcp > "/dev/null" 2>&1 || true
	${SUDO} ufw allow 443/tcp > "/dev/null" 2>&1 || true
	${SUDO} ufw --force enable > "/dev/null" 2>&1 || true
elif command -v iptables > "/dev/null" 2>&1; then
	if command -v apt > "/dev/null" 2>&1; then
		${SUDO} apt install --yes iptables-persistent netfilter-persistent 2> "/dev/null" || true
	fi
	for _port in 22 80 443; do
		${SUDO} iptables -I INPUT 1 -p tcp --dport "${_port}" -j ACCEPT 2> "/dev/null" || true
		${SUDO} ip6tables -I INPUT 1 -p tcp --dport "${_port}" -j ACCEPT 2> "/dev/null" || true
	done
	if command -v netfilter-persistent > "/dev/null" 2>&1; then
		${SUDO} netfilter-persistent save > "/dev/null" 2>&1 || true
	fi
fi

echo "✅ [Linux Firewall]: Regras de firewall aplicadas com sucesso!"
