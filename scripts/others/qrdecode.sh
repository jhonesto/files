#!/bin/bash
# Script para converter o QR code em texto

# Verifique se o programa qrencode está instalado
command -v qrencode >/dev/null 2>&1 || { echo >&2 "Esse script requer o programa qrencode.  Por favor, instale-o primeiro antes de continuar."; exit 1; }

# Solicitar ao usuário a inserção do código QR
echo Por favor, insira o texto para gerar um QR Code.
read qrcode

# Codificar o código QR para texto
qrencode -t UTF8 "$qrcode"
