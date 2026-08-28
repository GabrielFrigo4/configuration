#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: MSYS2 Python Environment (UCRT64)
# ------------------------------------------------------------------------------
set -eu

pacman --needed --noconfirm -S \
	mingw-w64-ucrt-x86_64-python \
	mingw-w64-ucrt-x86_64-python-pip \
	mingw-w64-ucrt-x86_64-python-pipx \
	mingw-w64-ucrt-x86_64-uv \
	mingw-w64-ucrt-x86_64-cython \
	mingw-w64-ucrt-x86_64-mypy \
	mingw-w64-ucrt-x86_64-python-capstone \
	mingw-w64-ucrt-x86_64-python-unicorn \
	mingw-w64-ucrt-x86_64-python-cryptography \
	mingw-w64-ucrt-x86_64-python-pynacl \
	mingw-w64-ucrt-x86_64-python-cffi \
	mingw-w64-ucrt-x86_64-python-pywin32 \
	mingw-w64-ucrt-x86_64-python-psutil \
	mingw-w64-ucrt-x86_64-python-zstandard

python -m pip install --break-system-packages \
	six \
	python-dateutil \
	sortedcontainers \
	intervaltree \
	PySocks \
	requests \
	pyserial \
	paramiko \
	pyelftools \
	unix-ar \
	mako \
	colored-traceback \
	weasyprint
