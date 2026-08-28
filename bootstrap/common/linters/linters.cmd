@echo off
setlocal
rem ----------------------------------------------------------------------------
rem Recipe: Common Developer Tools & Linters Configuration (Windows)
rem ----------------------------------------------------------------------------

echo [*] Configurando formatadores e linters globais no Windows...

mkdir "%LOCALAPPDATA%\clangd" 2>nul
(
echo CompileFlags:
echo   Add:
echo     - -Wformat=2
echo     - -Wall
echo     - -Wextra
echo     - -Wvla
echo     - -Wpedantic
echo     - -Wshadow
echo     - -Wconversion
echo     - -Wsign-conversion
echo     - -Werror
echo     - -Wno-cpp
echo     - -Wno-missing-field-initializers
echo     - -Wno-unknown-warning-option
echo     - -D_DEFAULT_SOURCE
echo     - -D_POSIX_C_SOURCE=202405L
echo     - -D_FORTIFY_SOURCE=2
echo.
echo ---
echo.
echo If:
echo   PathMatch: .*\.(c^|h^)$
echo CompileFlags:
echo   Add: [-std=c23]
echo.
echo ---
echo.
echo If:
echo   PathMatch: .*\.(cpp^|cxx^|cc^|hpp^|hxx^)$
echo CompileFlags:
echo   Add: [-std=c++23]
echo   Remove: [-std=c23]
echo.
echo ---
echo.
echo If:
echo   PathMatch: .*\.h$
echo CompileFlags:
echo   Add: [-xc-header]
) > "%LOCALAPPDATA%\clangd\config.yaml"

(
echo BasedOnStyle: Microsoft
echo.
echo AllowShortFunctionsOnASingleLine: Empty
echo KeepEmptyLinesAtTheStartOfBlocks: false
echo.
echo AlignAfterOpenBracket: BlockIndent
echo BinPackArguments: false
echo PenaltyBreakAssignment: 4096
echo ColumnLimit: 96
echo.
echo UseTab: ForIndentation
echo AccessModifierOffset: -4
echo IndentWidth: 4
echo TabWidth: 4
) > "%USERPROFILE%\.clang-format"

(
echo {
echo 	"printWidth": 96,
echo 	"tabWidth": 4,
echo 	"useTabs": true,
echo 	"semi": true,
echo 	"singleQuote": false,
echo 	"trailingComma": "all",
echo 	"bracketSpacing": true,
echo 	"arrowParens": "always"
echo }
) > "%USERPROFILE%\.prettierrc"

(
echo column_width = 96
echo line_endings = "Auto"
echo indent_type = "Tabs"
echo indent_width = 4
echo quote_style = "AutoPreferDouble"
echo call_parentheses = "Always"
echo collapse_simple_statement = "Never"
) > "%USERPROFILE%\.stylua.toml"

echo [V] Linters e formatadores configurados com sucesso!
endlocal
