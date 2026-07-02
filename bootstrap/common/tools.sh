#!/bin/sh

### ################################################################################################################################

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
