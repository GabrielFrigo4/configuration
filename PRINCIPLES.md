# 📜 Princípios de Engenharia & Filosofia do Repositório (Configuration)

> _"Rule of Separation: Separate policy from mechanism; separate engine from interface."_  
> — Eric S. Raymond, _The Art of UNIX Programming_ (2003)

Este repositório é a fundação estática da **Tríade de Produtividade** (`Configuration`, `Shell`, `Vault`). Ele é responsável pelo provisionamento do sistema operacional (host limpo), configurações declarativas de editores e ferramentas de interface gráfica, e documentação arquitetural.

Para garantir longevidade, previsibilidade e excelência técnica, toda contribuição e alteração neste repositório deve obedecer aos **17 Princípios UNIX**, às práticas de **Clean Code** adaptadas a scripts de infraestrutura e dotfiles, e às diretrizes modernas do ecossistema.

---

## 🏛️ Os 17 Princípios UNIX (_The Art of UNIX Programming_, 2003)

### 1. Regra da Modularidade (_Rule of Modularity_)

> _Escreva partes simples conectadas por interfaces limpas._

- O repositório é estritamente desacoplado do `Shell` (comportamento ativo) e do `Vault` (segredos).
- A pasta `software/editors/` contém configurações autocontidas por editor (Antigravity, VS Code, VSCodium, Zed, Emacs, Vim). Ajustar um editor nunca afeta os outros.
- O provisionamento de SO em `bootstrap/` é quebrado em receitas atômicas e independentes.

### 2. Regra da Clareza (_Rule of Clarity_)

> _Clareza é melhor que esperteza._

- Scripts de bootstrap e configuração priorizam legibilidade absoluta sobre "one-liners" crípticos ou truques de regex obscuros.
- Nomes de variáveis são autoexplicativos (`TARGET_CONFIG_DIR`, `BACKUP_TIMESTAMP`).
- Comandos não convencionais devem ser documentados com comentários explicando o _porquê_, não apenas o _o quê_.

### 3. Regra da Composição (_Rule of Composition_)

> _Projete programas para serem conectados a outros programas._

- Nossos scripts de utilitários em `scripts/` (ex: conversores de documentos ou formatadores) recebem dados via argumentos padrão ou `stdin` e geram saída limpa para `stdout`, permitindo pipelines Unix (`|`).
- As receitas do `bootstrap/` são atômicas e podem ser executadas isoladamente ou encadeadas sequencialmente em pipelines de automação.

### 4. Regra da Separação (_Rule of Separation_)

> _Separe a política do mecanismo; separe o motor da interface._

- **Mecanismo (`bootstrap/`):** Scripts executáveis de automação e provisionamento que sabem _como_ interagir com o sistema operacional, gerenciar pacotes (`dnf`, `apt`, `pkg`, `winget`), configurar privilégios (`sudo`/`doas`) e registrar serviços.
- **Política (`software/`):** Arquivos declarativos puros (`settings.json`, `.clang-format`, `.stylua.toml`, `extensions.txt`, `.profile`) que definem _o que_ deve ser configurado no espaço do usuário (`$HOME`). O mecanismo nunca embute configurações hardcoded que deveriam residir em um arquivo de política.

### 5. Regra da Simplicidade (_Rule of Simplicity_)

> _Projete para a simplicidade; adicione complexidade apenas onde estritamente necessário._

- **Clean Host (Santuário):** O sistema operacional hospedeiro permanece mínimo. Não instalamos runtimes pesados (Node, Python, Ruby, bancos de dados) no host; desenvolvimento vive em Containers (Docker/Podman/LXC) ou Jails (FreeBSD).
- Evitamos gerenciadores de dotfiles pesados ou dependências externas desnecessárias (como GNU Stow ou frameworks complexos); configurações simples permanecem arquivos estáticos diretos.

### 6. Regra da Parcimônia (_Rule of Parsimony_)

> _Escreva um programa grande apenas quando estiver claro por demonstração que nada mais resolverá._

- Se um comando nativo do gerenciador de pacotes (`dnf install`, `pkg install`, `winget install`) resolve o problema, não criamos wrappers complexos em torno dele.
- Mantenha cada script enxuto e direto ao ponto.

### 7. Regra da Transparência (_Rule of Transparency_)

