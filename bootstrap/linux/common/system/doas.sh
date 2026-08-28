#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Linux Universal Doas Privilege Escalation Setup
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Linux Doas]: Configurando elevação de privilégios com doas..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

if command -v dnf > "/dev/null" 2>&1; then
	${SUDO} dnf install --assumeyes opendoas
	TARGET_GROUP="wheel"
elif command -v apt > "/dev/null" 2>&1; then
	${SUDO} apt update 2> "/dev/null" || true
	${SUDO} apt install --yes doas
	TARGET_GROUP="sudo"
elif command -v pacman > "/dev/null" 2>&1; then
	${SUDO} pacman -S --needed --noconfirm opendoas
	TARGET_GROUP="wheel"
else
	echo "⚠️ [Linux Doas]: Gerenciador de pacotes não suportado automaticamente."
	TARGET_GROUP="wheel"
fi

cat << EOF | ${SUDO} tee "/etc/doas.conf" > "/dev/null"
permit persist :${TARGET_GROUP}
EOF
${SUDO} chmod 0440 "/etc/doas.conf"

echo "✅ [Linux Doas]: doas configurado com sucesso para o grupo '${TARGET_GROUP}' (0440)!"
