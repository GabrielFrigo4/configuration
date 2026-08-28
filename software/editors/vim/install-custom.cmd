@echo off
setlocal
rem ----------------------------------------------------------------------------
rem Recipe: Custom Vim Configuration (Windows)
rem ----------------------------------------------------------------------------

git clone "https://github.com/GabrielFrigo4/vimfiles" "%USERPROFILE%\vimfiles"

(
echo set rtp+=~/vimfiles
echo source ~/vimfiles/vimrc
) > "%USERPROFILE%\_vimrc"

endlocal
