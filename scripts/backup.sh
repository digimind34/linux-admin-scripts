#!/bin/bash

# backup.sh - Simple production-style backup script

set -euo pipefail

SOURCE_DIR="${1:-}"
BACKUP_DIR="${2:-./backups}"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="./backup.log"

if [[ -z "$SOURCE_DIR" ]]; then
  echo "Usage: $0 <source_directory> [backup_directory]"
  exit 1
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Error: Source directory does not exist: $SOURCE_DIR"
  exit 1
fi

mkdir -p "$BACKUP_DIR"

BACKUP_NAME="backup_$(basename "$SOURCE_DIR")_$DATE.tar.gz"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

echo "[$(date)] Starting backup of $SOURCE_DIR" | tee -a "$LOG_FILE"

tar -czf "$BACKUP_PATH" "$SOURCE_DIR"

echo "[$(date)] Backup completed: $BACKUP_PATH" | tee -a "$LOG_FILE"