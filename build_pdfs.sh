#!/usr/bin/env bash
# recurse-make.sh
# Recursively descend into subdirectories and run make if a Makefile exists

set -e  # Exit immediately on error
set -o pipefail

# Starting directory (default is current)
ROOT_DIR="${1:-.}"

# Find directories containing a Makefile or makefile
find "$ROOT_DIR" -type f \( -iname 'Makefile' -o -iname 'makefile' \) | while read -r makefile; do
    dir="$(dirname "$makefile")"
    echo "Entering directory: $dir"
    (
        cd "$dir" || exit 1
        make
    )
    echo "Leaving directory: $dir"
    echo
done

