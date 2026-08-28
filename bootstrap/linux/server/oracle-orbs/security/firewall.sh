#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Oracle Orbs Firewall Rules
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Orbs Server]: Configurando regras de firewall (portas 22, 80, 443)..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

${SUDO} apt install -y iptables-persistent netfilter-persistent

for _port in 22 80 443; do
	${SUDO} iptables -I INPUT 6 -m state --state NEW -p tcp --dport "${_port}" -j ACCEPT 2> "/dev/null" || true
	${SUDO} ip6tables -I INPUT 1 -p tcp --dport "${_port}" -j ACCEPT 2> "/dev/null" || true
done

${SUDO} netfilter-persistent save > "/dev/null" 2>&1 || true

echo "✅ [Orbs Server]: Firewall configurado com sucesso!"
