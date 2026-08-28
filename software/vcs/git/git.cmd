@echo off
setlocal

REM Git Global Configuration (Windows)
REM Configura Git no Windows com boas praticas e consome variaveis do Vault.

if defined GIT_AUTHOR_NAME (
    git config --global user.name "%GIT_AUTHOR_NAME%"
)

if defined GIT_AUTHOR_EMAIL (
    git config --global user.email "%GIT_AUTHOR_EMAIL%"
)

git config --global init.defaultBranch main
git config --global pull.rebase false
git config --global core.autocrlf true
git config --global core.quotepath false

echo [Git]: Configuracao global concluida com sucesso.
endlocal
