# 💻 Software (Dotfiles & Configurações de Aplicativos)

Esta pasta reúne as configurações declarativas e os "dotfiles" para as aplicações de interface gráfica e utilitários que rodam diretamente no *Host*.

Seguindo nossos princípios de Clean Code e UNIX ([`../PRINCIPLES.md`](../PRINCIPLES.md)), mantemos as configurações estáticas puras em seus formatos originais (JSON, TOML, YAML), sem acoplamento com gerenciadores complexos de dotfiles.

---

## 📂 O Que Encontrar Aqui

- **[`editors/`](editors/README.md)**: Configurações (`settings.json`, perfis) e scripts de setup para Neovim, Vim, Helix, Emacs, VS Code, VSCodium, Zed e Antigravity.
- **[`browsers/`](browsers/firefox/README.md)**: Ajustes essenciais de navegadores no Host (Mozilla Firefox, aceleração Wayland e clipboard assíncrono).
- **[`terminals/`](terminals/README.md)**: Perfis gráficos para emuladores de terminal (Konsole do KDE, Windows Terminal, CMD com Clink, PowerShell e NuShell).
- **[`tools/`](tools/README.md)**: Configurações declarativas de formatação e LSP essenciais que rodam no host (`.clang-format`, `.prettierrc`, `.stylua.toml`, `clangd.yaml`, configs Mermaid).
- **`vcs/`**: Configurações de controle de versão (Git e Game of Trees - Got).
- **[`external.md`](external.md)**: Catálogo de softwares externos recomendados, utilitários manuais e ferramentas da Microsoft Store.

---

## 🚫 O Que NÃO Deve Ficar Aqui

- **Comportamento Dinâmico de Shell**: Scripts de inicialização interativa (`.zshrc`, `.bashrc`, aliases, prompts). Estes pertencem exclusivamente ao repositório **[Shell](https://github.com/GabrielFrigo4/Shell)**.
- **Segredos e Credenciais**: Chaves SSH, senhas de redes Wi-Fi, credenciais e tokens. Estes pertencem exclusivamente ao repositório privado **[Vault](https://github.com/GabrielFrigo4/Vault)**.
- **Ambientes Pesados de Linguagens de Programação**: Node.js, Python virtualenvs, Rust toolchains de projetos específicos não poluem o host. Eles devem ser isolados em Containers ou Jails.

---

## 📜 Princípios e Padrões Obrigatórios da Camada de Software

Conforme estabelecido em [`../PRINCIPLES.md`](../PRINCIPLES.md), as configurações desta pasta seguem:

1. **Permissões em 4 Dígitos Octais:** Utilize SEMPRE notação de 4 dígitos em comandos `chmod`: `chmod 0755` para diretórios e scripts executáveis de instalação, e `chmod 0644` para arquivos de configuração declarativos (`.json`, `.toml`, `.yaml`, `.profile`).
2. **Shebang Padrão Absoluto (`#!/usr/bin/env sh`):** Qualquer script de instalação ou linkagem deve usar obrigatoriamente `#!/usr/bin/env sh`.
3. **Aderência ao Padrão XDG Base Directory:** Configurações de ferramentas do usuário devem residir em `~/.config/` (ou `%LOCALAPPDATA%` no Windows).
4. **Idempotência com Links Simbólicos:** Prefira symlinks atômicos (`ln -sf`) em vez de cópias manuais para dotfiles de uso contínuo.
5. **Configurações Puristas e Declarativas:** Arquivos devem ser mantidos legíveis e sem complexidade de automação desnecessária. Evitamos gerenciadores externos pesados de dotfiles.
