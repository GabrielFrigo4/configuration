#!/bin/sh

# Stop on Error
set -e

echo "======================================================"
echo "  Iniciando Microfone Virtual (Android -> FreeBSD)    "
echo "======================================================"

# 1. Verifica a interface USB
if ! ifconfig ue0 > /dev/null 2>&1; then
    echo "[ERRO] Interface ue0 não encontrada!"
    exit 1
fi

# 2. Descobre o IP do FreeBSD na rede da ancoragem USB
FREEBSD_IP="$(ifconfig ue0 | grep -w 'inet' | awk '{print $2}')"

if [ -z "${FREEBSD_IP}" ]; then
    echo "[ERRO] A interface ue0 está conectada, mas não tem IP."
    echo "Execute 'dhclient ue0' como root primeiro."
    exit 1
fi

echo "[1/3] Limpando rotas virtuais antigas..."
pactl unload-module module-virtual-source > /dev/null 2>&1 || true
pactl unload-module module-null-sink > /dev/null 2>&1 || true

echo "[2/3] Criando Microfone Virtual..."
# Cria um "ralo" de áudio invisível
pactl load-module module-null-sink sink_name=AndroidMic sink_properties=device.description="Microfone_Virtual" > /dev/null

# Cria o microfone a partir do ralo
pactl load-module module-virtual-source source_name=Virtual_Mic master=AndroidMic.monitor > /dev/null

echo "======================================================"
echo " TUDO PRONTO! "
echo " 1. Abra o app de transmissão RTP no Android."
echo " 2. Configure para enviar para: ${FREEBSD_IP}"
echo " 3. Porta: 5005"
echo " 4. Selecione 'Microfone_Virtual' no Firefox/Chromium/KDE"
echo "======================================================"
echo "[3/3] Pressione Ctrl+C para encerrar o microfone."
echo "Aguardando áudio na porta 5005..."

# Usa o mpv para capturar o stream RTP da porta 5005 e injetar DENTRO do Microfone Virtual
# Se você não tiver o mpv, instale com 'pkg install mpv'
mpv rtp://@:5005 --no-video --profile=low-latency --audio-device=pulse/AndroidMic
