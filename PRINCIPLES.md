# 📜 Princípios de Engenharia & Filosofia do Repositório (Configuration)

> *"Rule of Separation: Separate policy from mechanism; separate engine from interface."*  
> — Eric S. Raymond, *The Art of UNIX Programming* (2003)

Este repositório é a fundação estática da **Tríade de Produtividade** (`Configuration`, `Shell`, `Vault`). Ele é responsável pelo provisionamento do sistema operacional (host limpo), configurações declarativas de editores e ferramentas de interface gráfica, e documentação arquitetural.

Para garantir longevidade, previsibilidade e excelência técnica, toda contribuição e alteração neste repositório deve obedecer aos **17 Princípios UNIX**, às práticas de **Clean Code** adaptadas a scripts de infraestrutura e dotfiles, e às diretrizes modernas do ecossistema.

---

## 🏛️ Os 17 Princípios UNIX (*The Art of UNIX Programming*, 2003)

### 1. Regra da Modularidade (*Rule of Modularity*)
> *Escreva partes simples conectadas por interfaces limpas.*
- O repositório é estritamente desacoplado do `Shell` (comportamento ativo) e do `Vault` (segredos).
- A pasta `software/editors/` contém submódulos independentes (Neovim, Helix, VS Code). Instalar ou reconfigurar um editor nunca afeta os outros.
- O provisionamento de SO em `bootstrap/` é quebrado em passos modulares (rede, fontes, containers, desktop).

### 2. Regra da Clareza (*Rule of Clarity*)
> *Clareza é melhor que esperteza.*
- Scripts de bootstrap e configuração priorizam legibilidade absoluta sobre "one-liners" crípticos ou truques de regex obscuros.
- Nomes de variáveis são autoexplicativos (`TARGET_CONFIG_DIR`, `BACKUP_TIMESTAMP`).
- Comandos não convencionais devem ser documentados com comentários explicando o *porquê*, não apenas o *o quê*.

### 3. Regra da Composição (*Rule of Composition*)
> *Projete programas para serem conectados a outros programas.*
- Nossos scripts de utilitários em `scripts/` (ex: conversores de documentos ou formatadores) recebem dados via argumentos padrão ou `stdin` e geram saída limpa para `stdout`, permitindo pipelines Unix (`|`).
- Scripts de bootstrap podem ser encadeados ou orquestrados por um `setup.sh` mestre.

### 4. Regra da Separação (*Rule of Separation*)
> *Separe a política do mecanismo; separe o motor da interface.*
- **Mecanismo:** Scripts de instalação em `bootstrap/` ou `software/` que sabem *como* baixar, compilar e registrar ferramentas.
- **Política:** Arquivos declarativos (`settings.json`, `.clang-format`, `.stylua.toml`) que definem *o que* deve ser configurado. O mecanismo nunca embute configurações hardcoded que deveriam estar no arquivo de política.

### 5. Regra da Simplicidade (*Rule of Simplicity*)
> *Projete para a simplicidade; adicione complexidade apenas onde estritamente necessário.*
- **Clean Host (Santuário):** O sistema operacional hospedeiro permanece mínimo. Não instalamos runtimes pesados (Node, Python, Ruby, bancos de dados) no host; desenvolvimento vive em Containers (Docker/Podman/LXC) ou Jails (FreeBSD).
- Evitamos gerenciadores de dotfiles pesados ou dependências externas desnecessárias (como GNU Stow ou frameworks complexos); configurações simples permanecem arquivos estáticos diretos.

### 6. Regra da Parcimônia (*Rule of Parsimony*)
> *Escreva um programa grande apenas quando estiver claro por demonstração que nada mais resolverá.*
- Se um comando nativo do gerenciador de pacotes (`dnf install`, `pkg install`, `winget install`) resolve o problema, não criamos wrappers complexos em torno dele.
- Mantenha cada script enxuto e direto ao ponto.

