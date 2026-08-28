@echo off
setlocal
rem ----------------------------------------------------------------------------
rem SCP: Oracle Frigo Server
rem ----------------------------------------------------------------------------

if "%~1"=="" (
    echo Uso: %~nx0 ^<arquivo_ou_pasta^>
    exit /b 1
)

set "SERVER_IP=%FRIGO_SERVER_IP%"
if "%SERVER_IP%"=="" set "SERVER_IP=144.22.210.65"

set "SERVER_USER=%FRIGO_SERVER_USER%"
if "%SERVER_USER%"=="" set "SERVER_USER=ubuntu"

set "SERVER_KEY=%FRIGO_SERVER_KEY%"
if "%SERVER_KEY%"=="" set "SERVER_KEY=%USERPROFILE%\.vault\keys\ssh-key-frigo-server.key"

scp -r -i "%SERVER_KEY%" "%~1" "%SERVER_USER%@%SERVER_IP%:/home/%SERVER_USER%/%~1"
endlocal
