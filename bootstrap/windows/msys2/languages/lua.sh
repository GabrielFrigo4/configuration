#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: MSYS2 Lua & Luarocks Environment (UCRT64)
# ------------------------------------------------------------------------------
set -eu

pacman --needed --noconfirm -S \
	mingw-w64-ucrt-x86_64-lua \
	mingw-w64-ucrt-x86_64-luajit \
	mingw-w64-ucrt-x86_64-lua-luarocks

luarocks install lua-cjson 2> "/dev/null" || true
luarocks install luafilesystem 2> "/dev/null" || true
luarocks install luasocket 2> "/dev/null" || true
luarocks install cffi-lua 2> "/dev/null" || true
luarocks install lpeg 2> "/dev/null" || true
luarocks install penlight 2> "/dev/null" || true
