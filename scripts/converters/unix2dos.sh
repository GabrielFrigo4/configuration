#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: unix2dos Converter (LF -> CRLF)
# ------------------------------------------------------------------------------
set -eu

CR="$(printf '\r')"

find . -type f \( -name "*.cmd" -o -name "*.reg" \) | while read -r FILE_PATH; do
	if ! grep -q "${CR}" "$FILE_PATH" 2> "/dev/null"; then
		TEMP_FILE="$(mktemp)"
		sed 's/$/\r/' "$FILE_PATH" > "$TEMP_FILE"
		mv "$TEMP_FILE" "$FILE_PATH"
		printf "\033[32mCRLF: %s\033[0m\n" "$(basename "$FILE_PATH")"
	fi
done
