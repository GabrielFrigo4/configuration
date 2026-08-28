# 📦 FreeBSD Container — Jails & BastilleBSD

> Receitas para provisionamento do subsistema de FreeBSD Jails e automação com Bastille.

---

## 🎯 Finalidade

Esta pasta organiza a ativação de containers leves no FreeBSD através do subsistema nativo de Jails e do gerenciador BastilleBSD.

---

## 📂 Catálogo de Receitas

| Receita | Tipo | Descrição |
| :--- | :--- | :--- |
| [`jails.sh`](jails.sh) | Receita Shell | Ativação do subsistema nativo de FreeBSD Jails no `rc.conf` e criação de `/usr/jails` |
| [`bastille.sh`](bastille.sh) | Receita Shell | Instalação e ativação do gerenciador de templates BastilleBSD |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Execute a receita desejada copiando o link RAW para o terminal:
```sh
fetch -o - https://raw.githubusercontent.com/GabrielFrigo4/Configuration/main/bootstrap/freebsd/container/jails.sh | sh
```
