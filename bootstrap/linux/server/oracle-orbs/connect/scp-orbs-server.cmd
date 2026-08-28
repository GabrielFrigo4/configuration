@echo off
setlocal
rem ----------------------------------------------------------------------------
rem SCP: Oracle Orbs Server
rem ----------------------------------------------------------------------------

if "%~1"=="" (
    echo Uso: %~nx0 ^<arquivo_ou_pasta^>
    exit /b 1
)

set "SERVER_IP=%ORBS_SERVER_IP%"
if "%SERVER_IP%"=="" set "SERVER_IP=137.131.238.161"

set "SERVER_USER=%ORBS_SERVER_USER%"
if "%SERVER_USER%"=="" set "SERVER_USER=ubuntu"

set "SERVER_KEY=%ORBS_SERVER_KEY%"
if "%SERVER_KEY%"=="" set "SERVER_KEY=%USERPROFILE%\.vault\keys\ssh-key-orbs-server.key"

scp -r -i "%SERVER_KEY%" "%~1" "%SERVER_USER%@%SERVER_IP%:/home/%SERVER_USER%/%~1"
endlocal
