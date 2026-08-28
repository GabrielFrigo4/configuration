#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: MSYS2 Micro Editor Setup (UCRT64)
# ------------------------------------------------------------------------------
set -eu

pacman --needed --noconfirm -S mingw-w64-ucrt-x86_64-micro

mkdir -p "${HOME}/.config/micro/colorschemes"
if [ ! -f "${HOME}/.config/micro/colorschemes/dracula.micro" ]; then
	_tmp="$(mktemp -d)"
	git clone --depth 1 "https://github.com/dracula/micro.git" "${_tmp}"
	cp "${_tmp}/dracula.micro" "${HOME}/.config/micro/colorschemes/dracula.micro"
	rm -rf "${_tmp}"
fi

cat << 'EOF' | tee "${HOME}/.config/micro/settings.json" > "/dev/null"
{
	"colorscheme": "dracula"
}
EOF
