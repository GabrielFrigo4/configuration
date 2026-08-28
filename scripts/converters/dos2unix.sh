#!/usr/bin/env sh
# ------------------------------------------------------------------------------
# Recipe: dos2unix Converter (CRLF -> LF)
# ------------------------------------------------------------------------------
set -eu

CR="$(printf '\r')"

find . -type f \( -name "*.sh" -o -name "*.ps1" -o -name "*.lua" -o -name "*.cmd" -o -name "*.md" -o -name "*.nu" \) | while read -r FILE_PATH; do
	if grep -q "${CR}" "$FILE_PATH" 2> "/dev/null"; then
		TEMP_FILE="$(mktemp)"
		tr -d '\r' < "$FILE_PATH" > "$TEMP_FILE"
		mv "$TEMP_FILE" "$FILE_PATH"
		printf "\033[32mLF: %s\033[0m\n" "$(basename "$FILE_PATH")"
	fi
done
