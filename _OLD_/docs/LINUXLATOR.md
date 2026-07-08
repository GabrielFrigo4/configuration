# 🐧 Linuxlator (FreeBSD Linux Compatibility)

O **Linuxlator** é a camada de compatibilidade do FreeBSD que permite a execução de binários do Linux de forma nativa e sem necessidade de virtualização pesada (como o Bhyve).

## Filosofia e Uso no Host

Para respeitar a filosofia de **Clean Host**, o uso do Linuxlator no host principal (FreeBSD) deve ser restrito à sua função de **extensão do catálogo de software**.

Se um software essencial não está disponível no `pkg` ou nos `ports` do FreeBSD, e compilá-lo a partir do código fonte não for prático, binários Linux pré-compilados podem ser executados usando o Linuxlator. O ambiente base do Linux (`/compat/linux`) deve ser mantido limpo e gerenciado exclusivamente por ferramentas adequadas. Não use o Linuxlator no host para montar ambientes complexos de desenvolvimento; isso polui o sistema operacional principal.

**Habilitando no Host:**
O suporte base já está ativado no script de instalação (`linux_enable="YES"`). Para utilizá-lo, normalmente instala-se a base CentOS ou Ubuntu:

```bash
sudo pkg install emulators/linux_base-c7
sudo service linux start
```

## Linuxlator em Jails (Substituindo o Bhyve)

Para a grande maioria dos cenários de desenvolvimento que exigem Linux (como dependências específicas de Node.js, containers Docker não suportados nativamente, ou compiladores cruzados), Jails com o Linuxlator habilitado são a abordagem superior.

**Vantagens sobre o Bhyve para casos simples:**

- **Performance Nativa:** Sem a sobrecarga de um kernel virtualizado; os syscalls do Linux são traduzidos em tempo real para syscalls do FreeBSD.
- **Eficiência de Recursos:** Uma Jail Linux consome a mesma quantidade de RAM de processos normais, escalando perfeitamente.
- **Inicialização Imediata:** Diferente de uma VM (Bhyve) que precisa realizar boot completo do sistema, uma Jail sobe instantaneamente.

**Como utilizar via BastilleBSD:**
Bastille suporta a criação de templates e Jails rodando um _userland_ Linux. Dessa forma, podemos manter o "Clean Host" e ainda obter 100% de flexibilidade de desenvolvimento.
