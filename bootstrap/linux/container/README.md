# 📦 Linux Container — Containers de Sistema (Incus & LXC)

> Receitas e provisionamento de infraestrutura de containers de sistema no Linux.

---

## 🎯 Finalidade

Esta pasta fornece scripts de ativação para os daemons Incus e LXC, configurando isolamento leve de sistema operacional e mapeamento de subuids/subgids.

---

## 📂 Conteúdo

| Arquivo | Tipo | Descrição |
| :--- | :--- | :--- |
| [`incus.sh`](incus.sh) | Receita Shell | Ativa daemons do LXC e Incus, adiciona usuário ao grupo `incus-admin` e configura `subuid`/`subgid` |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Execute a receita `incus.sh` no terminal do Linux:
```sh
curl -fsSL https://raw.githubusercontent.com/GabrielFrigo4/Configuration/main/bootstrap/linux/container/incus.sh | sh
```
