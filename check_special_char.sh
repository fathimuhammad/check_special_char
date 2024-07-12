#!/bin/bash

# Pastikan argumen script adalah file log yang ingin diperiksa
if [ $# -ne 1 ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

logfile="$1"

# Memeriksa keberadaan file log
if [ ! -f "$logfile" ]; then
    echo "Error: File '$logfile' not found!"
    exit 1
fi

# Fungsi untuk melakukan check spesial karakter
check_special_characters() {
    local file="$1"
    local special_characters
    special_characters=$(grep -o '[^a-zA-Z0-9[:space:]]' "$file" | sort -u)

    if [ -z "$special_characters" ]; then
        echo "No special characters found in $file."
    else
        echo "Special characters found in $file:"
        echo "$special_characters"
    fi
}

# Memanggil fungsi untuk memeriksa spesial karakter di file log
check_special_characters "$logfile"
