@echo off
setlocal

REM Recipe: LibreSprite Build from Source
REM Target: Windows (x64)
REM Description: Clona e compila LibreSprite via CMake e Ninja.

if not exist "LibreSprite" (
    git clone --recursive "https://github.com/LibreSprite/LibreSprite"
    if %errorlevel% neq 0 exit /b %errorlevel%
)

cd LibreSprite
if not exist "build" mkdir build
cd build

cmake -G Ninja ..
ninja install

endlocal
