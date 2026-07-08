#!/bin/sh

# Stop on Error
set -e

# Check Privileges
if [ "$(id -u)" != "0" ]; then
    printf "Erro: Execute como root.\n"
    exit 1
fi

echo "======================================================"
echo "  Iniciando Roteamento de Áudio (FreeBSD -> Android)  "
echo "======================================================"

# 1. Verifica se o celular está conectado e com a ancoragem ativa
if ! ifconfig ue0 > "/dev/null" 2>&1; then
    echo "[ERRO] Interface ue0 não encontrada!"
    echo "Verifique se o cabo USB está conectado e a Ancoragem USB ativada."
    exit 1
fi

# 2. Pede um IP para o celular silenciosamente
echo "[1/4] Negociando conexão via cabo USB..."
dhclient ue0 > "/dev/null" 2>&1

# 3. Descobre o IP do Android (Ele é o servidor DHCP da rede)
# Pegamos a última anotação de IP que o dhclient salvou no sistema
PHONE_IP="$(grep 'dhcp-server-identifier' "/var/db/dhclient.leases.ue0" 2> "/dev/null" | tail -1 | awk '{print $3}' | tr -d ';')"

if [ -z "${PHONE_IP}" ]; then
    echo "[ERRO] Não foi possível encontrar o IP do celular."
    exit 1
fi

echo "[2/4] Celular detectado no IP: ${PHONE_IP}"

# 4. Limpa transmissões antigas (Evita que o som duplique se rodar o script 2x)
echo "[3/4] Limpando rotas de áudio antigas..."
pactl unload-module module-rtp-send > "/dev/null" 2>&1

# 5. Cria a nova rota de áudio RTP
echo "[4/4] Redirecionando áudio do sistema para o celular..."
pactl load-module module-rtp-send source=oss_output.dsp0.monitor destination_ip=${PHONE_IP} port=5004 > "/dev/null"

echo "======================================================"
echo " TUDO PRONTO! "
echo " Abra o VLC no Android e inicie a transmissão em:"
echo " rtp://@:5004"
echo "======================================================"
