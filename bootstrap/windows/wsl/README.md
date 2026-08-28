# 🧩 WSL (Windows Subsystem for Linux) — Catálogo de Receitas

> Receitas modulares e idempotentes para provisionar distribuições Linux dentro do WSL no Windows.

---

## 🎯 Finalidade

O WSL provê instâncias integradas do Linux executando sob o Hyper-V com aceleração gráfica WSLg. Esta pasta organiza a inicialização e provisionamento atômico para **Arch Linux** e **Debian**.

---

## 📂 Catálogo por Distribuição

### 🏹 Arch Linux (`arch-linux/`)

| Categoria | Receita | Descrição |
| :--- | :--- | :--- |
| **`system/`** | [`arch-linux/system/wsl.sh`](arch-linux/system/wsl.sh) | Usuário padrão, `/etc/wsl.conf`, sudoers, keyring e doas |
| **`tools/`** | [`arch-linux/tools/dev.sh`](arch-linux/tools/dev.sh) | Base-devel, Git, GitHub CLI, Zsh e utilitários CLI |
| **`containers/`** | [`arch-linux/containers/podman.sh`](arch-linux/containers/podman.sh) | Podman e Docker com ativação de serviço |

### 🍥 Debian (`debian/`)

| Categoria | Receita | Descrição |
| :--- | :--- | :--- |
| **`system/`** | [`debian/system/wsl.sh`](debian/system/wsl.sh) | Usuário padrão, `/etc/wsl.conf`, sudoers e doas |
| **`tools/`** | [`debian/tools/dev.sh`](debian/tools/dev.sh) | Build-essential, Git, GitHub CLI, Zsh e utilitários CLI |
| **`containers/`** | [`debian/containers/podman.sh`](debian/containers/podman.sh) | Podman e Docker com ativação de serviço |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Inicie a sua distribuição no WSL e copie os comandos da receita desejada diretamente no terminal.