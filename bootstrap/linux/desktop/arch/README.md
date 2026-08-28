# 🏹 Arch Linux — Catálogo de Receitas

> Receitas modulares e idempotentes para provisionar estações de trabalho rodando Arch Linux.

---

## 🎯 Finalidade

Organiza a configuração do Arch Linux em módulos desacoplados: sistema base, aceleração de hardware, containers (LXC, Incus, Podman), virtualização KVM/QEMU, editores e ferramentas de desenvolvimento.

---

## 📂 Catálogo de Receitas

| Categoria | Receita | Descrição |
| :--- | :--- | :--- |
| **`system/`** | [`system/base.sh`](system/base.sh) | Mirrors, SDDM, limite de journald e doas |
| **`system/`** | [`system/diagnostics.sh`](system/diagnostics.sh) | Diagnóstico de kernel, firmware e dispositivos |
| **`desktop/`** | [`desktop/hardware.sh`](desktop/hardware.sh) | Mesa, drivers de aceleração VA-API, Vulkan e regras udev |
| **`desktop/`** | [`desktop/flatpak.sh`](desktop/flatpak.sh) | Instalação e repositório Flathub |
| **`containers/`** | [`containers/incus.sh`](containers/incus.sh) | LXC, Incus socket e subuid/subgid |
| **`containers/`** | [`containers/podman.sh`](containers/podman.sh) | Podman e Docker nativo |
| **`virtualization/`** | [`virtualization/qemu.sh`](virtualization/qemu.sh) | QEMU, Libvirt, Virt-Manager e rede padrão |
| **`tools/`** | [`tools/cli.sh`](tools/cli.sh) | Utilitários CLI modernos e análise estática |
| **`editors/`** | [`editors/editors.sh`](editors/editors.sh) | Instalação de editores gráficos e de terminal |
| **`apps/`** | [`apps/desktop.sh`](apps/desktop.sh) | Navegadores, comunicação e mídia |
| **`servers/`** | [`servers/kvm.sh`](servers/kvm.sh) | Utilitários de controle da VM FreeBSD |

---

## 🚀 Como Usar via GitHub (Zero-Clone)

Copie os comandos da receita desejada e execute no terminal do Arch Linux.
