@echo off
setlocal
rem ----------------------------------------------------------------------------
rem SSH: Oracle Frigo Server
rem ----------------------------------------------------------------------------

set "SERVER_IP=%FRIGO_SERVER_IP%"
if "%SERVER_IP%"=="" set "SERVER_IP=144.22.210.65"

set "SERVER_USER=%FRIGO_SERVER_USER%"
if "%SERVER_USER%"=="" set "SERVER_USER=ubuntu"

set "SERVER_KEY=%FRIGO_SERVER_KEY%"
if "%SERVER_KEY%"=="" set "SERVER_KEY=%USERPROFILE%\.vault\keys\ssh-key-frigo-server.key"

ssh -i "%SERVER_KEY%" "%SERVER_USER%@%SERVER_IP%"
endlocal
