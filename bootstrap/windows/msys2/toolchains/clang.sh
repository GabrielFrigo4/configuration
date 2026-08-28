#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: MSYS2 Clang & LLVM Toolchain (UCRT64)
# ------------------------------------------------------------------------------
set -eu

pacman --needed --noconfirm -S \
	mingw-w64-ucrt-x86_64-clang \
	mingw-w64-ucrt-x86_64-clang-analyzer \
	mingw-w64-ucrt-x86_64-clang-tools-extra \
	mingw-w64-ucrt-x86_64-clang-libs \
	mingw-w64-ucrt-x86_64-lldb
