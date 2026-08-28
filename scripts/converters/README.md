# 🔄 Converters & File Processors

> Scripts utilitários para conversão de quebras de linha (CRLF ⟷ LF) e geração em lote de PDFs a partir de Markdown.

---

## 🎯 Finalidade

Esta pasta centraliza ferramentas para sanear e converter formatos de arquivos entre diferentes sistemas operacionais:
- **dos2unix / unix2dos:** Conversão pura de quebras de linha (`\r\n` ⟷ `\n`) sem depender da instalação de pacotes externos no sistema.
- **md2pdf:** Conversão recursiva em lote de diretórios Markdown para PDFs tipograficamente elegantes via Pandoc e WeasyPrint.

---

## 📂 Catálogo de Arquivos

| Arquivo | Tipo | Descrição |
| :--- | :--- | :--- |
| [`dos2unix.sh`](dos2unix.sh) | Script Shell POSIX | Remove carriage returns (`\r`) de arquivos de texto no Linux/FreeBSD |
| [`dos2unix.ps1`](dos2unix.ps1) | PowerShell | Equivalente PowerShell para converter CRLF em LF no Windows |
| [`unix2dos.sh`](unix2dos.sh) | Script Shell POSIX | Adiciona carriage returns (`\r`) para compatibilidade clássica com Windows |
| [`unix2dos.ps1`](unix2dos.ps1) | PowerShell | Equivalente PowerShell para converter LF em CRLF |
| [`md2pdf.sh`](md2pdf.sh) | Script Shell POSIX | Percorre pastas e converte arquivos `.md` em `.pdf` preservando estrutura |
| [`md2pdf.ps1`](md2pdf.ps1) | PowerShell | Versão PowerShell do conversor Markdown para PDF |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

### Conversão de Quebras de Linha
```sh
# No terminal Linux/FreeBSD:
sh scripts/converters/dos2unix.sh meu_arquivo.sh
```

### Markdown para PDF
```sh
# Converte todos os arquivos .md dentro da pasta docs/:
sh scripts/converters/md2pdf.sh ./docs
```
