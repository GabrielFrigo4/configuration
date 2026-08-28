# 📋 Roadmap & Governança da Nova Era (TODO)

> Registro de diretrizes, metas evolutivas e governança contínua do repositório **Configuration**.

---

## 🎯 Status Atual: Estado da Arte (100% Concluído)

A transição arquitetural do repositório foi concluída com sucesso absoluto. O ecossistema opera sob perfeita simetria entre **Linux**, **FreeBSD** e **Windows**, adesão aos **17 Princípios UNIX** e às **14 Regras de Clean Code** do [`PRINCIPLES.md`](PRINCIPLES.md).

O antigo backlog de refatoração foi completamente quitado. As seções abaixo estabelecem os temas e prioridades para a manutenção e evolução contínua da nova era.

---

## 🛡️ Tema 1: Governança, Qualidade & Auditoria Contínua

> **Prioridade:** 🔴 Alta (Manutenção Preventiva)  
> **Objetivo:** Garantir que o repositório nunca regrida em complexidade, duplicações de código, monólitos ou formatações inconsistentes.

- [x] **Suite de Auditoria e Qualidade Contínua:** Executar `python3 scripts/audit/all.py` para validar 100% das regras:
    - `python3 scripts/audit/monoliths.py` (teto: 128 linhas por script).
    - `python3 scripts/audit/nanos.py` (piso: 16 linhas para scripts isolados).
    - `python3 scripts/audit/syntax.py` (validação POSIX `sh -n`, shebangs e modo defensivo).
    - `python3 scripts/audit/links.py` (integridade de 100% dos links Markdown).
    - `python3 scripts/audit/formats.py` (JSON, JSONC, YAML multi-doc, PS1 e REG).

---

## 🧪 Tema 2: Integração Contínua & Testes Automatizados (CI/CD)

> **Prioridade:** 🟡 Média (Evolução de Engenharia)  
> **Objetivo:** Estabelecer pipelines automatizados para validar receitas e formatação em ambientes limpos descartáveis (GitHub Actions).

- [ ] **GitHub Actions — Prettier & Markdown Linter:** Configurar pipeline de CI para validar a formatação de todos os arquivos Markdown (`prettier --check "**/*.md"`).
- [ ] **GitHub Actions — Syntax & Audit Pipeline:** Executar automaticamente `sh -n`, `shellcheck` e a suite `scripts/audit/` a cada commit ou Pull Request.
- [ ] **Container Smoke Testing:** Pipeline para testar a execução das receitas universais (`bootstrap/linux/common/` e `bootstrap/linux/container/`) em containers Podman/Incus efêmeros.
- [ ] **Validação de Links RAW:** Teste automatizado para verificar se todas as URLs `raw.githubusercontent.com` em `README.md` e scripts retornam HTTP 200.

---

## 🌐 Tema 3: Expansão de Nuvem & Novos Ambientes

> **Prioridade:** 🟢 Baixa (Sob Demanda)  
> **Objetivo:** Adicionar novos provedores de nuvem, servidores e containers especializados conforme surgirem novos projetos.

- [ ] **Magalu Cloud (Rocky Linux 9 / DNF):** Receita dedicada de provisionamento em `bootstrap/linux/server/magalu/` quando a infraestrutura for instanciada.
- [ ] **Templates de Containers de IA & Data Science:** Receitas de container Podman com suporte a GPU/ROCm/CUDA encapsuladas para isolamento no host.
- [ ] **Novas Toolchains MSYS2:** Adicionar pacotes específicos de novas linguagens (ex: Zig, Nim) em `bootstrap/windows/msys2/toolchains.sh` sob demanda.

---

## 📜 Tema 4: Sincronização da Tríade de Produtividade

> **Prioridade:** 🟢 Baixa (Sincronização Contínua)  
> **Objetivo:** Manter as fronteiras e documentações alinhadas com a evolução dos outros 2 repositórios da Tríade.

- [ ] **Sincronização com o repositório `Shell`:** Garantir que perfis de Konsole, Windows Terminal e variáveis XDG reflitam os aliases e loaders do ecossistema Shell.
- [ ] **Sincronização com o repositório `Vault`:** Garantir que o script universal `connect.sh` consuma as chaves e hosts privados conforme atualizados no cofre.

---

## 🔄 Tema 5: Sincronização Híbrida de Dotfiles & Skills (RAW vs. Symlink Dinâmico)

