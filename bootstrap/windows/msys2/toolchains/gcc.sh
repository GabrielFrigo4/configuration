#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: MSYS2 GCC & Native Build Toolchain (UCRT64)
# ------------------------------------------------------------------------------
set -eu

pacman --needed --noconfirm -S \
	mingw-w64-ucrt-x86_64-toolchain \
	mingw-w64-ucrt-x86_64-binutils \
	mingw-w64-ucrt-x86_64-ntldd \
	mingw-w64-ucrt-x86_64-cmake \
	mingw-w64-ucrt-x86_64-ninja \
	mingw-w64-ucrt-x86_64-meson
