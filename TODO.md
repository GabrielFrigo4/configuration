# 📋 Roadmap & Governança da Nova Era (TODO)

> Registro de diretrizes, metas evolutivas e governança contínua do repositório **Configuration**.

---

## 🎯 Status Atual: Estado da Arte (100% Concluído)

A transição arquitetural do repositório foi concluída com sucesso absoluto. O ecossistema opera sob perfeita simetria entre **Linux**, **FreeBSD** e **Windows**, adesão aos **17 Princípios UNIX** e às **13 Regras de Clean Code** do [`PRINCIPLES.md`](PRINCIPLES.md).

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
