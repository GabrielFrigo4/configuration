@echo off
setlocal
rem ----------------------------------------------------------------------------
rem SSH: Oracle Orbs Server
rem ----------------------------------------------------------------------------

set "SERVER_IP=%ORBS_SERVER_IP%"
if "%SERVER_IP%"=="" set "SERVER_IP=137.131.238.161"

set "SERVER_USER=%ORBS_SERVER_USER%"
if "%SERVER_USER%"=="" set "SERVER_USER=ubuntu"

set "SERVER_KEY=%ORBS_SERVER_KEY%"
if "%SERVER_KEY%"=="" set "SERVER_KEY=%USERPROFILE%\.vault\keys\ssh-key-orbs-server.key"

ssh -i "%SERVER_KEY%" "%SERVER_USER%@%SERVER_IP%"
endlocal
