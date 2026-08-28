# ☁️ Oracle Orbs Server — Catálogo de Receitas

> Receitas modulares e idempotentes para provisionar a instância de nuvem `oracle-orbs` na OCI.

---

## 🎯 Finalidade

Esta pasta organiza as configurações do servidor de nuvem `oracle-orbs`:
- **`system/`**: Swap de 2GB e privilégios com `doas` (`0440`).
- **`security/`**: Regras de firewall para portas 80, 443 e 22.
- **`containers/`**: Configuração de Podman e Docker com linger de usuário.
- **`services/`**: Proxy reverso Caddy e serviço systemd do container `catalogo`.
- **`connect/`**: Scripts de conexão SSH e SCP autenticados via Vault.

---

## 📂 Catálogo de Receitas

| Categoria | Receita | Descrição |
| :--- | :--- | :--- |
| **`system/`** | [`system/swap.sh`](system/swap.sh) | Alocação de swap de 2GB e `vm.swappiness=10` |
| **`system/`** | [`system/doas.sh`](system/doas.sh) | Setup do `doas` com `permit nopass :sudo` (0440) |
| **`security/`** | [`security/firewall.sh`](security/firewall.sh) | Regras de firewall para portas 22, 80 e 443 |
| **`containers/`** | [`containers/podman.sh`](containers/podman.sh) | Podman e Docker com ativação de linger |
| **`services/`** | [`services/caddy.sh`](services/caddy.sh) | Reverse proxy Caddy para domínios orbs.gabrielfrigo.dev.br |
| **`services/`** | [`services/catalogo.sh`](services/catalogo.sh) | Serviço systemd e rede Podman para o Catalogo |
| **`connect/`** | [`connect/ssh-orbs-server.sh`](connect/ssh-orbs-server.sh) | Conexão SSH usando credenciais do Vault |
| **`connect/`** | [`connect/scp-orbs-server.sh`](connect/scp-orbs-server.sh) | Transferência SCP usando credenciais do Vault |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Acesse a receita desejada e copie os comandos para executar no terminal do servidor.
