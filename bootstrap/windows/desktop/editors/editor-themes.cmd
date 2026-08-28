@echo off
setlocal
rem ----------------------------------------------------------------------------
rem Recipe: Editor Themes & Autoloaders
rem ----------------------------------------------------------------------------

echo [*] Instalando temas e complementos de editores...

rem Geany One-Dark Theme
mkdir "%APPDATA%\geany\colorschemes" 2>nul
curl -sL -o "%APPDATA%\geany\colorschemes\one-dark.conf" "https://raw.githubusercontent.com/geany/geany-themes/master/colorschemes/one-dark.conf"

rem Vim Plug
mkdir "%USERPROFILE%\vimfiles\autoload" 2>nul
curl -sL -o "%USERPROFILE%\vimfiles\autoload\plug.vim" "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

rem Micro Dracula Theme
mkdir "%USERPROFILE%\.config\micro\colorschemes" 2>nul
curl -sL -o "%USERPROFILE%\.config\micro\colorschemes\dracula.micro" "https://raw.githubusercontent.com/dracula/micro/master/dracula.micro"

echo [V] Temas e complementos configurados com sucesso!
endlocal