### 7. Regra da Transparência (*Rule of Transparency*)
> *Projete para a visibilidade para tornar inspeção e depuração fáceis.*
- Todas as configurações de editores e ferramentas usam formatos em texto legíveis por humanos (JSON, TOML, YAML, shell scripts limpos).
- Scripts de bootstrap exibem exatamente quais etapas estão executando, com mensagens sem ruído excessivo mas informativas o bastante para auditoria imediata.

### 8. Regra da Robustez (*Rule of Robustness*)
> *A robustez é filha da transparência e da simplicidade.*
- Antes de tentar instalar pacotes ou aplicar configurações, os scripts validam pré-requisitos (`command -v`, variáveis de ambiente necessárias, conexões ativas).
- Uso extensivo do **ZFS** para garantir snapshots automáticos antes de mudanças críticas no sistema, garantindo recuperação instantânea.

### 9. Regra da Representação (*Rule of Representation*)
> *Dobre o conhecimento em dados para que a lógica do programa possa ser estúpida e robusta.*
- Preferir listas declarativas de pacotes ou mapeamentos chave-valor em vez de blocos gigantescos de `if/else` procedural.
- Modificar uma configuração deve ser tão simples quanto adicionar uma linha a uma lista de dados.

### 10. Regra do Menor Espanto (*Rule of Least Surprise*)
> *No design de interfaces, sempre faça a coisa menos surpreendente.*
- Seguir estritamente os caminhos convencionais do ecossistema Unix:
  - Dotfiles vão para o padrão **XDG Base Directory** (`~/.config/`, `~/.local/share/`).
  - Nada de poluir a raiz de `$HOME` com pastas fora do padrão.
- Códigos de saída universais: `0` para sucesso, diferente de zero para falhas.

### 11. Regra do Silêncio (*Rule of Silence*)
> *Quando um programa não tem nada surpreendente a dizer, ele não deve dizer nada.*
- Scripts utilitários de compilação ou conversão devem executar de forma quieta, emitindo mensagens apenas quando explicitamente requisitado (`--verbose`) ou na ocorrência de erros reais em `stderr`.

### 12. Regra do Reparo (*Rule of Repair*)
> *Quando você precisar falhar, falhe ruidosamente e o mais rápido possível.*
- Se o bootstrap não tiver privilégios de administrador ou falhar ao acessar um repositório remoto, ele **aborta imediatamente** (fail-fast), em vez de continuar e deixar a máquina em estado semi-configurado e corrompido.

### 13. Regra da Economia (*Rule of Economy*)
> *O tempo do programador é caro; economize-o em preferência ao tempo da máquina.*
- O objetivo central do `Configuration` é que você possa pegar uma máquina nova e, em um único comando de bootstrap, reconstruir seu ambiente de trabalho completo em minutos.
- O investimento em automação reproduzível poupa semanas de trabalho manual ao longo dos anos.

### 14. Regra da Geração (*Rule of Generation*)
> *Evite codificação manual; escreva programas para escrever programas quando puder.*
- Utilizar scripts utilitários e geradores de templates para converter formatos (ex: Markdown para PDF, conversão de quebras de linha Unix/DOS, injeções em lote no Registro do Windows).

### 15. Regra da Otimização (*Rule of Optimization*)
> *Prototipe antes de polir. Faça funcionar antes de otimizar.*
- Primeiro garanta que o script de provisionamento funcione de ponta a ponta sem falhas em uma VM limpa ou snapshot ZFS. Apenas depois refine a velocidade de download de pacotes ou paralelismo.

### 16. Regra da Diversidade (*Rule of Diversity*)
> *Desconfie de todas as afirmações de "uma única maneira verdadeira".*
- Nosso ecossistema aceita a diversidade de sistemas de forma intencional e estruturada:
  - **FreeBSD:** Foco em KDE Plasma, estabilidade sólida, Jails e ZFS de primeira classe.
  - **Fedora:** Foco em GNOME Shell moderno, Wayland nativo e containers Docker/Podman rápidos.
  - **Windows:** Suporte pragmático através de PowerShell e Batch (`.cmd`/`.reg`), sem fingir que o Windows é um Unix; usamos as ferramentas certas para cada plataforma.

