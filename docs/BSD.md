# 😈 A Família BSD

O ecossistema BSD (Berkeley Software Distribution) tem um papel central neste repositório. Embora a família englobe vários sistemas incríveis, nosso foco absoluto de engenharia está no **FreeBSD**, devido à sua robustez inigualável para infraestrutura, suporte massivo a ZFS e ecossistema de virtualização.

1.  **[FreeBSD](https://www.freebsd.org/)** (99% do nosso foco)
2.  [OpenBSD](https://www.openbsd.org/) (Focado em segurança e código limpo)
3.  [NetBSD](https://www.netbsd.org/) (Focado em portabilidade máxima)
4.  [DragonFlyBSD](https://www.dragonflybsd.org/) (Focado em performance SMP e sistema de arquivos HAMMER)

---

## FreeBSD: O Cidadão de Primeira Classe

O FreeBSD alinha-se perfeitamente à nossa filosofia de isolamento e reprodutibilidade (conforme a [Filosofia do Projeto](PHILOSOPHY.md)). Ele trata o sistema base e os softwares instalados pelo usuário como entidades estritamente separadas.

### 1. Caminhos Específicos (Atenção ao `/usr/local/`)

No FreeBSD, qualquer pacote ou software que _não_ faça parte do sistema base (kernel e utilitários da _userland_ principal) é instalado em `/usr/local/`. Isso significa que:

- **Shells:** Enquanto no Linux o Zsh ou o Bash podem residir em `/usr/bin/zsh` ou `/bin/bash`, no FreeBSD eles **sempre** estarão em `/usr/local/bin/zsh` e `/usr/local/bin/bash`.
- **O Shell Padrão:** O FreeBSD vem com o `sh` e o `tcsh/csh` no sistema base. Nossos scripts de bootstrap automatizam a instalação e transição para os nossos shells favoritos (zsh/bash).
- **Konsole:** Perfis de terminal importados do Linux (que esperam o bash em `/bin/bash`) falharão silenciosamente no FreeBSD. Nossos scripts de software adaptam automaticamente os perfis do Konsole (e outros terminais) para injetar o caminho correto (`/usr/local/bin/...`) dependendo do SO hospedeiro.

### 2. O Ecossistema de Containers (Jails)

Como detalhado no documento sobre [Containers](CONTAINERS.md), o FreeBSD brilha com o **Jails**.
Não instalamos dependências de desenvolvimento no host FreeBSD. Em vez disso:

- Utilizamos o **ZFS** para criar datasets raízes dedicados.
- Provisionamos novos Jails (geralmente orquestrados pelo **BastilleBSD**) para encapsular completamente serviços, bancos de dados e ferramentas de build.

### 3. Hypervisors (bhyve)

Para executar código que exige um kernel Linux ou para virtualizar outras instâncias, tiramos proveito do **bhyve**, o hypervisor nativo do FreeBSD. Em conjunto com ZVOLs (discos virtuais baseados em ZFS), criamos máquinas virtuais de altíssima performance para complementar nosso ambiente _Clean Host_. Veja a documentação de [Hypervisors](HYPERVISORS.md).

### 4. Konsole Profiles no FreeBSD

Os perfis do Konsole no FreeBSD diferenciam-se dos perfis Linux presentes em `software/terminals/konsole/`:

- **Caminhos dos Shells:** No FreeBSD, bash e zsh residem em `/usr/local/bin/`, e não em `/bin/`. Portanto, os perfis apontam para `Command=/usr/local/bin/bash` e `Command=/usr/local/bin/zsh`.
- **Shell.profile (Exclusivo do FreeBSD):** Um perfil adicional que configura `Environment=SHELL_INIT=1,SHELL_TARGET=/bin/sh` e `Command=/bin/sh`, utilizado pelo ecossistema Shell para inicialização controlada.
- Os perfis para FreeBSD ficam salvos em `software/terminals/konsole/freebsd/` e podem ser linkados para `~/.local/share/konsole/`.

### 5. Hardware e Periféricos no FreeBSD

- **Wi-Fi Nativo:** Graças aos avanços recentes do time do FreeBSD, a maioria dos chipsets Wi-Fi modernos agora é suportada nativamente pelo kernel (`wpa_supplicant`), tornando o uso de ferramentas como o Wifibox um recurso pontual de contingência, e não uma dependência obrigatória.
- **Áudio & Periféricos:** Fones e microfones USB (headsets) funcionam de forma nativa e estável através do subsistema OSS do FreeBSD (`/dev/dsp*`) e PulseAudio. O script artesanal em `devices/audio.sh` provê uma rota adicional para streaming via Android quando necessário.

### 6. Catálogo de Receitas Modulares do FreeBSD

Seguindo o modelo Cookbook, cada funcionalidade do FreeBSD é provisionada por receitas isoladas em [`bootstrap/freebsd/`](../bootstrap/README.md#freebsd-kde-plasma--servidor):
- **Base & Privilégios:** `system/system.sh` e `system/doas.sh` (permissões `0440`).
- **Árvore de Ports:** `ports/ports.sh` (sincronização via Git na branch trimestral).
- **Jails & Virtualização:** `containers/jails.sh` (Bastille) e `emulation/linuxlator.sh`.
- **Desktop & Leitura:** `desktop/kde.sh` (KDE Plasma) e `apps/epub.sh` (leitor Arianna).
- **Segurança:** `security/wireshark.sh` (captura BPF sem root).
- **Dispositivos:** `devices/audio.sh` (roteamento para Android via RTP) e `devices/filesystem.sh` (FUSE).
