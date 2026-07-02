#!/usr/bin/bash

# Clean .cmd files
for file in $(find /home/gabrielf/Documents/Configuration -name "*.cmd"); do
    # Remove lines starting with "rem " followed by lowercase or http
    # Also standardize "rem ====" to "rem ####"
    awk '
    {
        stripped = $0
        gsub(/^[ \t]+|[ \t\r]+$/, "", stripped)
        
        # Skip literal comments
        if (stripped ~ /^rem [a-z]/ || stripped ~ /^rem http/) {
            next
        }
        
        # Standardize borders
        if (stripped ~ /^rem =+$/ || stripped ~ /^rem -+$/) {
            gsub(/=|-/, "#", $0)
        }
        
        print $0
    }' "$file" > "${file}.tmp"
    mv "${file}.tmp" "$file"
done
