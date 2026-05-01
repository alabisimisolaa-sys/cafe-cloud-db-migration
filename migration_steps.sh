#!/bin/bash
# Cafe Database Migration Automation Script

# 1. Export local data
mysqldump --user=root --password='Re:Start!9' --databases cafe_db --add-drop-database > cafedb-backup.sql

# 2. Migration to RDS (Replace <ENDPOINT> with your actual RDS Endpoint)
# mysql -h <ENDPOINT> -u root -p < cafedb-backup.sql

# 3. Update Parameter Store via CLI (Automation Step)
# aws ssm put-parameter --name "/cafe/dbUrl" --value "<ENDPOINT>" --type "String" --overwrite
