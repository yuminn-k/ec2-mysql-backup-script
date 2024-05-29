#!/bin/bash

# Load environment variables from .env file
set -o allexport
source .env
set -o allexport

# Linuxの現在時刻を時間形式に合わせて出力する。
DATE=$(date +%Y_%m_%d_%H_%M_%S)

# MySQLの.sqlファイルをバックアップするディレクトリの位置を指定します。
DB_BACKUP_DIR=/home/ubuntu/MySQL_Backup/

# DATE変数の現在時刻を出力します。
echo $DATE

# DB_BACKUP_DIR 変数の作業するディレクトリを出力します。
echo $DB_BACKUP_DIR

# mysqldumpコマンドを利用してデータベースを.sqlファイルとして保存します。
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $DB_BACKUP_DIR/$DB_NAME-$DATE.sql

# バックアップファイルを保存するフォルダから7日前に作成されたすべてのファイルを削除します。 (サブディレクトリまで)
find $DB_BACKUP_DIR -ctime +7 -exec rm -f {} \;
