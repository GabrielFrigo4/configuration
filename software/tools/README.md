# 🛠️ Tools & Linters

Configurações declarativas de formatadores, linters e LSP do sistema.

---

## 📁 Arquivos e Destinos

| Arquivo | Ferramenta | Destino (Linux / FreeBSD) | Destino (Windows) |
| :--- | :--- | :--- | :--- |
| **`clangd.yaml`** | Clangd (LSP C/C++) | `~/.config/clangd/config.yaml` | `%LOCALAPPDATA%\clangd\config.yaml` |
| **`.clang-format`** | Clang Format | `~/.clang-format` | `%USERPROFILE%\.clang-format` |
| **`.prettierrc`** | Prettier (JS/TS/HTML/CSS) | `~/.prettierrc` | `%USERPROFILE%\.prettierrc` |
| **`.stylua.toml`** | StyLua (Lua) | `~/.stylua.toml` | `%USERPROFILE%\.stylua.toml` |
| **`mermaid-puppeteer.json`** | Mermaid CLI (Puppeteer) | `~/.mermaid-puppeteer-config.json` | `%USERPROFILE%\.mermaid-puppeteer-config.json` |
| **`mermaid-theme.json`** | Mermaid CLI (Tema) | `~/.mermaid-theme-config.json` | `%USERPROFILE%\.mermaid-theme-config.json` |

---

## 📐 Regras Globais de Estilo

Todas as ferramentas estão padronizadas para respeitar as mesmas diretrizes:

- **Limite de Colunas:** 96 caracteres
- **Hard Tabs (4):** Go, Assembly, Makefiles
- **Soft Tabs (2 espaços):** JS, TS, HTML, CSS, JSON, Lua, YAML
- **Soft Tabs (4 espaços):** C, C++, Rust, Python, Java

---

## 📜 Princípios e Padrões Obrigatórios

Conforme definido em [`../../PRINCIPLES.md`](../../PRINCIPLES.md):

1. **Permissões em 4 Dígitos:** Configurações nesta pasta devem manter permissão estrita `chmod 0644`.
2. **Aderência ao Padrão XDG:** Sempre que a ferramenta suportar `$XDG_CONFIG_HOME`, os arquivos devem viver em `~/.config/`.
3. **Idempotência de Instalação:** Use links simbólicos (`ln -sf`) para que atualizações no repositório reflitam instantaneamente sem duplicação de arquivos.

---

## 🚀 Instalação Rápida (Idempotente)

### 🐧 Linux / 😈 FreeBSD
```sh
mkdir -p "${HOME}/.config/clangd"
ln -sf "$(pwd)/clangd.yaml" "${HOME}/.config/clangd/config.yaml"
ln -sf "$(pwd)/.clang-format" "${HOME}/.clang-format"
ln -sf "$(pwd)/.prettierrc" "${HOME}/.prettierrc"
ln -sf "$(pwd)/.stylua.toml" "${HOME}/.stylua.toml"
ln -sf "$(pwd)/mermaid-puppeteer.json" "${HOME}/.mermaid-puppeteer-config.json"
ln -sf "$(pwd)/mermaid-theme.json" "${HOME}/.mermaid-theme-config.json"
```

### 🪟 Windows
```cmd
mkdir "%LOCALAPPDATA%\clangd" 2>nul
copy /Y clangd.yaml "%LOCALAPPDATA%\clangd\config.yaml"
copy /Y .clang-format "%USERPROFILE%\.clang-format"
copy /Y .prettierrc "%USERPROFILE%\.prettierrc"
copy /Y .stylua.toml "%USERPROFILE%\.stylua.toml"
copy /Y mermaid-puppeteer.json "%USERPROFILE%\.mermaid-puppeteer-config.json"
copy /Y mermaid-theme.json "%USERPROFILE%\.mermaid-theme-config.json"
```
