# ⚙️ Universal Configuration & System Bootstrap

> Repositório central de provisionamento de sistema operacional, dotfiles estáticos de aplicativos de interface gráfica e configurações de estações de trabalho limpas.

---

### 🖥️ Sistemas Operacionais Suportados

![Linux](https://img.shields.io/badge/🐧_Linux_%28Fedora_/_Arch_/_Debian%29-Supported-blue)
![FreeBSD](https://img.shields.io/badge/😈_FreeBSD-Supported-red)
![Windows](https://img.shields.io/badge/🪟_Windows-Supported-purple)

### 🎨 Interfaces Gráficas Nativas (Host)

![GNOME](https://img.shields.io/badge/🔵_GNOME_%28Fedora%29-Wayland-blue)
![KDE Plasma](https://img.shields.io/badge/🟢_KDE_Plasma_%28FreeBSD%29-Wayland-green)

---

## 🧠 Filosofia e Princípios de Engenharia

Este repositório não é um amontoado caótico de dotfiles, mas a fundação arquitetural de uma estação de trabalho estrita e modular guiada pelos **17 Princípios UNIX** (_The Art of UNIX Programming_, 2003) e pelas práticas de **Clean Code**:

1. **"Clean Host" (Isolamento Extremo):** O sistema operacional nativo (o _host_) permanece o mais puro e leve possível. Ele provê apenas a interface gráfica (Wayland nativo via GNOME no Fedora ou KDE Plasma no FreeBSD), drivers de hardware, navegadores, editores de código e a camada de virtualização/hypervisor. Nenhum banco de dados ou ambiente de desenvolvimento de projeto polui o host.
2. **Modularidade da Tríade ("Uma coisa, um lugar"):**
    - **`Configuration`** (este repositório): Provisionamento estático do SO e dotfiles do host.
    - **[Shell](https://github.com/GabrielFrigo4/Shell)** (público): Comportamento interativo dinâmico, prompts, aliases e funções do terminal.
    - **[Vault](https://github.com/GabrielFrigo4/Vault)** (privado): Cofre seguro de chaves criptográficas, credenciais e variáveis sensíveis.
3. **Reprodutibilidade com ZFS & Idempotência:** Adoção de **ZFS** como fundação para snapshots instantâneos e replicação rápida, aliada a scripts de bootstrap que podem ser executados repetidamente com segurança.

> 📖 **Leituras Obrigatórias:**
>
> - [Princípios de Engenharia (PRINCIPLES.md)](PRINCIPLES.md) — Os 17 Princípios UNIX e Clean Code detalhados.
> - [Filosofia do Ecossistema (docs/PHILOSOPHY.md)](docs/PHILOSOPHY.md)
> - [Containers & Jails (docs/CONTAINERS.md)](docs/CONTAINERS.md)
> - [Hypervisors & ZVOLs (docs/HYPERVISORS.md)](docs/HYPERVISORS.md)

---

## 📂 Estrutura do Projeto

- **[`bootstrap/`](bootstrap/README.md)** — **Provisionamento e Automação de Sistema (O "COMO"):** Catálogo modular de receitas (`.sh`, `.cmd` e `.ps1`) com privilégios de sistema para instalar pacotes, drivers, containers e serviços:
    - **`freebsd/`** — Infraestrutura base (`common/`), Containers (Jails & Bastille), Workstation Desktop (KDE Plasma) e Server KVM.
    - **`linux/`** — Infraestrutura base (`common/`), Containers (Incus & Podman), Workstations Desktop (Fedora, Arch, Debian), Servidores Cloud e WSL2 (`wsl/`).
    - **`windows/`** — Ferramentas nativas (`native/`) e subsistema MSYS2 (`msys2/` UCRT64).
    - **`common/`** — Receitas universais multiplataforma compartilhadas entre Linux, FreeBSD e Windows (fontes, linters, editores, vcs).
- **[`software/`](software/README.md)** — **Dotfiles e Configurações Declarativas de Usuário (O "O QUÊ"):** Arquivos estáticos puros (`.json`, `.toml`, `.yaml`, `.profile`) no espaço do usuário (`$HOME`):
    - **`editors/`** — Antigravity, VS Code, VSCodium, Zed, Emacs (`lite.el`) e Vim (`lite.vim`).
    - **`terminals/`** — Konsole (KDE), Windows Terminal, CMD (Clink), PowerShell e NuShell.
    - **`tools/`** — Formatadores e linters globais (`.clang-format`, `.prettierrc`, `.stylua.toml`, `clangd.yaml`).
    - **`browsers/`** — Ajustes de navegadores no host (Firefox).
- **[`skills/`](skills/README.md)** — **Habilidades & Runbooks Portáteis para IA (O "COMO OPERAR"):** Catálogo modular de skills e procedimentos para agentes de IA (Google Antigravity, Gemini, OpenAI, Claude) com ativação sob demanda via `.agents/skills/`.
- **[`scripts/`](scripts/README.md)** — Utilitários pontuais de compilação local (build), conversão de arquivos e modificações de registro do Windows.
- **[`docs/`](docs/README.md)** — Documentação técnica abrangente da estação de trabalho.

---

## 🚀 Como Usar: O Modelo "Cookbook" (Zero Dependência de Clone)

Diferente do **Vault** (que você clona privadamente) ou do **Shell** (que você clona e faz source contínuo), o **Configuration** foi concebido como um **Catálogo de Receitas Modular**:

1. **Acesso Direto pelo GitHub:** Não é necessário clonar este repositório para utilizá-lo. Navegue pelos arquivos diretamente na interface web do GitHub.
2. **Cópia e Cola / Download Pontual:** Quando precisar de uma configuração de editor ou formatador, baixe ou copie os arquivos declarativos puros (`.json`, `.toml`, `.yaml`) de [`software/`](software/README.md).
3. **Receitas Autônomas de Sistema:** Quando estiver provisionando ou ajustando um software no Fedora, FreeBSD ou Windows, execute a receita específica correspondente em [`bootstrap/`](bootstrap/README.md).

---

## 📜 Princípios e Contratos

Consulte [`PRINCIPLES.md`](PRINCIPLES.md) para conhecer os 17 princípios UNIX, diretrizes Clean Code, permissões canônicas em 4 dígitos (`0755`/`0644`/`0440`) e o Template Canônico de Receitas.
