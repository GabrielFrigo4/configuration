# 😈 FreeBSD — Catálogo de Receitas (Cookbook)

> Diretório raiz de provisionamento para o sistema operacional FreeBSD, organizado por contexto operacional.

---

## 🎯 Finalidade

Reúne o ferramental de provisionamento para FreeBSD seguindo a especificação POSIX e o `/bin/sh` nativo, dividido por contexto:
- **`desktop/`**: Estação de trabalho pessoal com interface KDE Plasma 6 Wayland, aceleração de áudio, rede e ports.
- **`server/`**: Máquina virtual servidora FreeBSD sob KVM/QEMU com QEMU Guest Agent e scripts de conexão.
- **`container/`**: Subsistema nativo de FreeBSD Jails e automação BastilleBSD.

---

## 📂 Contextos Operacionais

| Contexto | Tipo | Descrição |
| :--- | :--- | :--- |
| [`desktop/`](desktop/README.md) | Estação de Trabalho | Ambiente KDE Plasma, dispositivos de áudio/vídeo, Wi-Fi e ferramentas |
| [`server/`](server/README.md) | Servidor em VM | Guest Agent para KVM, privilégios doas e scripts dinâmicos SSH/SCP |
| [`container/`](container/README.md) | Containers de Sistema | Subsistema nativo de Jails e orquestrador BastilleBSD |

---

## 🚀 Como Navegar

Para acessar as receitas da estação de trabalho gráfica, navegue até [`desktop/`](desktop/README.md).
