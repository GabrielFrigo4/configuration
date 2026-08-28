# 🍥 Debian — Catálogo de Receitas

> Receitas modulares e idempotentes para provisionar estações de trabalho rodando Debian GNU/Linux.

---

## 🎯 Finalidade

Organiza a configuração do Debian em módulos atômicos: repositórios non-free, doas (`0440`), drivers proprietários Nvidia, Flatpak, containers de sistema, editores e utilitários.

---

## 📂 Catálogo de Receitas

| Categoria | Receita | Descrição |
| :--- | :--- | :--- |
| **`system/`** | [`system/base.sh`](system/base.sh) | Repositórios non-free, usuário sudo e doas |
| **`desktop/`** | [`desktop/drivers.sh`](desktop/drivers.sh) | Mesa, Nvidia proprietary drivers e firmwares |
| **`desktop/`** | [`desktop/flatpak.sh`](desktop/flatpak.sh) | Flatpak e integração com Flathub |
| **`containers/`** | [`containers/incus.sh`](containers/incus.sh) | LXC, Incus socket e subuid/subgid |
| **`containers/`** | [`containers/podman.sh`](containers/podman.sh) | Podman e Docker com ativação de serviço |
| **`tools/`** | [`tools/cli.sh`](tools/cli.sh) | Utilitários essenciais de build e CLI |
| **`editors/`** | [`editors/editors.sh`](editors/editors.sh) | Editores de texto gráficos e de terminal |
| **`apps/`** | [`apps/desktop.sh`](apps/desktop.sh) | Navegadores e ferramentas de comunicação |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Copie os comandos da receita desejada e execute no terminal do Debian.
