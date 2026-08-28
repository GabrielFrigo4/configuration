# ☁️ Servidores Linux em Nuvem (Oracle Cloud)

> Provisionamento e scripts de conexão para servidores VPS na Oracle Cloud Infrastructure (OCI).

---

## 🎯 Finalidade

Reúne receitas atômicas para configurar instâncias remotas na nuvem (Oracle Cloud Free Tier / Ubuntu Server) e ferramentas de conveniência para transferência de arquivos (SCP) e acesso remoto (SSH) integradas ao [Vault](../../../../Vault).

---

## 📂 Catálogo de Servidores

| Servidor | Tipo | Descrição |
| :--- | :--- | :--- |
| [`oracle-frigo/`](oracle-frigo/README.md) | Subdiretório | Servidor pessoal: Swap, Caddy, Resume, Game e conexão SSH/SCP |
| [`oracle-orbs/`](oracle-orbs/README.md) | Subdiretório | Servidor comercial: Swap, Caddy, container Catalogo e conexão SSH/SCP |

---

## 🔒 Segurança & Chaves

Os scripts de conexão nesta pasta consomem automaticamente as variáveis (`FRIGO_SERVER_*` e `ORBS_SERVER_*`) e chaves criptográficas armazenadas no [Vault](../../../../Vault). Nenhuma chave SSH ou senha reside neste repositório.
