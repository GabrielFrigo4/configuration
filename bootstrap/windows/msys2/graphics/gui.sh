#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: MSYS2 GUI Frameworks (GTK, Qt, Cairo)
# ------------------------------------------------------------------------------
set -eu

pacman --needed --noconfirm -S \
	mingw-w64-ucrt-x86_64-glib2 \
	mingw-w64-ucrt-x86_64-cairo \
	mingw-w64-ucrt-x86_64-pango \
	mingw-w64-ucrt-x86_64-gtk3 \
	mingw-w64-ucrt-x86_64-gtk4 \
	mingw-w64-ucrt-x86_64-qt5 \
	mingw-w64-ucrt-x86_64-qt6
