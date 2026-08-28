#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: Custom Vim Configuration
# ------------------------------------------------------------------------------
set -eu

git clone "https://github.com/GabrielFrigo4/vimfiles" "${HOME}/.vim"

cat << 'EOF' | tee "${HOME}/.vimrc" > "/dev/null"
set rtp+=~/.vim
source ~/.vim/vimrc
EOF
