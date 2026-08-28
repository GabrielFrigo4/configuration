#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: MSYS2 Emacs Setup (UCRT64)
# ------------------------------------------------------------------------------
set -eu

pacman --needed --noconfirm -S \
	mingw-w64-ucrt-x86_64-emacs \
	mingw-w64-ucrt-x86_64-emacs-pdf-tools-server
