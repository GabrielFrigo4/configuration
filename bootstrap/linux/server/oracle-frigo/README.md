# ☁️ Oracle Frigo Server — Catálogo de Receitas

> Receitas modulares e idempotentes para provisionar a instância de nuvem `oracle-frigo` na OCI.

---

## 🎯 Finalidade

Esta pasta organiza as configurações do servidor pessoal de cloud `oracle-frigo`:
- **`system/`**: Swap de 2GB e elevação de privilégios com `doas` (`0440`).
- **`security/`**: Regras de firewall para portas web (80, 443) e SSH (22).
- **`containers/`**: Configuração de Podman e Docker com linger de usuário.
- **`services/`**: Proxy reverso Caddy e serviços systemd (`resume`, `game`).
- **`connect/`**: Scripts de conexão SSH e SCP autenticados via Vault.

---

## 📂 Catálogo de Receitas

| Categoria | Receita | Descrição |
| :--- | :--- | :--- |
| **`system/`** | [`system/swap.sh`](system/swap.sh) | Alocação de swap de 2GB e `vm.swappiness=10` |
| **`system/`** | [`system/doas.sh`](system/doas.sh) | Setup do `doas` com `permit nopass :sudo` (0440) |
| **`security/`** | [`security/firewall.sh`](security/firewall.sh) | Regras de firewall para portas 22, 80 e 443 |
| **`containers/`** | [`containers/podman.sh`](containers/podman.sh) | Podman e Docker com ativação de linger |
| **`services/`** | [`services/caddy.sh`](services/caddy.sh) | Reverse proxy Caddy para domínios gabrielfrigo.dev.br |
| **`services/`** | [`services/resume.sh`](services/resume.sh) | Serviço systemd para a aplicação Resume |
| **`services/`** | [`services/game.sh`](services/game.sh) | Serviço systemd para o servidor Game |
| **`connect/`** | [`connect/ssh-frigo-server.sh`](connect/ssh-frigo-server.sh) | Conexão SSH usando credenciais do Vault |
| **`connect/`** | [`connect/scp-frigo-server.sh`](connect/scp-frigo-server.sh) | Transferência SCP usando credenciais do Vault |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Acesse a receita desejada e copie os comandos para executar no terminal do servidor.
