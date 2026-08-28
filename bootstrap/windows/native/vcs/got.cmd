@echo off
setlocal

REM Game of Trees (Got) Configuration (Windows / MSYS2)
REM Configura o arquivo .gotconfig com base nas credenciais do Vault.

set "GOT_CONF=%USERPROFILE%\.gotconfig"

if defined GIT_AUTHOR_NAME if defined GIT_AUTHOR_EMAIL (
    (
        echo author "%GIT_AUTHOR_NAME% <%GIT_AUTHOR_EMAIL%>"
    ) > "%GOT_CONF%"
    echo [Got]: Arquivo "%GOT_CONF%" configurado com sucesso.
) else (
    echo [Got]: Variaveis GIT_AUTHOR_NAME ou GIT_AUTHOR_EMAIL nao definidas.
)

endlocal
