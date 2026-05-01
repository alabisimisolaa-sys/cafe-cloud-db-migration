# Café Cloud Database Migration

## Project Overview
This project demonstrates the migration of a production MariaDB database from a local EC2 instance to a fully managed **Amazon RDS** instance. This shift implements a decoupled architecture, improving scalability, security, and high availability.

## Technical Stack
* **Cloud Provider:** Amazon Web Services (AWS)
* **Database:** MariaDB (Amazon RDS)
* **Compute:** Amazon EC2 (Linux/LAMP Stack)
* **Management Tools:** AWS CLI, Systems Manager (Parameter Store), EC2 Instance Connect

## Infrastructure Implementation
1. **Networking:** Created two private subnets across different Availability Zones (`us-west-2a` and `us-west-2b`) to support an RDS DB Subnet Group.
2. **Security:** Configured a dedicated Security Group (`CafeDatabaseSG`) with ingress rules restricted to port `3306` from the web server's security group.
3. **Database Provisioning:** Launched an RDS MariaDB instance (v10.5) using the AWS CLI.

## Migration Process
* **Data Extraction:** Utilized `mysqldump` on the source EC2 instance to create a logical backup of the `cafe_db`.
* **Data Loading:** Restored the SQL dump into the RDS endpoint using the MySQL CLI client.
* **Cutover:** Updated the application's database endpoint dynamically via **AWS Systems Manager Parameter Store**, eliminating the need for code changes or server restarts.

## Lessons Learned & Troubleshooting
* **Version Compatibility:** Encountered a region-specific versioning error (10.5.13); resolved by pivoting to the stable `10.5` engine version.
* **Access Management:** Resolved `Access Denied` errors by performing a master password reset through the RDS Console with the "Apply Immediately" configuration.
* **Infrastructure as Code:** Practiced the "CLI-first" approach for creating subnets and security groups to ensure repeatable deployment steps.
