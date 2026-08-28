# ⚙️ Universal Configuration & System Bootstrap

> Repositório central de provisionamento de sistema operacional, dotfiles estáticos de aplicativos de interface gráfica e configurações de estações de trabalho limpas.

---

### 🖥️ Sistemas Operacionais Suportados

![Linux](https://img.shields.io/badge/🐧_Linux_(Fedora_/_Arch_/_Debian)-Supported-blue)
![FreeBSD](https://img.shields.io/badge/😈_FreeBSD-Supported-red)
![Windows](https://img.shields.io/badge/🪟_Windows-Supported-purple)

### 🎨 Interfaces Gráficas Nativas (Host)

![GNOME](https://img.shields.io/badge/🔵_GNOME_(Fedora)-Wayland-blue)
![KDE Plasma](https://img.shields.io/badge/🟢_KDE_Plasma_(FreeBSD)-Wayland-green)

---

## 🧠 Filosofia e Princípios de Engenharia

Este repositório não é um amontoado caótico de dotfiles, mas a fundação arquitetural de uma estação de trabalho estrita e modular guiada pelos **17 Princípios UNIX** (*The Art of UNIX Programming*, 2003) e pelas práticas de **Clean Code**:

1. **"Clean Host" (Isolamento Extremo):** O sistema operacional nativo (o *host*) permanece o mais puro e leve possível. Ele provê apenas a interface gráfica (Wayland nativo via GNOME no Fedora ou KDE Plasma no FreeBSD), drivers de hardware, navegadores, editores de código e a camada de virtualização/hypervisor. Nenhum banco de dados ou ambiente de desenvolvimento de projeto polui o host.
2. **Modularidade da Tríade ("Uma coisa, um lugar"):**
   - **`Configuration`** (este repositório): Provisionamento estático do SO e dotfiles do host.
   - **[Shell](https://github.com/GabrielFrigo4/Shell)** (público): Comportamento interativo dinâmico, prompts, aliases e funções do terminal.
   - **[Vault](https://github.com/GabrielFrigo4/Vault)** (privado): Cofre seguro de chaves criptográficas, credenciais e variáveis sensíveis.
3. **Reprodutibilidade com ZFS & Idempotência:** Adoção de **ZFS** como fundação para snapshots instantâneos e replicação rápida, aliada a scripts de bootstrap que podem ser executados repetidamente com segurança.

> 📖 **Leituras Obrigatórias:**
> - [Princípios de Engenharia (PRINCIPLES.md)](PRINCIPLES.md) — Os 17 Princípios UNIX e Clean Code detalhados.
> - [Filosofia do Ecossistema (docs/PHILOSOPHY.md)](docs/PHILOSOPHY.md)
> - [Containers & Jails (docs/CONTAINERS.md)](docs/CONTAINERS.md)
> - [Hypervisors & ZVOLs (docs/HYPERVISORS.md)](docs/HYPERVISORS.md)

---

## 📂 Estrutura do Projeto

- **[`bootstrap/`](bootstrap/README.md)** — Provisionamento e catálogo modular de receitas por SO e contexto:
  - **`freebsd/`** — Workstation Desktop (KDE Plasma), Server KVM e Containers (Jails & Bastille).
  - **`linux/`** — Workstations Desktop (Fedora, Arch Linux, Debian), Servidores Cloud e Containers (Incus).
  - **`windows/`** — Desktop nativo (Winget, engenharia reversa), WSL2 e MSYS2 (UCRT64).
  - **`common/`** — Receitas agnósticas compartilhadas entre sistemas operacionais.
- **[`software/`](software/README.md)** — Configurações declarativas ("dotfiles") de softwares do host:
  - **`editors/`** — Helix, Neovim, Vim, Emacs, VS Code, VSCodium, Zed e Antigravity.
  - **`terminals/`** — Konsole (KDE), Windows Terminal, CMD (Clink), PowerShell e NuShell.
  - **`tools/`** — Formatadores e linters globais (`.clang-format`, `.prettierrc`, `.stylua.toml`, `clangd.yaml`).
  - **`vcs/`** — Configurações de controle de versão (Git e Got).
- **[`scripts/`](scripts/README.md)** — Scripts utilitários de compilação local (build), conversão de arquivos e modificações de registro do Windows.
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
