#!/bin/bash

# disk-monitor.sh - Monitor disk usage and alert on threshold

set -euo pipefail

if [[ "$(uname)" != "Linux" ]]; then
    echo "This script is intended for Linux systems."
    exit 1
fi

THRESHOLD="${1:-80}"
LOG_FILE="./disk-monitor.log"

echo "======================================" | tee -a "$LOG_FILE"
echo "Disk Monitor Report - $(date)" | tee -a "$LOG_FILE"
echo "Threshold: ${THRESHOLD}%" | tee -a "$LOG_FILE"
echo "======================================" | tee -a "$LOG_FILE"

df -hP | awk 'NR>1 {print $1, $5, $6}' | while read -r filesystem usage mountpoint
do
    usage_percent=$(echo "$usage" | sed 's/%//')

    if [[ "$usage_percent" =~ ^[0-9]+$ ]]; then

        if (( usage_percent >= THRESHOLD )); then
            echo "WARNING: $filesystem mounted on $mountpoint is ${usage_percent}% full" | tee -a "$LOG_FILE"
        else
            echo "OK: $filesystem mounted on $mountpoint is ${usage_percent}% full" | tee -a "$LOG_FILE"
        fi

    else
        echo "Skipping invalid disk usage value: $usage" | tee -a "$LOG_FILE"
    fi

done
echo "" | tee -a "$LOG_FILE"
echo "Disk monitoring completed." | tee -a "$LOG_FILE"
