#!/bin/bash

# health-check.sh - Basic Linux server health check

set -euo pipefail

LOG_FILE="./health-check.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "======================================" | tee -a "$LOG_FILE"
echo "Health Check Report - $DATE" | tee -a "$LOG_FILE"
echo "======================================" | tee -a "$LOG_FILE"

echo "Uptime:" | tee -a "$LOG_FILE"
uptime | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "Disk Usage:" | tee -a "$LOG_FILE"
df -h | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "Memory Usage:" | tee -a "$LOG_FILE"
free -h | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "Top CPU Processes:" | tee -a "$LOG_FILE"
ps aux --sort=-%cpu | head -n 6 | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "Top Memory Processes:" | tee -a "$LOG_FILE"
ps aux --sort=-%mem | head -n 6 | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "Health check completed." | tee -a "$LOG_FILE"
