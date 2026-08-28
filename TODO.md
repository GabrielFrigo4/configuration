# 📋 Roadmap & Planos Futuros (TODO)

Este documento centraliza o progresso arquitetural e as próximas evoluções planejadas para o repositório **Configuration**.

Todas as ações aqui descritas são guiadas pela nossa filosofia principal: atingir um **"Clean Host"** puramente funcional, com desenvolvimento 100% isolado em **Containers/Jails/Hypervisors**, e garantir a total modularidade dos nossos 3 pilares (**Configuration**, **Shell**, **Vault**).

---

## 🎯 Concluído Recentemente

- [x] **Unificação e Padronização Filosófica:** Criação formal de `PRINCIPLES.md` com os 17 princípios UNIX (*The Art of UNIX Programming*, 2003), regras de Clean Code e padrão absoluto de shebang (`#!/usr/bin/env sh`) e permissões em 4 dígitos (`0755`/`0644`/`0700`/`0600`/`0440`).
- [x] **Modelo Cookbook & Fim dos Scripts Monolíticos:** Quebra dos antigos `windows.cmd` (726 linhas) e `freebsd/desktop/setup.sh` (246 linhas) em receitas atômicas e categorizadas (`system/`, `desktop/`, `containers/`, `security/`, `tools/`, `apps/`).
- [x] **Preservação de Ferramental Artesanal:** Suite de Engenharia Reversa (Ghidra, Horsicq, x64dbg, FASM, ROPgadget), leitor de ePub Arianna e roteamento de áudio RTP para Android.
- [x] **Sincronização Total da Documentação (`docs/`):** Atualização de toda a documentação para refletir a matriz dual (**Fedora GNOME** + **FreeBSD KDE Plasma**), o modelo Cookbook (Zero-Clone) e caminhos atuais.
- [x] **Correção Cirúrgica de Portabilidade no Shell e Vault:** Remoção de bashisms (`&>`), preservação de `>|` para compatibilidade com `noclobber`, e correção do bug de 32 recursões no CMD do Windows.

---

## 🚀 Próximas Prioridades

### 1. Auditoria dos Editores no Windows CMD
- [ ] Revisar scripts de instalação em `software/editors/*/install-*.cmd` no ambiente nativo Windows (Prompt de Comando) para assegurar compatibilidade sem dependências de bash/sh.
- [ ] Testar compatibilidade de perfis do Helix e Neovim em caminhos Windows (`%APPDATA%` / `%LOCALAPPDATA%`).

### 2. Integração com ZFS Snapshots no Bootstrap
- [ ] Adicionar checagem opcional nas receitas que detecte se o sistema roda em pool ZFS e tire um snapshot automático antes de alterações de sistema (ex: `zfs snapshot zroot/ROOT/default@pre-setup`).
