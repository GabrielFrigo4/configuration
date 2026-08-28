# 🪟 MSYS2 (UCRT64) — Catálogo de Receitas

> Receitas modulares e idempotentes para provisionar o ambiente UNIX nativo no Windows através do subsistema UCRT64 do MSYS2.

---

## 🎯 Finalidade

O MSYS2 provê ferramentas GNU/LLVM nativas para Windows sem a sobrecarga de virtualização do WSL. Esta pasta organiza a instalação de toolchains de compilação, linguagens, editores e bibliotecas de sistema em receitas atômicas.

---

## 📂 Catálogo de Receitas

| Categoria | Receita | Descrição |
| :--- | :--- | :--- |
| **`system/`** | [`system/base.sh`](system/base.sh) | Configuração do Bash (`*.ini`), coreutils e pacotes base |
| **`toolchains/`** | [`toolchains/gcc.sh`](toolchains/gcc.sh) | Toolchain GCC, Binutils, CMake, Ninja e Meson |
| **`toolchains/`** | [`toolchains/clang.sh`](toolchains/clang.sh) | Clang, LLVM, LLDB e ferramentas de análise estática |
| **`toolchains/`** | [`toolchains/embedded.sh`](toolchains/embedded.sh) | Toolchain AVR, Avrdude, NASM e ASM-LSP |
| **`languages/`** | [`languages/python.sh`](languages/python.sh) | Python 3, Pip, Uv e bibliotecas de automação |
| **`languages/`** | [`languages/rust.sh`](languages/rust.sh) | Rustup, toolchains stable e rust-analyzer |
| **`languages/`** | [`languages/lua.sh`](languages/lua.sh) | Lua, Luajit e módulos via Luarocks |
| **`tools/`** | [`tools/cli.sh`](tools/cli.sh) | Utilitários modernos (Ripgrep, FD, Bat, Eza, Fastfetch) |
| **`graphics/`** | [`graphics/gamedev.sh`](graphics/gamedev.sh) | SDL2, SDL3, Raylib, SFML, GLFW, Vulkan e OpenGL |
| **`graphics/`** | [`graphics/gui.sh`](graphics/gui.sh) | Frameworks de interface gráfica GTK3, GTK4, Qt5 e Qt6 |
| **`libraries/`** | [`libraries/system.sh`](libraries/system.sh) | Bibliotecas essenciais (OpenSSL, Zlib, LibUSB, Tree-Sitter) |
| **`editors/`** | [`editors/emacs.sh`](editors/emacs.sh) | Emacs UCRT64 e servidor de PDF |
| **`editors/`** | [`editors/micro.sh`](editors/micro.sh) | Editor Micro com tema Dracula |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Abra o terminal **MSYS2 UCRT64** e execute a receita desejada copiando seus comandos ou via `curl | sh`.