> _Projete para a visibilidade para tornar inspeção e depuração fáceis._

- Todas as configurações de editores e ferramentas usam formatos em texto legíveis por humanos (JSON, TOML, YAML, shell scripts limpos).
- Scripts de bootstrap exibem exatamente quais etapas estão executando, com mensagens sem ruído excessivo mas informativas o bastante para auditoria imediata.

### 8. Regra da Robustez (_Rule of Robustness_)

> _A robustez é filha da transparência e da simplicidade._

- Antes de tentar instalar pacotes ou aplicar configurações, os scripts validam pré-requisitos (`command -v`, variáveis de ambiente necessárias, conexões ativas).
- Uso extensivo do **ZFS** para garantir snapshots automáticos antes de mudanças críticas no sistema, garantindo recuperação instantânea.

### 9. Regra da Representação (_Rule of Representation_)

> _Dobre o conhecimento em dados para que a lógica do programa possa ser estúpida e robusta._

- Preferir listas declarativas de pacotes ou mapeamentos chave-valor em vez de blocos gigantescos de `if/else` procedural.
- Modificar uma configuração deve ser tão simples quanto adicionar uma linha a uma lista de dados.

### 10. Regra do Menor Espanto (_Rule of Least Surprise_)

> _No design de interfaces, sempre faça a coisa menos surpreendente._

- Seguir estritamente os caminhos convencionais do ecossistema Unix:
    - Dotfiles vão para o padrão **XDG Base Directory** (`~/.config/`, `~/.local/share/`).
    - Nada de poluir a raiz de `$HOME` com pastas fora do padrão.
- Códigos de saída universais: `0` para sucesso, diferente de zero para falhas.

### 11. Regra do Silêncio (_Rule of Silence_)

> _Quando um programa não tem nada surpreendente a dizer, ele não deve dizer nada._

- Scripts utilitários de compilação ou conversão devem executar de forma quieta, emitindo mensagens apenas quando explicitamente requisitado (`--verbose`) ou na ocorrência de erros reais em `stderr`.

### 12. Regra do Reparo (_Rule of Repair_)

> _Quando você precisar falhar, falhe ruidosamente e o mais rápido possível._

- Se o bootstrap não tiver privilégios de administrador ou falhar ao acessar um repositório remoto, ele **aborta imediatamente** (fail-fast), em vez de continuar e deixar a máquina em estado semi-configurado e corrompido.

### 13. Regra da Economia (_Rule of Economy_)

> _O tempo do programador é caro; economize-o em preferência ao tempo da máquina._

- O objetivo central do `Configuration` é que você possa pegar uma máquina nova e, em um único comando de bootstrap, reconstruir seu ambiente de trabalho completo em minutos.
- O investimento em automação reproduzível poupa semanas de trabalho manual ao longo dos anos.

### 14. Regra da Geração (_Rule of Generation_)

> _Evite codificação manual; escreva programas para escrever programas quando puder._

- Utilizar scripts utilitários e geradores de templates para converter formatos (ex: Markdown para PDF, conversão de quebras de linha Unix/DOS, injeções em lote no Registro do Windows).

### 15. Regra da Otimização (_Rule of Optimization_)

> _Prototipe antes de polir. Faça funcionar antes de otimizar._

- Primeiro garanta que o script de provisionamento funcione de ponta a ponta sem falhas em uma VM limpa ou snapshot ZFS. Apenas depois refine a velocidade de download de pacotes ou paralelismo.

### 16. Regra da Diversidade (_Rule of Diversity_)

> _Desconfie de todas as afirmações de "uma única maneira verdadeira"._

- Nosso ecossistema aceita a diversidade de sistemas de forma intencional e estruturada:
    - **FreeBSD:** Foco em KDE Plasma, estabilidade sólida, Jails e ZFS de primeira classe.
    - **Fedora:** Foco em GNOME Shell moderno, Wayland nativo e containers Docker/Podman rápidos.
    - **Windows:** Suporte pragmático através de PowerShell e Batch (`.cmd`/`.reg`), sem fingir que o Windows é um Unix; usamos as ferramentas certas para cada plataforma.

### 17. Regra da Extensibilidade (_Rule of Extensibility_)

