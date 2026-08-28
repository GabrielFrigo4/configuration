# 🌿 Sistemas de Controle de Versão (VCS)

> Configurações globais e boas práticas para ferramentas de controle de versão no host.

---

## 🎯 Finalidade

Centraliza dotfiles e automações mínimas para as ferramentas de controle de versão utilizadas no ecossistema:
- **Git:** O padrão universal da indústria para repositórios locais e remotos (GitHub).
- **Game of Trees (Got):** O sistema de controle de versão nativo do ecossistema BSD (OpenBSD/FreeBSD), projetado para operação minimalista e segura.

Ambos os scripts foram desenhados para **consumir automaticamente** os dados de autor (`GIT_AUTHOR_NAME` e `GIT_AUTHOR_EMAIL`) exportados pelo [Vault](../../../Vault), mantendo as credenciais pessoais fora do repositório público.

---

## 📂 Catálogo de Arquivos

| Arquivo | Tipo | Descrição |
| :--- | :--- | :--- |
| [`git/git.sh`](git/git.sh) | Script Shell POSIX | Aplica configs globais do Git (`init.defaultBranch main`, `pull.rebase false`, `autocrlf input`) |
| [`git/git.cmd`](git/git.cmd) | Script Batch CMD | Configurações equivalentes do Git para ambiente Windows nativo |
| [`got/got.sh`](got/got.sh) | Script Shell POSIX | Gera o arquivo `~/.gotconfig` para autenticação com dados do Vault no FreeBSD |
| [`got/got.cmd`](got/got.cmd) | Script Batch CMD | Configurações do Got para Windows/MSYS2 |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Se precisar reaplicar ou consultar as configurações do Git em uma máquina limpa:

```sh
# Execução direta via terminal:
curl -fsSL https://raw.githubusercontent.com/GabrielFrigo4/Configuration/main/software/vcs/git/git.sh | sh
```

Ou simplesmente copie os blocos de comando diretamente do arquivo [`git/git.sh`](git/git.sh) para o seu terminal.
