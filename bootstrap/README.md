# 📖 Bootstrap & Catálogo de Receitas (Cookbook)

Esta pasta é o **Livro de Receitas (Cookbook)** do sistema operacional. Diferente do [Vault](../../Vault) ou do [Shell](../../Shell), este repositório **não foi feito para ser clonado e acoplado ao seu sistema**, mas sim consumido diretamente pelo **GitHub** (via navegador, cópia e cola ou execução pontual).

Não usamos scripts monolíticos que tentam instalar 50 coisas de uma vez. Cada arquivo aqui é uma **receita autônoma, modular e idempotente**, focada em um único software ou configuração.

---

## 📂 Organização por Família de SO & Contexto

A estrutura do `bootstrap` é dividida por sistema operacional e categorizada pelos contextos operacionais (`desktop`, `server`, `container`, `wsl`):

### 😈 [FreeBSD](freebsd/README.md)
- **[`desktop/`](freebsd/desktop/README.md):** Estação de trabalho com interface KDE Plasma 6 Wayland, aceleração de áudio, rede e ports.
- **[`server/`](freebsd/server/README.md):** Máquina virtual servidora FreeBSD sob KVM/QEMU com QEMU Guest Agent e scripts de conexão.
- **[`container/`](freebsd/container/README.md):** Subsistema nativo de FreeBSD Jails e automação BastilleBSD.

---

### 🐧 [Linux](linux/README.md)
- **[`desktop/`](linux/desktop/README.md):** Distribuições para estações de trabalho gráficas:
  - [`fedora/`](linux/desktop/fedora/README.md): Estação de trabalho primária (GNOME Wayland).
  - [`arch/`](linux/desktop/arch/README.md): Ambiente modular de experimentação e desenvolvimento avançado.
  - [`debian/`](linux/desktop/debian/README.md): Estação clássica de estabilidade.
- **[`server/`](linux/server/README.md):** Servidores remotos na Oracle Cloud (`oracle-frigo`, `oracle-orbs`).
- **[`container/`](linux/container/README.md):** Containers de sistema via Incus e LXC.

---

### 🪟 [Windows](windows/README.md)
- **[`desktop/`](windows/desktop/README.md):** Ferramentas nativas do Windows (pacotes Winget/Scoop, engenharia reversa, editores e módulos).
- **[`wsl/`](windows/wsl/README.md):** Distribuições Linux (Arch Linux e Debian) executando via WSL2.
- **[`msys2/`](windows/msys2/README.md):** Subsistema UNIX nativo UCRT64 (toolchains GCC, Clang e bibliotecas sem virtualização).

---

### 🌐 [Common](common/README.md)
- Receitas multiplataforma agnósticas compartilhadas entre Linux, FreeBSD e Windows (editores, fontes e linters).

---

## 📜 O Template Canônico de Receitas (`RECIPE TEMPLATE`)

Para criar ou editar scripts mantendo a consistência do ecossistema, use o cabeçalho minimalista de 3 linhas:

```sh
#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: [Nome do Software / Funcionalidade]
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Nome]: Iniciando configuração..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

# Execução atômica e idempotente

echo "✅ [Nome]: Configurado com sucesso!"
```
