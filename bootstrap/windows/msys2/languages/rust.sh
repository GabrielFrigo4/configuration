#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: MSYS2 Rust Environment (UCRT64)
# ------------------------------------------------------------------------------
set -eu

pacman --needed --noconfirm -S \
	mingw-w64-ucrt-x86_64-rustup \
	mingw-w64-ucrt-x86_64-rust-analyzer

rustup update
rustup default stable
rustup toolchain install stable
rustup toolchain install stable-x86_64-pc-windows-gnullvm
rustup toolchain install stable-x86_64-pc-windows-gnu

cargo install cargo-update 2> "/dev/null" || true
