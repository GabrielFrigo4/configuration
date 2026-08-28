# 🌐 FreeBSD Common — Catálogo de Receitas Universais

> Receitas base compartilhadas entre todos os ambientes FreeBSD (Desktop KDE, Servidor KVM, Jails & Bastille).

---

## 🎯 Finalidade

Esta pasta centraliza as configurações essenciais do FreeBSD que independem de interface gráfica ou contexto de servidor: elevação de privilégios (`doas`), parâmetros de kernel e utilitários modernos de terminal.

---

## 📂 Catálogo de Receitas

| Recurso       | Receita                                | Descrição                                                                                       |
| :------------ | :------------------------------------- | :---------------------------------------------------------------------------------------------- |
| **`system/`** | [`system/doas.sh`](system/doas.sh)     | Configura `doas.conf` e `sudoers.d/wheel` com permissões `0440`                                 |
| **`system/`** | [`system/sysctl.sh`](system/sysctl.sh) | Desativa core dumps e aplica parâmetros recomendados no `/etc/sysctl.conf`                      |
| **`tools/`**  | [`tools/cli.sh`](tools/cli.sh)         | Instala utilitários CLI modernos (`eza`, `bat`, `ripgrep`, `fd-find`, `git`, `gh`, `fastfetch`) |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Execute qualquer receita diretamente via terminal no FreeBSD:

```sh
# Configurar doas
curl -fsSL https://raw.githubusercontent.com/GabrielFrigo4/Configuration/main/bootstrap/freebsd/common/system/doas.sh | sh

# Instalar utilitários CLI
curl -fsSL https://raw.githubusercontent.com/GabrielFrigo4/Configuration/main/bootstrap/freebsd/common/tools/cli.sh | sh
```
