#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file> <line_number>"
    exit 1
fi

# Assign arguments to variables
file=$1
line_number=$2

# Ensure the file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found!"
    exit 1
fi

# Check if line number is a valid number
if ! [[ "$line_number" =~ ^[0-9]+$ ]]; then
    echo "Error: Line number '$line_number' is not a valid number!"
    exit 1
fi

# Use sed to insert the line after the specified line number and save changes in place
# This approach works on both GNU sed and BSD sed (macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "${line_number}a\\    print(\"Joe was here\")" "$file"
else
    sed -i "${line_number}a\\    print(\"Joe was here\")" "$file"
fi

# Output success message
echo "[+] Added print(\"Joe was here\") at line $line_number in $file"

