#!/bin/bash

# create-user.sh - Create a Linux user with logging and validation

set -euo pipefail

LOG_FILE="./create-user.log"
USERNAME="${1:-}"

if [[ $EUID -ne 0 ]]; then
  echo "Error: This script must be run as root or with sudo."
  echo "Example: sudo ./scripts/create-user.sh username"
  exit 1
fi

if [[ -z "$USERNAME" ]]; then
  echo "Usage: sudo $0 <username>"
  exit 1
fi

if [[ ! "$USERNAME" =~ ^[a-z_][a-z0-9_-]*[$]?$ ]]; then
  echo "Error: Invalid username."
  exit 1
fi

if id "$USERNAME" >/dev/null 2>&1; then
  echo "Error: User '$USERNAME' already exists."
  exit 1
fi

echo "[$(date)] Creating user: $USERNAME" | tee -a "$LOG_FILE"

useradd -m -s /bin/bash "$USERNAME"

passwd "$USERNAME"

echo "[$(date)] User '$USERNAME' created successfully." | tee -a "$LOG_FILE"