### 17. Regra da Extensibilidade (*Rule of Extensibility*)
> *Projete para o futuro, porque ele chegará antes do que você imagina.*
- A estrutura de pastas permite plugar um novo sistema operacional em `bootstrap/linux/` (ex: Arch, Rocky) ou um novo editor em `software/editors/` sem alterar uma única linha de código dos softwares existentes.

---

## 🧼 Princípios de Clean Code para Infraestrutura e Dotfiles

### 1. Nomes Significativos e Precisos
- Arquivos de shell e configurações devem ter nomes autoexplicativos: `01-filesystem.sh`, `02-gnome.sh`, `install-custom.sh`.
- Sem ambiguidades como `temp.sh`, `teste.sh` ou pastas soltas com nomes genéricos.

### 2. Princípio da Responsabilidade Única (SRP)
- Cada script deve ter **uma única razão para mudar**.
- O script `Font.sh` apenas baixa e instala fontes no cache do sistema; ele não configura atalhos do teclado nem instala editores.

### 3. Idempotência Rigorosa
- **Regra de Ouro:** Executar qualquer script de bootstrap ou configuração uma, duas ou dez vezes seguidas DEVE produzir o mesmo resultado estável, sem duplicar linhas em arquivos, sem gerar erros de "arquivo já existe", e sem quebrar links simbólicos.
- Antes de criar um diretório, use `mkdir -p`. Antes de copiar/linkar, verifique o destino. Antes de adicionar uma linha a um arquivo de configuração, verifique se ela já existe (`grep -q`).

### 4. Shebang Padrão Absoluto (`#!/usr/bin/env sh`)
- **Regra Absoluta:** Todo script de shell neste repositório DEVE iniciar com `#!/usr/bin/env sh`.
- **Justificativa:** No FreeBSD, ferramentas podem viver em `/usr/local/bin`; em distribuições Linux, em `/usr/bin` ou `/bin`. Usar o `env` garante resolução dinâmica e máxima portabilidade, eliminando caminhos rígidos como `#!/bin/sh`.

### 5. Permissões em 4 Dígitos Octais
- **Padrão Obrigatório:** Em comandos `chmod` e instruções de automação, use SEMPRE a notação octal de 4 dígitos:
  - `chmod 0755` para diretórios e scripts executáveis públicos.
  - `chmod 0644` para arquivos de configuração e dotfiles estáticos.
  - `chmod 0700` para diretórios privados ou scripts de credenciais.
  - `chmod 0600` para arquivos sensíveis locais.
  - `chmod 0440` para arquivos de autorização do sistema (ex: `/etc/sudoers.d/*`, `doas.conf`).
- O zero inicial explicita nitidamente que bits especiais (*setuid*, *setgid*, *sticky bit*) estão desligados (`0`), prevenindo vulnerabilidades de segurança e ambiguidades.

### 6. Programação Defensiva & Compatibilidade Multi-Shell
- Como nosso ecossistema opera tanto no **FreeBSD** quanto no **Linux**:
  - Ative modo defensivo: `set -eu` para abortar imediatamente caso uma variável não definida seja usada ou um comando falhe.
  - No FreeBSD `/bin/sh` (Almquist shell), evite "bashisms" (como `[[ ]]`, arrays bash, ou `source` em vez de `.`).
  - Proteja caminhos com aspas duplas sempre: `"${TARGET_DIR}"` para evitar quebras por espaços.
  - **Aspas Obrigatórias em Redirecionamentos:** SEMPRE use aspas ao redirecionar para o `/dev/null`: `> "/dev/null"` e `2> "/dev/null"` (nunca `> /dev/null` sem aspas).

### 7. A Regra do Escoteiro (*The Boy Scout Rule*)
- *"Deixe a área de acampamento mais limpa do que como você a encontrou."*
- Ao ajustar um script legado, remova comentários mortos, apague pastas de backup temporárias (`_OLD_`), e atualize a documentação correspondente.

