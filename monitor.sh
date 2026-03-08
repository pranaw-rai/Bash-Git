#!/bin/bash
set -euo pipefail

echo "Monitoring Log file"
echo "-------------------------------------"

file=$1
if [[ "$file" -z ]]; then
    echo "Enter a file name! | Usage: ./scriptname filename.txt"
    exit 1
elif ! [[ "$file" -f ]]; then
    echo "File doesnt exist!"
    exit 1
else
    repo="report.tmp"
    touch "$repo"
    echo "$repo: Report file is created"
    
    trap 'echo "Stopping monitoring..."; exit' EXIT SIGINT
    
    echo "Monitoring Started"...
    echo "Press CTR-C to Stop"
    
    count=1
    while true; do
    	grep -c "error" "$repo" >> "$repo"
	grep -c "warning" "$file" >> "$repo"
	wc -l "$file" >> "$repo"	
