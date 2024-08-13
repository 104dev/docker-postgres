#!/bin/bash
set -e

# 新しいロールとデータベースの作成
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE USER app_user WITH PASSWORD 'app_password';
  CREATE DATABASE app_db;
  GRANT ALL PRIVILEGES ON DATABASE app_db TO app_user;
EOSQL
