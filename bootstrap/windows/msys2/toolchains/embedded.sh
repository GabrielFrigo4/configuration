#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: MSYS2 Embedded & Assembler Toolchains (UCRT64)
# ------------------------------------------------------------------------------
set -eu

pacman --needed --noconfirm -S \
	mingw-w64-ucrt-x86_64-avr-toolchain \
	mingw-w64-ucrt-x86_64-avr-binutils \
	mingw-w64-ucrt-x86_64-avrdude \
	mingw-w64-ucrt-x86_64-nasm \
	mingw-w64-ucrt-x86_64-asm-lsp