> **Prioridade:** 🟡 Média (Evolução de Produtividade & IA)  
> **Objetivo:** Aprimorar scripts de implantação de dotfiles (`software/tools/`, editores) e skills portáteis para suportar inteligência de ambiente com modos dinâmico (symlink) e estático (cópia/RAW).

- [ ] **Dual-Mode Sync para Linters e Formatadores (`bootstrap/common/linters/linters.sh`):**
    - **Modo RAW / Zero-Clone:** Download e cópia estática via `curl` de `raw.githubusercontent.com` quando executado via pipe na web (`curl | sh`).
    - **Modo Local (Symlink Dinâmico):** Quando executado a partir do repositório clonado localmente, permitir criar links simbólicos atômicos (`ln -sf`), garantindo que edições no repositório ou `git pull` atualizem imediatamente os formatadores globais (`~/.clang-format`, `~/.prettierrc`, etc.) sem necessidade de reexecução.
    - **Modo Local (Cópia Estática):** Suporte a flag `--copy` para congelar uma cópia pontual independente de links.
- [ ] **Script de Provisionamento de Skills Portáteis (`bootstrap/common/skills/sync-skills.sh`):**
    - Criar receita universal para vincular as skills de `skills/` para o escopo global (`~/.gemini/config/skills/`) ou local de projeto (`.agents/skills/`).
    - Suportar modo dinâmico (`--symlink` como padrão quando clonado) e modo estático (`--copy` / download RAW).

---

## 🏛️ Tema 6: Visão de Futuro — A Evolução para o "Quarteto de Produtividade" (Santo Graal)

> **Prioridade:** 🔵 Futura / Arquitetura Estratégica (O "Santo Graal")  
> **Objetivo:** Elevar o desacoplamento da Tríade de Produtividade para um **Quarteto Canônico**, separando definitivamente o provisionamento ativo de sistema (`Setup`) das configurações declarativas de usuário (`Configuration`).

```text
🏛️ O QUARTETO DE PRODUTIVIDADE
├── 1. Setup         (Público | Nível SO / Root)    ➔ Provisionamento ativo, pacotes, drivers, containers, receitas de bootstrap.
├── 2. Configuration (Público | Nível $HOME / IA)   ➔ Dotfiles declarativos, editores, terminais, linters e skills de IA.
├── 3. Shell         (Público | Linha de Comando)   ➔ Motor interativo de terminal, prompts rápidos, aliases, bibliotecas POSIX.
└── 4. Vault         (Privado | Cofre Criptográfico) ➔ Chaves SSH, senhas, tokens, hosts e variáveis de ambiente sensíveis.
```

- [ ] **Desacoplamento de Papéis (`Setup` = Zero-Clone Web / `Config` = Residente Local):**
    - **`Setup` (GitHub-First / Cookbook / Zero-Clone):** Repositório de receitas atômicas de SO para provisionamento ativo (`curl | sh`), pensado para viver no GitHub e ser consumido sob demanda sem necessidade de clone contínuo.
    - **`Config` (Residente / Single Source of Truth no `$HOME`):** Repositório clonado localmente (ao lado do `Vault` e do `Shell`) que serve como a fonte única de verdade para sincronizar dotfiles, formatadores, editores e skills de IA através de links simbólicos e atualizações via `git pull`.
- [ ] **Definição Canônica dos Locais e Modelos de Instalação do Quarteto:**
    - **`Setup`:** Efêmero / Web-First / CLI de provisionamento com privilégios de sistema (`root`/`admin`).
    - **`Shell`:** `/usr/local/share/shell` (nível de sistema, consumido por todos os usuários e pelo `root`).
    - **`Vault`:** `~/.vault` (residente no `$HOME`, cofre privado `0700`/`0600`).
    - **`Config`:** `~/.config/configuration` ou `~/.configuration` (residente no `$HOME`, zero sudo, symlinks dinâmicos).
- [ ] **Atualização Arquitetural da Documentação:**
    - Atualizar diagramas Mermaid em `docs/ARCHITECTURE.md` e `docs/PHILOSOPHY.md` para formalizar a transição da Tríade para o Quarteto.
    - Sincronizar scripts de inicialização rápida (`bootstrap.sh` / `setup.sh`) consumindo os 4 repositórios em cadeia com separação estrita de privilégios.