### 8. Padrão de Nomenclatura dos Scripts
- Todos os scripts devem usar **letras minúsculas com hífens** (`kebab-case`):
  - ✅ `wireshark.sh`, `antigravity.sh`, `reverse-engineering.cmd`, `cli-tools.sh`
  - ❌ `Wireshark.sh`, `Antigravity.sh`, `ReverseEngineering.cmd`
- A organização de receitas deve ser **categorizada por finalidade**:
  - `system/` (configurações essenciais do SO, usuários, permissões, kernel/sysctl)
  - `desktop/` (ambientes gráficos GNOME, KDE, temas e fontes)
  - `containers/` (Docker, Incus, FreeBSD Jails)
  - `security/` (Wireshark, ferramentas de análise, chaves e firewall)
  - `tools/` (utilitários de terminal e IDEs)
  - `apps/` (aplicativos desktop e leitores)

### 9. Template Canônico de Receitas (Cookbook)
O `Configuration` é um **Catálogo de Receitas** consumido diretamente via GitHub. Para evitar poluição visual e textos vazando a largura de tela, os scripts adotam um cabeçalho **minimalista, padronizado e compacto** (3 linhas):

```sh
#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: [Nome do Software / Funcionalidade]
# ------------------------------------------------------------------------------
set -eu

echo "📦 [Nome]: Iniciando configuração..."

if [ "$(id -u)" -ne 0 ] && command -v sudo > "/dev/null" 2>&1; then
	SUDO="sudo"
else
	SUDO=""
fi

# Execução atômica e idempotente

echo "✅ [Nome]: Configurado com sucesso!"
```

*(Detalhes como descrição longa, compatibilidade e comandos rápidos vivem na tabela do `README.md` do diretório, mantendo o código-fonte limpo e gostoso de ler).*

### 10. Clean Code & Tolerância Zero para Comentários Narrativos
- **Código expressivo dispensa narração:** Comentários que apenas repetem o que o comando ou condição seguinte já diz (ex: `# Cria pasta`, `# Clona repositório`, `# Inicia serviço`, `# Gera .env apenas se não existir`) são considerados **ruído anti-Clean Code**.
- Separe blocos lógicos com **linhas em branco**, nunca com comentários óbvios.
- Comentários são permitidos **exclusivamente** para explicar o **porquê** de decisões não-triviais (ex: workarounds de bugs conhecidos de upstream ou parâmetros obscuros de kernel).

### 11. Template Canônico de READMEs para Subdiretórios (GitHub-First)
Como o repositório é consumido diretamente pela interface web do GitHub, pastas sem documentação geram atrito e navegação cega. Todo subdiretório de categoria ou ecossistema DEVE conter um `README.md` conciso seguindo este padrão:

```markdown
# [Emoji] [Nome do Subdiretório / Categoria]

> [Resumo de uma linha sobre o papel deste componente no host]

---

## 🎯 Finalidade
[Descrição curta e direta sobre o que estes arquivos configuram e por que estão agrupados aqui]

---

## 📂 Catálogo de Arquivos

| Arquivo / Pasta | Tipo | Descrição |
| :--- | :--- | :--- |
| [`arquivo`](link) | Receita / Dotfile | Função objetiva do arquivo |

---

## 🚀 Como Usar via GitHub (Zero-Clone)
[Instruções práticas para cópia/cola ou execução via terminal]
```

---

## 🌐 Princípios Específicos deste Ecossistema

1. **Filosofia de Cookbook (Zero Clone):** O repositório `Configuration` não precisa ser clonado no sistema para ser útil. Ele foi projetado para acesso direto pelo GitHub.
2. **XDG Base Directory Compliance:** Nenhum aplicativo do host deve gravar configs na raiz de `$HOME` a menos que seja forçado por limitações do próprio software legado.
3. **Zero Secrets in Public Git:** O repositório `Configuration` é 100% público. NUNCA faça commit de chaves SSH, senhas, tokens de API ou dados de identificação pessoal aqui. Esses dados pertencem ao `Vault`.
4. **Clean Host & Containerized Workflows:** O host provê o ambiente gráfico e os editores. O código de seus projetos roda em containers e VMs.
