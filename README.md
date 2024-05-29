# EC2 MySQL Backup Script

This repository contains a shell script to automate MySQL backups on an Amazon EC2 instance. The script performs hourly backups and automatically deletes backups that are older than 7 days.

## Features

- Hourly MySQL backups
- Automatic deletion of backups older than 7 days
- Configurable via environment variables

## Prerequisites

- Amazon EC2 instance running a compatible Linux distribution
- MySQL/MariaDB server installed and running
- Sufficient disk space for storing backups

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yuminn-k/ec2-mysql-backup-script.git
   cd ec2-mysql-backup-script
   ```

2. **Make the Script Executable**

   ```bash
   chmod +x backup.sh
   ```

3. **Configure Environment Variables**

   Create a `.env` file in the repository root and set the following variables:

   ```bash
   DB_USER="your_mysql_user"
   DB_PASSWORD="your_mysql_password"
   DB_NAME="your_database_name"
   BACKUP_DIR="/path/to/backup/directory"
   ```

## Usage

1. **Running the Script Manually**

   You can run the backup script manually using the following command:

   ```bash
   ./backup.sh
   ```

2. **Setting Up a Cron Job**

   To automate the backups, set up a cron job that runs the script every hour:

   ```bash
   crontab -e
   ```

   Add the following line to the crontab file:

   ```bash
   0 * * * * /path/to/ec2-mysql-backup-script/backup.sh >> /path/to/logfile.log 2>&1
   ```

   This will run the script at the beginning of every hour and log the output to `logfile.log`.

## Script Details

The `backup.sh` script performs the following actions:

1. Creates a backup of the specified MySQL database.
2. Stores the backup in the designated directory with a timestamp.
3. Deletes backups older than 7 days.

### Blog
For a detailed walkthrough and additional information, please visit my [blog post](https://yuminnk-devlog.vercel.app/ec2%E4%B8%8Amysql%E8%87%AA%E5%8B%95%E8%A8%AD%E5%AE%9A).