> _Projete para o futuro, porque ele chegará antes do que você imagina._

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
- O zero inicial explicita nitidamente que bits especiais (_setuid_, _setgid_, _sticky bit_) estão desligados (`0`), prevenindo vulnerabilidades de segurança e ambiguidades.

### 6. Programação Defensiva & Compatibilidade Multi-Shell

- Como nosso ecossistema opera tanto no **FreeBSD** quanto no **Linux**:
    - Ative modo defensivo: `set -eu` para abortar imediatamente caso uma variável não definida seja usada ou um comando falhe.
    - No FreeBSD `/bin/sh` (Almquist shell), evite "bashisms" (como `[[ ]]`, arrays bash, ou `source` em vez de `.`).
    - Proteja caminhos com aspas duplas sempre: `"${TARGET_DIR}"` para evitar quebras por espaços.
    - **Aspas Obrigatórias em Redirecionamentos:** SEMPRE use aspas ao redirecionar para o `/dev/null`: `> "/dev/null"` e `2> "/dev/null"` (nunca `> /dev/null` sem aspas).

### 7. A Regra do Escoteiro (_The Boy Scout Rule_)

- _"Deixe a área de acampamento mais limpa do que como você a encontrou."_
- Ao ajustar um script legado, remova comentários mortos, apague pastas de backup temporárias (`_OLD_`), e atualize a documentação correspondente.

### 8. Padrão de Nomenclatura dos Scripts

- Todos os scripts devem usar **letras minúsculas com hífens** (`kebab-case`):
    - ✅ `wireshark.sh`, `antigravity.sh`, `reverse-engineering.cmd`, `cli-tools.sh`
    - ❌ `Wireshark.sh`, `Antigravity.sh`, `ReverseEngineering.cmd`
- A organização de receitas deve ser **categorizada por finalidade**:
    - `system/` (configurações essenciais do SO, usuários, permissões, kernel/sysctl)
    - `desktop/` (ambientes gráficos GNOME, KDE, temas e fontes)
    - `container/` (Docker, Incus, FreeBSD Jails, BastilleBSD, Podman)
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

_(Detalhes como descrição longa, compatibilidade e comandos rápidos vivem na tabela do `README.md` do diretório, mantendo o código-fonte limpo e gostoso de ler)._

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

| Arquivo / Pasta   | Tipo              | Descrição                  |
| :---------------- | :---------------- | :------------------------- |
| [`arquivo`](link) | Receita / Dotfile | Função objetiva do arquivo |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

[Instruções práticas para cópia/cola ou execução via terminal]
```

### 12. Regra da Abstração vs Isolamento (Dispatch Leve vs Isolamento por Distro)

- **Infraestrutura Base e Containers Universais (`common/`, `container/`):** Adote **Dispatch Leve** (`if command -v ...`) para obter pacotes de infraestrutura quando 90%+ da regra de negócio (kernel, systemd, sockets, regras de firewall, subuid/subgid, permissões `0440`) for idêntica entre distribuições. Isso elimina duplicações e preserva a Regra da Economia.
- **Estações de Trabalho Gráficas (`desktop/`):** Adote **Isolamento por Distribuição** (`fedora/`, `arch/`, `debian/`). Nunca tente unificar interfaces gráficas, repositórios de terceiros (AUR, RPM Fusion, Non-Free) e ciclos de release em scripts ramificados gigantes; o ecossistema e ferramentas de cada distro merecem receitas limpas e dedicadas.

### 13. Ordem Canônica de Priorização de Pacotes (Dispatch Universal)

Ao utilizar _Dispatch Leve_ em receitas universais, as verificações condicionais de gerenciadores de pacotes DEVEM respeitar rigorosamente a ordem canônica do ecossistema:

1. **Receitas Multi-OS (`FreeBSD` + `Linux`):**
   `pkg` _(FreeBSD)_ $\rightarrow$ `dnf` _(Fedora)_ $\rightarrow$ `apt` _(Debian)_ $\rightarrow$ `pacman` _(Arch)_
2. **Receitas Exclusivas de Linux (`bootstrap/linux/`):**
   `dnf` _(Fedora)_ $\rightarrow$ `apt` _(Debian)_ $\rightarrow$ `pacman` _(Arch)_

```sh
if command -v pkg > "/dev/null" 2>&1; then
	${SUDO} pkg install --yes pacote
