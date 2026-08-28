# 😈 FreeBSD Server (KVM / QEMU Guest) — Catálogo de Receitas

> Receitas modulares e idempotentes para provisionar a máquina virtual FreeBSD Server em execução sob KVM/QEMU.

---

## 🎯 Finalidade

Organiza a configuração da VM servidora FreeBSD: agente de integração QEMU, privilégios `doas` (`0440`), gerenciamento de Jails com Bastille e ferramentas de linha de comando.

---

## 📂 Catálogo de Receitas

| Categoria | Receita | Descrição |
| :--- | :--- | :--- |
| **`system/`** | [`system/guest.sh`](system/guest.sh) | QEMU Guest Agent, doas, sudoers e console Spleen |
| **`tools/`** | [`tools/base.sh`](tools/base.sh) | Shells (Bash, Zsh), Git, GitHub CLI e Mandoc |
| **`connect/`** | [`connect/ssh-freebsd-server.sh`](connect/ssh-freebsd-server.sh) | Conexão SSH via detecção dinâmica de IP do `virsh` |
| **`connect/`** | [`connect/scp-freebsd-server.sh`](connect/scp-freebsd-server.sh) | Cópia SCP via detecção dinâmica de IP do `virsh` |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Inicie a VM FreeBSD (`freebsd-start`) e conecte-se com `ssh-freebsd-server.sh`. Copie e execute as receitas desejadas no terminal da VM.
