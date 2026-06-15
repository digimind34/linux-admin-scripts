#!/bin/bash

# cleanup-logs.sh - Safely clean old log files with dry-run support

set -euo pipefail

LOG_DIR="${1:-/var/log}"
RETENTION_DAYS="${2:-7}"
MODE="${3:-dry-run}"
REPORT_FILE="./cleanup-logs.log"

if [[ "$(uname)" != "Linux" ]]; then
  echo "This script is intended for Linux systems."
  exit 1
fi

if [[ ! -d "$LOG_DIR" ]]; then
  echo "Error: Log directory does not exist: $LOG_DIR"
  exit 1
fi

if [[ ! "$RETENTION_DAYS" =~ ^[0-9]+$ ]]; then
  echo "Error: Retention days must be a number."
  exit 1
fi

echo "======================================" | tee -a "$REPORT_FILE"
echo "Log Cleanup Report - $(date)" | tee -a "$REPORT_FILE"
echo "Directory: $LOG_DIR" | tee -a "$REPORT_FILE"
echo "Retention: $RETENTION_DAYS days" | tee -a "$REPORT_FILE"
echo "Mode: $MODE" | tee -a "$REPORT_FILE"
echo "======================================" | tee -a "$REPORT_FILE"

if [[ "$MODE" == "dry-run" ]]; then
  find "$LOG_DIR" -type f -name "*.log" -mtime +"$RETENTION_DAYS" -print | tee -a "$REPORT_FILE"
  echo "Dry-run completed. No files were deleted." | tee -a "$REPORT_FILE"

elif [[ "$MODE" == "delete" ]]; then
  find "$LOG_DIR" -type f -name "*.log" -mtime +"$RETENTION_DAYS" -print -delete | tee -a "$REPORT_FILE"
  echo "Cleanup completed. Matching old log files were deleted." | tee -a "$REPORT_FILE"

else
  echo "Error: Invalid mode. Use dry-run or delete."
  exit 1
fi
