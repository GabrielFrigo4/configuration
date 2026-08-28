# 🛠️ Scripts Utilitários

Esta pasta contém scripts utilitários focados em automatizar tarefas específicas, conversões de dados, manipulação de arquivos e configurações complexas que exigem mais de um passo.

**Importante:** Scripts interativos diários para sua linha de comando (aliases, funções bash/zsh rápidas) devem viver no repositório **Shell**. Os scripts nesta pasta de `Configuration` são ferramentas estáticas ou setups automatizados (ex: injetar configurações num registro do Windows).

## Conteúdo

- **`audit-monoliths.py`**: Ferramenta de auditoria que escaneia todos os scripts do repositório garantindo que nenhum script exceda o limite de 100 linhas (garantia de código atômico e desacoplado).
- **`build/`**: Scripts de compilação de softwares ou módulos a partir do código-fonte (quando pacotes nativos não estão disponíveis).
- **`converters/`**: Scripts para converter formatos de mídia, documentos, ou migrações de dados pontuais.
- **`windows/`**: Scripts dedicados a manipular o Registro do Windows (`.reg` ou scripts PowerShell de configuração), remoção de telemetria ou tweaks do sistema.

---

## 📜 Princípios e Padrões Obrigatórios

Conforme os princípios estabelecidos em [`../PRINCIPLES.md`](../PRINCIPLES.md):

1. **Shebang Padrão Absoluto (`#!/usr/bin/env sh`):** Todo script de shell deve utilizar `#!/usr/bin/env sh`. Não use `bash` a menos que seja estritamente necessário.
2. **Permissões em 4 Dígitos Octais:** Utilize SEMPRE `chmod 0755` para scripts executáveis e diretórios, e `chmod 0644` para arquivos estáticos (`.reg`, documentação).
3. **Regra da Composição:** Scripts de conversão e utilitários devem suportar o encadeamento com ferramentas padrão do Unix via pipes (`|`), argumentos limpos e saídas previsíveis em `stdout`.
4. **Programação Defensiva (`set -eu`):** Todo script deve ativar `set -eu` para falhar ruidosamente caso ocorram erros ou referências a variáveis inexistentes.
