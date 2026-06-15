# Linux Admin Scripts

Production-ready Bash scripts for Linux system administration and DevOps automation.

![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange)
![Bash](https://img.shields.io/badge/Bash-Scripting-green)
![Git](https://img.shields.io/badge/Git-Version_Control-blue)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## Overview

This repository contains a collection of Linux administration scripts designed to automate common operational tasks. The project demonstrates practical DevOps skills including automation, monitoring, backup management, user administration, logging, and system maintenance.

The scripts follow production-oriented Bash scripting practices such as:

* Input validation
* Error handling
* Logging
* Safe execution
* Reusable automation
* Linux administration best practices

---

## Features

* Automated backups with timestamps
* System health monitoring
* Linux user provisioning
* Disk usage monitoring
* Automated log cleanup
* Logging and reporting
* Production-style Bash scripting

---

## Project Structure

```text
linux-admin-scripts/
├── scripts/
│   ├── backup.sh
│   ├── health-check.sh
│   ├── create-user.sh
│   ├── disk-monitor.sh
│   └── cleanup-logs.sh
│
├── docs/
│
├── screenshots/
│
└── README.md
```

---

## Scripts

### backup.sh

Creates compressed backups with timestamps.

#### Features

* Creates `.tar.gz` archives
* Timestamped backup names
* Logging support
* Source directory validation

#### Example

```bash
./scripts/backup.sh /home/ubuntu/data backups
```

---

### health-check.sh

Generates a server health report.

#### Checks

* System uptime
* Disk usage
* Memory usage
* CPU utilization
* Top resource-consuming processes

#### Example

```bash
./scripts/health-check.sh
```

---

### create-user.sh

Creates Linux users with validation and logging.

#### Features

* Username validation
* Home directory creation
* Password setup
* Logging

#### Example

```bash
sudo ./scripts/create-user.sh devopsuser
```

---

### disk-monitor.sh

Monitors disk usage and generates warnings when usage exceeds a specified threshold.

#### Features

* Configurable threshold
* Warning alerts
* Logging

#### Example

```bash
./scripts/disk-monitor.sh 80
```

---

### cleanup-logs.sh

Safely removes old log files.

#### Features

* Dry-run mode
* Configurable retention period
* Safe deletion
* Reporting

#### Example

Dry Run:

```bash
./scripts/cleanup-logs.sh /var/log 7 dry-run
```

Delete Mode:

```bash
sudo ./scripts/cleanup-logs.sh /var/log 7 delete
```

---

## Example Output

### Disk Monitor

```text
WARNING: /dev/xvda1 mounted on / is 87% full
```

### Backup Script

```text
[2026-06-14] Starting backup...
[2026-06-14] Backup completed successfully.
```

---

## Screenshots

### Backup Script

![Backup Script](screenshots/backup-script.png)

### Health Check

![Health Check](screenshots/health-check.png)

### Disk Monitor

![Disk Monitor](screenshots/disk-monitor.png)

---

## Technologies Used

* Linux
* Bash
* Git
* GitHub
* AWS EC2
* Ubuntu Server

---

## Skills Demonstrated

### Linux Administration

* User management
* Disk management
* Log management
* Process monitoring

### Automation

* Backup automation
* Cleanup automation
* Monitoring automation

### DevOps Practices

* Infrastructure scripting
* Logging
* Error handling
* System monitoring
* Operational automation

---

## Future Enhancements

* Email notifications
* Slack integration
* Cron scheduling examples
* Log rotation support
* Prometheus integration
* Grafana dashboards

---

## Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/linux-admin-scripts.git
```

Navigate to the project:

```bash
cd linux-admin-scripts
```

Make scripts executable:

```bash
chmod +x scripts/*.sh
```
## Screenshots

### Project Structure

![Project Structure](screenshots/project-structure.png)

---

### Backup Script Execution

![Backup Script](screenshots/backup-script.png)

### Backup Log

![Backup Log](screenshots/backup-log.png)

---

### Health Check Report

![Health Check](screenshots/health-check.png)

### Health Check Log

![Health Check Log](screenshots/health-check-log.png)

---

### User Creation

![Create User](screenshots/create-user.png)

### User Verification

![User Verification](screenshots/user-verification.png)

---

### Disk Monitoring

![Disk Monitor](screenshots/disk-monitor.png)

### Disk Monitor Log

![Disk Monitor Log](screenshots/disk-monitor-log.png)

---

### Log Cleanup (Dry Run)

![Cleanup Dry Run](screenshots/cleanup-dry-run.png)

### Log Cleanup (Delete Mode)

![Cleanup Delete](screenshots/cleanup-delete.png)

### Cleanup Log

![Cleanup Log](screenshots/cleanup-log.png)

---

---

### AWS EC2 Testing Environment

![AWS EC2](screenshots/aws-ec2-testing.png)

---

### Repository Homepage

![Repository Homepage](screenshots/repository-homepage.png)

---

## Author

**Babatunde**

DevOps & Cloud Engineer

* GitHub: https://github.com/digimind34
* LinkedIn: https://linkedin.com/in/babatunde-ayo-devops

---

## License

This project is licensed under the MIT License.
