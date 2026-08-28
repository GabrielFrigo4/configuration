# 🖥️ Windows Desktop — Ferramentas Nativas & Engenharia Reversa

> Receitas modulares e automações focadas em desenvolvimento nativo, análise de binários e pacotes no Windows.

---

## 🎯 Finalidade

Reúne o ferramental nativo para estações de trabalho Windows:
- **Suite de Engenharia Reversa:** Ferramental curado portátil (Ghidra, XPEViewer, XELFViewer, x64dbg plugins, FASM Suite, ROPgadget).
- **Ferramentas de Desenvolvimento:** Pacotes oficiais e compiladores (Visual Studio Community, Build Tools, Windows Terminal, PowerToys).
- **Gerenciadores de Pacotes:** Scripts de automação para Winget, Scoop e Chocolatey.
- **Configurações:** Fontes, atalhos e módulos PowerShell.

---

## 📂 Catálogo Categorizado

| Subdiretório / Arquivo | Tipo | Descrição |
| :--- | :--- | :--- |
| [`security/ghidra.cmd`](security/ghidra.cmd) | Script Batch CMD | Instalação automatizada do Ghidra SRE (NSA) portátil |
| [`security/binaries.cmd`](security/binaries.cmd) | Script Batch CMD | Utilitários de análise de binários (XPEViewer, XELFViewer, etc.) |
| [`security/debuggers.cmd`](security/debuggers.cmd) | Script Batch CMD | Instalação e plugins do x64dbg Plugin Manager |
| [`security/assemblers.cmd`](security/assemblers.cmd) | Script Batch CMD | Flat Assembler Suite (FASM, FASMG, FASMARM) |
| [`security/ropgadget.cmd`](security/ropgadget.cmd) | Script Batch CMD | Wrapper para chamadas do ROPgadget no Prompt de Comando |
| [`tools/dev-tools.cmd`](tools/dev-tools.cmd) | Script Batch CMD | Visual Studio Community, Windows Terminal, PowerToys e Sysinternals |
| [`editors/editor-themes.cmd`](editors/editor-themes.cmd) | Script Batch CMD | Temas One Dark (Geany), Dracula (Micro) e Vim-Plug |
| [`pkg/winget.cmd`](pkg/winget.cmd) | Script Batch CMD | Instalação curada de softwares essenciais via Windows Package Manager |
| [`pkg/scoop.cmd`](pkg/scoop.cmd) | Script Batch CMD | Setup do Scoop com buckets `extras` e utilitários de linha de comando |
| [`pkg/choco.cmd`](pkg/choco.cmd) | Script Batch CMD | Setup do Chocolatey |
| [`config/modules.ps1`](config/modules.ps1) | Script PowerShell | Módulos para PowerShell |
| [`config/shortcuts.ps1`](config/shortcuts.ps1) | Script PowerShell | Atalhos de inicialização rápida |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Abra o arquivo desejado no GitHub e copie os blocos de comandos diretamente em um terminal com privilégios de Administrador.
