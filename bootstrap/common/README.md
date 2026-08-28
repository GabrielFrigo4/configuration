# 🌐 Bootstrap Common (Multiplataforma) — Catálogo de Receitas

> Receitas modulares e universais compartilhadas entre Linux, FreeBSD e Windows.

---

## 🎯 Finalidade

Esta pasta abriga configurações que são **100% agnósticas de distribuição**, com implementações equivalentes tanto para sistemas UNIX (`.sh`) quanto para Windows (`.cmd` / `.ps1`).

---

## 📂 Catálogo de Recursos

| Recurso | Receita | Plataforma | Descrição |
| :--- | :--- | :--- | :--- |
| **`editors/`** | [`editors/editors.sh`](editors/editors.sh) | Linux / FreeBSD | Clona ou atualiza perfis pessoais de editores (Emacs, Neovim, Vim, Helix, Micro) |
| **`editors/`** | [`editors/editors.cmd`](editors/editors.cmd) | Windows | Clona ou atualiza perfis pessoais de editores no Windows |
| **`fonts/`** | [`fonts/fonts.sh`](fonts/fonts.sh) | Linux / FreeBSD | Baixa e instala fontes essenciais (JetBrainsMono, RobotoMono, MesloLGS NF) |
| **`fonts/`** | [`fonts/fonts.ps1`](fonts/fonts.ps1) | Windows | Baixa e instala fontes essenciais (Carlito, JetBrainsMono, RobotoMono, MesloLGS NF) |
| **`linters/`** | [`linters/linters.sh`](linters/linters.sh) | Linux / FreeBSD | Implanta configurações de linters globais (clangd, clang-format, prettier, stylua) |
| **`linters/`** | [`linters/linters.cmd`](linters/linters.cmd) | Windows | Implanta configurações de linters globais no Windows |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Execute qualquer receita diretamente via terminal sem necessidade de clonar o repositório:

### Em sistemas UNIX (Linux / FreeBSD):
```sh
curl -fsSL https://raw.githubusercontent.com/GabrielFrigo4/Configuration/main/bootstrap/common/fonts/fonts.sh | sh
```

### No Windows (PowerShell / Prompt de Comando):
```powershell
irm https://raw.githubusercontent.com/GabrielFrigo4/Configuration/main/bootstrap/common/fonts/fonts.ps1 | iex
```
