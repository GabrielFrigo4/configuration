# Terminals

Perfis e configurações de terminais e shells.

## Estrutura

| Terminal              | Plataforma  | Arquivos                                                               |
| :-------------------- | :---------- | :--------------------------------------------------------------------- |
| **Windows Terminal**  | Windows     | `settings.json`                                                        |
| **Nushell**           | Windows     | `config.nu`, `env.nu`, `nushell.nu`                                    |
| **CMD** (Clink)       | Windows     | `profile.cmd`, `profile.lua`, `setup-profile.reg`                      |
| **PowerShell**        | Windows     | `profile.ps1`, `Microsoft.PowerShell_profile.ps1`                      |
| **Konsole**           | Linux (KDE) | `Bash.profile`, `Zsh.profile`, `Nushell.profile`, `PowerShell.profile` |
| **Konsole (FreeBSD)** | FreeBSD     | `freebsd/Shell.profile`, `freebsd/Bash.profile`, `freebsd/Zsh.profile` |

## Instalação

### Windows Terminal

```
%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

### Nushell

```
%APPDATA%\nushell\config.nu
%APPDATA%\nushell\env.nu
```

O `nushell.nu` é o perfil de ambiente (PATH, variáveis, oh-my-posh) e deve ser importado pelo `config.nu`.

### CMD (Clink)

```
%USERPROFILE%\profile.cmd
%PROGRAMFILES(x86)%\clink\profile.lua
```

O `setup-profile.reg` registra o `profile.cmd` como autorun do CMD.

### PowerShell

```powershell
# Profile principal (lógica e aliases)
$PSHOME\profile.ps1
# ou
$HOME\Documents\PowerShell\profile.ps1

# Profile visual (oh-my-posh, Terminal-Icons)
$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

### Konsole (KDE)

```
~/.local/share/konsole/Bash.profile
~/.local/share/konsole/Zsh.profile
~/.local/share/konsole/Nushell.profile
~/.local/share/konsole/PowerShell.profile
```

Todos os perfis usam **JetBrainsMono Nerd Font** tamanho 12, tema **Breath** e cursor piscante.

### Konsole (FreeBSD)

```
~/.local/share/konsole/Shell.profile
~/.local/share/konsole/Bash.profile
~/.local/share/konsole/Zsh.profile
```

Os profiles do FreeBSD diferem dos do Linux: usam o tema **Breeze** e os caminhos dos shells são `/usr/local/bin/bash` e `/usr/local/bin/zsh` (instalados via `pkg`). O `Shell.profile` é exclusivo do FreeBSD para inicialização controlada pelo ecossistema Shell.
