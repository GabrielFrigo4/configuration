#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: FreeBSD Server Base CLI & Version Control Tools
# ------------------------------------------------------------------------------
set -eu

pkg install --yes \
	bash \
	zsh \
	wget \
	wget2 \
	curl \
	git \
	git-credential-oauth \
	gh \
	mandoc

