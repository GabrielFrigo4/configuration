# 🐧 Fedora Workstation — Catálogo de Receitas (Cookbook)

> Receitas atômicas, modulares e idempotentes para a estação de trabalho Fedora com GNOME Wayland puro.

---

## 🎯 Finalidade

Esta pasta concentra o provisionamento da estação de trabalho primária Linux (Fedora Workstation). Cada script atua como uma receita independente para configurar aspectos visuais do GNOME, aceleradores de hardware, gerenciadores de containers (Podman e Incus) ou ferramentas de linha de comando.

Todas as receitas são idempotentes e podem ser reexecutadas sem causar efeitos colaterais.

---

## 📂 Catálogo Categorizado de Receitas

| Categoria | Receita | Descrição |
| :--- | :--- | :--- |
| **`desktop/`** | [`desktop/gnome.sh`](desktop/gnome.sh) | Tema Adwaita escuro, botões da janela (`:minimize,maximize,close`) e atalhos (`Super + T`, `Super + A`) |
| **`desktop/`** | [`desktop/fonts.sh`](desktop/fonts.sh) | Instalação e mapeamento métrico das fontes Carlito e Caladea em `fonts.conf` |
| **`containers/`** | [`containers/podman.sh`](containers/podman.sh) | Engine Podman daemonless e rootless com compatibilidade OCI |
| **`containers/`** | [`containers/incus.sh`](containers/incus.sh) | Gerenciador moderno de containers de sistema e máquinas virtuais Incus |
| **`containers/`** | [`containers/docker.sh`](containers/docker.sh) | Repositório oficial do Docker CE (contingência legada) |
| **`security/`** | [`security/wireshark.sh`](security/wireshark.sh) | Wireshark nativo com adição do usuário ao grupo `wireshark` |
| **`system/`** | [`system/uefi.sh`](system/uefi.sh) | Mascaramento de serviços `fwupd` para economia de bateria e alertas UEFI |
| **`system/`** | [`system/filesystem.sh`](system/filesystem.sh) | Drivers FUSE e suporte a SSHFS |
| **`system/`** | [`system/workspace.sh`](system/workspace.sh) | Modelos de novos arquivos no menu de contexto do GNOME (`~/Modelos`) |
| **`tools/`** | [`tools/antigravity.sh`](tools/antigravity.sh) | Instalação do Antigravity IDE & CLI com lançador `.desktop` |
| **`tools/`** | [`tools/tui.sh`](tools/tui.sh) | Bibliotecas gráficas de terminal FTXUI e Notcurses |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Execute qualquer receita individualmente via terminal ou copie o bloco desejado diretamente pelo navegador:

```sh
# Exemplo: Aplicar atalhos e tema escuro no GNOME
curl -fsSL https://raw.githubusercontent.com/GabrielFrigo4/Configuration/main/bootstrap/linux/fedora/desktop/gnome.sh | sh
```
