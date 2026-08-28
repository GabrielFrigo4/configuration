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

- [ ] **Auditoria Periódica de Monólitos & Nanos:** Executar a suite de auditoria antes de grandes modificações:
    - `python3 scripts/audit/monoliths.py` (teto: 100 linhas por script).
    - `python3 scripts/audit/nanos.py` (piso: 15 linhas para scripts isolados).
- [ ] **Formatação Global de Documentação (Prettier):** Rodar `prettier --write "**/*.md"` para assegurar que todos os markdowns respeitem a largura de 96 colunas e estilo uniforme.
- [ ] **Conformidade Octal em 4 Dígitos:** Garantir que novos arquivos recebam permissões explícitas (`0755` para executáveis, `0644` para dotfiles/configs e `0440` para arquivos de elevação).
- [ ] **Validação Estrita de Sintaxe POSIX:** Rodar varredura com `sh -n` em 100% dos scripts `.sh` antes de qualquer commit.

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