elif command -v dnf > "/dev/null" 2>&1; then
	${SUDO} dnf install --assumeyes pacote
elif command -v apt > "/dev/null" 2>&1; then
	${SUDO} apt install --yes pacote
elif command -v pacman > "/dev/null" 2>&1; then
	${SUDO} pacman -S --needed --noconfirm pacote
fi
```

### 14. Preferência Absoluta por Flags Longas e Autoexplicativas (Expressões por Extenso)

- **Código autodocumentado:** Em receitas e scripts de automação, evite atalhos curtos crípticos (como `-y`, `-s`, `-g`, `-e`, `-h`) sempre que a ferramenta oferecer equivalentes longos e descritivos:
  - `apt install --yes` (em vez de `apt install -y`)
  - `dnf install --assumeyes` (em vez de `dnf install -y`)
  - `pkg install --yes` (em vez de `pkg install -y`)
  - `pacman -S --needed --noconfirm` (em vez de flags aglutinadas)
  - `flatpak install --assumeyes` (em vez de `flatpak install -y`)
  - `npm install --global` (em vez de `npm install -g`)
  - `usermod --append --groups` (em vez de `usermod -aG`)
- **Justificativa:** Scripts de infraestrutura são lidos e auditados muito mais vezes do que digitados. Flags longas tornam a intenção do código transparente e autoexplicativa sem que o leitor precise consultar a página de manual (`man`).
- **Exceção Canônica:** Comandos e utilitários fundamentais POSIX (`mkdir -p`, `rm -rf`, `ln -sf`, `id -u`, `set -eu`, `chmod 0755`) mantêm sua notação POSIX padrão para garantir máxima portabilidade entre Linux, FreeBSD e macOS, já que variantes BSD de coreutils não suportam extensões longas GNU (como `--parents`).

### 15. Nomenclatura Semântica de Diretórios (Regra de Singular vs. Plural)

A estrutura de diretórios do repositório segue rigorosamente 3 regras semânticas de nomenclatura para manter simetria e previsibilidade:

1. **Coleções de Itens Tangíveis / Contáveis $\rightarrow$ PLURAL:** Pastas que agrupam múltiplos arquivos, ferramentas ou categorias contáveis utilizam sempre substantivos no plural.
   - *Exemplos:* `skills/`, `scripts/`, `docs/`, `editors/`, `terminals/`, `browsers/`, `tools/`, `apps/`, `fonts/`, `linters/`, `devices/`, `ports/`.
2. **Processos, Áreas de Sistema & Nomes de Massa $\rightarrow$ SINGULAR:** Pastas que representam um conceito abstrato, ação/processo, área funcional ou substantivos incontáveis (*mass nouns* em inglês) utilizam sempre o singular.
   - *Exemplos:* `bootstrap/`, `software/`, `system/`, `security/`, `network/`, `gui/`, `virtualization/`, `emulation/`, `desktop/`, `server/`, `container/`, `audit/`, `build/`, `convert/`.
3. **Nomes Próprios & Tecnologias $\rightarrow$ NOME CANÔNICO:** Pastas de sistemas operacionais, distribuições ou aplicações mantêm seu nome próprio literal em minúsculas.
   - *Exemplos:* `linux/`, `freebsd/`, `windows/`, `fedora/`, `arch/`, `debian/`, `firefox/`, `vscode/`, `zed/`, `konsole/`.

---

## 🌐 Princípios Específicos deste Ecossistema

1. **Filosofia de Cookbook (Zero Clone):** O repositório `Configuration` não precisa ser clonado no sistema para ser útil. Ele foi projetado para acesso direto pelo GitHub.
2. **XDG Base Directory Compliance:** Nenhum aplicativo do host deve gravar configs na raiz de `$HOME` a menos que seja forçado por limitações do próprio software legado.
3. **Zero Secrets in Public Git:** O repositório `Configuration` é 100% público. NUNCA faça commit de chaves SSH, senhas, tokens de API ou dados de identificação pessoal aqui. Esses dados pertencem ao `Vault`.
4. **Clean Host & Containerized Workflows:** O host provê o ambiente gráfico e os editores. O código de seus projetos roda em containers e VMs.
