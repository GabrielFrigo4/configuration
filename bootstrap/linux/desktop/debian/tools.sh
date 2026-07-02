#!/usr/bin/sh

### ################################################################################################################################

### ################################
### Installing Rust CLI Tools
### ################################

sudo apt install --yes eza
sudo apt install --yes bat
sudo apt install --yes fd-find
sudo apt install --yes ripgrep

### ################################
### Alias Rust Tools
### ################################

cat << 'EOF' | sudo tee "/usr/local/bin/bat" > "/dev/null"
#!/bin/bash
batcat "$@"
EOF
sudo chmod +x "/usr/local/bin/bat"

cat << 'EOF' | sudo tee "/usr/local/bin/fd" > "/dev/null"
#!/bin/bash
fdfind "$@"
EOF
sudo chmod +x "/usr/local/bin/fd"

### ################################
### Installing TeX / LaTeX
### ################################

sudo apt install --yes texlive-latex-extra
sudo apt install --yes texlive-lang-portuguese

### ################################
### Installing Pandoc Tools
### ################################

sudo apt install --yes pandoc
sudo apt install --yes weasyprint

### ################################
### Installing Media Tools
### ################################

sudo apt install --yes imagemagick
sudo apt install --yes ffmpeg

### ################################
### Installing File Tools
### ################################

sudo apt install --yes dos2unix

### ################################
### Installing Security Tools
### ################################

sudo apt install --yes checksec
sudo apt install --yes dirb

### ################################
### Installing Firebase
### ################################

curl -sL "https://firebase.tools" | sudo upgrade=true bash

### ################################################################################################################################

### ################################
### Installing Network Analysis Tools
### ################################

sudo apt install --yes wireshark
sudo dpkg-reconfigure wireshark-common
sudo usermod -aG wireshark "$(id -un)"
newgrp wireshark
cat << 'EOF' | sudo tee "/usr/local/bin/wireshark" > "/dev/null"
#!/bin/bash
QT_QPA_PLATFORMTHEME="" /usr/bin/wireshark "$@"
EOF
sudo chmod +x "/usr/local/bin/wireshark"

### ################################
### Installing Database Tools
### ################################

sudo wget -O /usr/share/keyrings/dbeaver.gpg.key https://dbeaver.io/debs/dbeaver.gpg.key
echo "deb [signed-by=/usr/share/keyrings/dbeaver.gpg.key] https://dbeaver.io/debs/dbeaver-ce /" | sudo tee "/etc/apt/sources.list.d/dbeaver.list" > "/dev/null"
sudo apt update
sudo apt install --yes dbeaver-ce

### ################################################################################################################################

### ################################
### Deploy Tool Configs
### ################################

### ################################
### Clangd Config
### ################################

mkdir -p "${HOME}/.config/clangd"
cat << 'EOF' > "${HOME}/.config/clangd/config.yaml"
CompileFlags:
  Add:
    - -Wformat=2
    - -Wall
    - -Wextra
    - -Wvla
    - -Wpedantic
    - -Wshadow
    - -Wconversion
    - -Wsign-conversion
    - -Werror
    - -Wno-cpp
    - -Wno-missing-field-initializers
    - -Wno-unknown-warning-option
    - -D_DEFAULT_SOURCE
    - -D_POSIX_C_SOURCE=202405L
    - -D_FORTIFY_SOURCE=2

---

If:
  PathMatch: .*\.(c|h)$
CompileFlags:
  Add: [-std=c23]

---

If:
  PathMatch: .*\.(cpp|cxx|cc|hpp|hxx)$
CompileFlags:
  Add: [-std=c++23]
  Remove: [-std=c23]

---

If:
  PathMatch: .*\.h$
CompileFlags:
  Add: [-xc-header]
EOF

### ################################
### Clang Format
### ################################

cat << 'EOF' > "${HOME}/.clang-format"
BasedOnStyle: Microsoft

AllowShortFunctionsOnASingleLine: Empty
KeepEmptyLinesAtTheStartOfBlocks: false

AlignAfterOpenBracket: BlockIndent
BinPackArguments: false
PenaltyBreakAssignment: 4096
ColumnLimit: 96

UseTab: ForIndentation
AccessModifierOffset: -4
IndentWidth: 4
TabWidth: 4
EOF

### ################################
### Prettier Config
### ################################

cat << 'EOF' > "${HOME}/.prettierrc"
{
	"printWidth": 96,
	"tabWidth": 4,
	"useTabs": true,
	"semi": true,
	"singleQuote": false,
	"trailingComma": "all",
	"bracketSpacing": true,
	"arrowParens": "always"
}
EOF

### ################################
### StyLua Config
### ################################

cat << 'EOF' > "${HOME}/.stylua.toml"
column_width = 96
line_endings = "Auto"
indent_type = "Tabs"
indent_width = 4
quote_style = "AutoPreferDouble"
call_parentheses = "Always"
collapse_simple_statement = "Never"
EOF

### ################################################################################################################################
