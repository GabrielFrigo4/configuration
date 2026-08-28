# Documentação do Repositório (Configuration)

Esta pasta reúne a documentação arquitetural, técnica e filosófica de todo o ecossistema provisionado pelo **Configuration**. O entendimento destes documentos é fundamental para preservar o isolamento, a segurança e a modularidade da estação de trabalho.

---

## 📜 Filosofia e Princípios

- **[ARCHITECTURE.md](ARCHITECTURE.md)** — A visão geral da Tríade de Produtividade, fluxos de integração e fronteiras dos 3 repositórios.
- **[PHILOSOPHY.md](PHILOSOPHY.md)** — A regra de ouro: "Clean Host", ZFS e a Tríade de Modularidade (Configuration vs Shell vs Vault). Leia este primeiro.
- **[../PRINCIPLES.md](../PRINCIPLES.md)** — Os 17 Princípios UNIX (*The Art of UNIX Programming*, 2003) e as boas práticas de Clean Code aplicadas ao repositório.

---

## 🏗️ Infraestrutura e Isolamento

- **[BOOTSTRAP.md](BOOTSTRAP.md)** — Arquitetura do Livro de Receitas (Cookbook) do GitHub e Template Canônico.
- **[CONTAINERS.md](CONTAINERS.md)** — Isolamento de desenvolvimento: Bastille Jails no FreeBSD e Incus / Podman no Fedora.
- **[HYPERVISORS.md](HYPERVISORS.md)** — Virtualização completa e armazenamento ZVOLs: bhyve (FreeBSD), KVM (Linux) e Hyper-V / WSL2 (Windows).

---

## 🔗 O Ecossistema (A Tríade)

O `Configuration` trabalha em simbiose com dois outros pilares:

- **[SHELL.md](SHELL.md)** — O motor dinâmico do terminal. Arquitetura modular (`core`, `context`, `target`, `library`, `theme`).
- **[VAULT.md](VAULT.md)** — O cofre seguro de credenciais, chaves SSH, senhas Wi-Fi e tokens privados.

---

## 🖥️ Ambientes Gráficos e Estações de Trabalho

Nossa estação de trabalho opera sob uma matriz dual rigorosa:

- **[GNOME.md](GNOME.md)** — Ambiente gráfico padrão no **Fedora Workstation** (Wayland, Adwaita escuro, botões e atalhos).
- **[KDE.md](KDE.md)** — Ambiente gráfico padrão no **FreeBSD Desktop** (KDE Plasma 6 Wayland, Polkit e atalhos).
- **[BSD.md](BSD.md)** — Particularidades do FreeBSD (caminhos em `/usr/local/`, Jails, pacotes base e receitas).
- **[LINUXLATOR.md](LINUXLATOR.md)** — Camada de compatibilidade binária do Linux no FreeBSD.
- **[Navegadores & Firefox](../software/browsers/firefox/README.md)** — Configurações manuais do Mozilla Firefox (clipboard assíncrono e Wayland).
