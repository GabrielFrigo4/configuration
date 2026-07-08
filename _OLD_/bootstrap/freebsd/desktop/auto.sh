#!/usr/bin/env sh

if [ "$(id -u)" -ne 0 ]; then
    echo "Erro: Este script precisa ser executado como root."
    echo "Tente rodar: sudo ./setup.sh"
    exit 1
fi

echo "=================================================================="
echo "=== ATUALIZANDO REPOSITÓRIOS DO FREEBSD ==="
echo "=================================================================="
pkg update --force

echo "=================================================================="
echo "=== INSTALANDO DEPENDÊNCIAS DO SCRIPT ==="
echo "=================================================================="
echo "- ydotool: Simulador de teclado em nível de kernel (Wayland)"
echo "- ImageMagick7: Fallback caso o img2pdf falhe"
echo "- py311-img2pdf: Conversor super rápido de imagens para PDF"
echo "- py311-ocrmypdf: Motor principal de OCR"
echo "- tesseract-data: Pacote mestre de idiomas para o OCR"
echo "------------------------------------------------------------------"

pkg install --yes ydotool ImageMagick7 py311-img2pdf py311-ocrmypdf tesseract-data

echo "=================================================================="
echo "=== SETUP CONCLUÍDO COM SUCESSO! ==="
echo "=================================================================="
