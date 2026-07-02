#!/usr/bin/sh

### ################################################################################################################################

### ################################
### Installing Rust CLI Tools
### ################################

yay --needed --noconfirm -S fd
yay --needed --noconfirm -S bat
yay --needed --noconfirm -S eza
yay --needed --noconfirm -S grex
yay --needed --noconfirm -S ripgrep
yay --needed --noconfirm -S repgrep

### ################################
### Installing Embedded Tools
### ################################

yay --needed --noconfirm -S platformio-core

### ################################
### Installing PDF Tools
### ################################

yay --needed --noconfirm -S pdftk
yay --needed --noconfirm -S img2pdf
yay --needed --noconfirm -S jbig2enc
yay --needed --noconfirm -S poppler
yay --needed --noconfirm -S mscgen
yay --needed --noconfirm -S pdf2svg
yay --needed --noconfirm -S enchant
yay --needed --noconfirm -S graphviz
yay --needed --noconfirm -S jpegoptim
yay --needed --noconfirm -S pdfsizeopt-git

### ################################
### Installing TeX / LaTeX
### ################################

yay --needed --noconfirm -S texlive
yay --needed --noconfirm -S texlive-core
yay --needed --noconfirm -S texlive-latexextra
yay --needed --noconfirm -S texlive-langportuguese
yay --needed --noconfirm -S texlive-fontsextra
yay --needed --noconfirm -S texlive-pictures
yay --needed --noconfirm -S texlive-pstricks

### ################################
### Installing Pandoc Tools
### ################################

yay --needed --noconfirm -S pandoc-plot
yay --needed --noconfirm -S pandoc-cli

### ################################
### Installing Media Tools
### ################################

yay --needed --noconfirm -S imagemagick
yay --needed --noconfirm -S ffmpeg
yay --needed --noconfirm -S yt-dlp
yay --needed --noconfirm -S ytui
yay --needed --noconfirm -S ani-cli

### ################################
### Installing OCR Tools
### ################################

yay --needed --noconfirm -S ocrs
yay --needed --noconfirm -S gocr
yay --needed --noconfirm -S ocrad
yay --needed --noconfirm -S tesseract
yay --needed --noconfirm -S tesseract-data-eng
yay --needed --noconfirm -S tesseract-data-por
yay --needed --noconfirm -S ocrmypdf

### ################################
### Installing Hardware Tools
### ################################

yay --needed --noconfirm -S esptool

### ################################
### Installing Security Tools
### ################################

yay --needed --noconfirm -S dirb

### ################################################################################################################################

### ################################
### Installing Reverse Engineering
### ################################

yay --needed --noconfirm -S xelfviewer-bin
yay --needed --noconfirm -S xpeviewer-bin
yay --needed --noconfirm -S xmachoviewer-bin
yay --needed --noconfirm -S xapkdetector-bin
yay --needed --noconfirm -S ghidra

### ################################
### Installing Debuggers
### ################################

yay --needed --noconfirm -S gf2-git

### ################################
### Installing Network Analysis Tools
### ################################

yay --needed --noconfirm -S wireshark-cli
yay --needed --noconfirm -S wireshark-qt
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

yay --needed --noconfirm -S dbeaver

### ################################
### Installing Game Engines
### ################################

yay --needed --noconfirm -S unityhub
yay --needed --noconfirm -S godot

### ################################
### Installing Electronics Tools
### ################################

yay --needed --noconfirm -S arduino-ide-bin
yay --needed --noconfirm -S arduino-cli
yay --needed --noconfirm -S digital
yay --needed --noconfirm -S openfpgaloader
yay --needed --noconfirm -S quartus-free
yay --needed --noconfirm -S gtkwave
yay --needed --noconfirm -S ghdl

### ################################
### Installing Google Tools
### ################################

yay --needed --noconfirm -S gdown

### ################################################################################################################################

### ################################
### Installing Git GUI Tools
### ################################

yay --needed --noconfirm -S github-desktop-bin
yay --needed --noconfirm -S gitkraken-cli-bin
yay --needed --noconfirm -S gitkraken

### ################################
### Installing Git Credential Manager
### ################################

yay --needed --noconfirm -S git-credential-manager-bin
git-credential-manager configure

### ################################
### Installing Firebase
### ################################

curl -sL "https://firebase.tools" | sudo upgrade=true bash
yay --needed --noconfirm -S firebase-tools-bin

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
