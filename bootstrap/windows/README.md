# 🪟 Windows — Ferramentas Nativas, WSL & MSYS2

> Diretório raiz de provisionamento para o sistema operacional Windows, organizado por contexto operacional.

---

## 🎯 Finalidade

Reúne o ferramental de provisionamento para Windows, organizado por contexto de uso:
- **`desktop/`**: Ferramentas nativas do Windows (pacotes, engenharia reversa, editores, temas, fontes e módulos).
- **`wsl/`**: Distribuições Linux (Arch Linux e Debian) executando via Windows Subsystem for Linux (WSL2).
- **`msys2/`**: Subsistema UNIX nativo UCRT64 (toolchains GCC, Clang, linguagens e bibliotecas sem virtualização).

---

## 📂 Contextos Operacionais

| Contexto | Tipo | Descrição |
| :--- | :--- | :--- |
| [`desktop/`](desktop/README.md) | Ferramentas Nativas | Pacotes via Winget/Scoop, suite de engenharia reversa, temas e módulos |
| [`wsl/`](wsl/README.md) | Subsistema WSL2 | Instâncias Arch Linux e Debian provisionadas de forma atômica |
| [`msys2/`](msys2/README.md) | Subsistema UCRT64 | Toolchains de compilação GNU/LLVM e bibliotecas nativas de desenvolvimento |

---

## 🚀 Como Navegar

Para acessar as ferramentas nativas de desenvolvimento e segurança no Windows, acesse [`desktop/`](desktop/README.md).
