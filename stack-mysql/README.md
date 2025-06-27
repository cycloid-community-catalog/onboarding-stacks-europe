# MySQL Database Stack

This Cycloid stack deploys MySQL managed databases on AWS, Azure, and GCP cloud providers.

## Overview

The MySQL stack provides a unified way to deploy MySQL databases across multiple cloud providers:

- **AWS**: Amazon RDS for MySQL
- **Azure**: Azure Database for MySQL Flexible Server
- **GCP**: Google Cloud SQL for MySQL

## Features

- **Multi-cloud support**: Deploy on AWS, Azure, or GCP
- **Managed databases**: Fully managed MySQL instances with automatic backups
- **Security**: Built-in security groups, VPC integration, and encryption
- **Scalability**: Configurable instance sizes and storage
- **Monitoring**: Integration with cloud provider monitoring services
- **Backup**: Automated backup configuration with configurable retention

## Cloud Provider Details

### AWS RDS for MySQL

- **Engine**: MySQL 8.0.x or 5.7.x
- **Instance Types**: db.t4g.micro, db.t4g.small, db.t4g.medium, db.t4g.large, db.t4g.xlarge
- **Storage**: 10-100 GB allocated storage
- **Features**: Multi-AZ deployment, automated backups, encryption at rest

### Azure Database for MySQL Flexible Server

- **Engine**: MySQL 8.0.21 or 5.7
- **SKUs**: B_Standard_B1ms, B_Standard_B2s, B_Standard_B2ms, GP_Standard_D2ds_v4, GP_Standard_D4ds_v4
- **Storage**: 32 GB to 1 TB
- **Features**: Flexible server, geo-redundant backups, private networking

### Google Cloud SQL for MySQL

- **Engine**: MySQL 8.0 or 5.7
- **Machine Types**: db-f1-micro and other standard types
- **Storage**: Configurable disk size with SSD or HDD options
- **Features**: Private networking, automated backups, point-in-time recovery

## Configuration

### Common Parameters

- **Database Name**: Name of the database to create
- **Username**: Database administrator username
- **Region/Zone**: Cloud provider region for deployment
- **Backup Retention**: Number of days to retain backups
- **Destroy Timer**: Minutes to wait before auto-destroy (for testing)

### Cloud-Specific Parameters

#### AWS
- **Engine Version**: MySQL version (8.0.35, 8.0.34, etc.)
- **Instance Class**: RDS instance type
- **Allocated Storage**: Storage size in GB
- **Subnet Selection**: Create new or use existing subnets

#### Azure
- **Server Name**: MySQL Flexible Server name
- **MySQL Version**: 8.0.21 or 5.7
- **SKU Name**: Server tier and size
- **Storage Size**: Storage in MB (32 GB to 1 TB)
- **Resource Group**: Create new or use existing

#### GCP
- **MySQL Version**: MYSQL_8_0 or MYSQL_5_7
- **Machine Type**: Cloud SQL machine type
- **Disk Size**: Storage size in GB
- **Disk Type**: PD_SSD or PD_HDD
- **VPC Network**: Optional VPC network connection

## Usage

1. **Select Cloud Provider**: Choose AWS, Azure, or GCP use case
2. **Configure Access**: Provide cloud provider credentials
3. **Set Database Parameters**: Configure MySQL version, size, and storage
4. **Network Configuration**: Set up networking and security
5. **Deploy**: The stack will create the MySQL database instance

## Outputs

### AWS
- `rds_endpoint`: Connection endpoint
- `rds_port`: Database port (3306)
- `database_name`: Database name

### Azure
- `mysql_server_fqdn`: Server FQDN
- `mysql_server_name`: Server name
- `database_name`: Database name

### GCP
- `instance_name`: Cloud SQL instance name
- `connection_name`: Connection name
- `public_ip_address`: Public IP (if enabled)
- `private_ip_address`: Private IP
- `database_name`: Database name
- `database_user`: Database user

## Security

- **Encryption**: All data encrypted at rest
- **Network Security**: VPC/private networking support
- **Access Control**: Database user authentication
- **Backup Security**: Encrypted backups with configurable retention

## Monitoring

Each cloud provider offers native monitoring:
- **AWS**: CloudWatch metrics
- **Azure**: Azure Monitor
- **GCP**: Cloud Monitoring

## Cost Optimization

- **Instance Sizing**: Start with smaller instances and scale as needed
- **Storage**: Choose appropriate storage types and sizes
- **Backup Retention**: Configure retention based on requirements
- **Auto-destroy**: Use destroy timer for testing environments

## Support

For issues or questions:
- Check cloud provider documentation
- Review Terraform logs in Cycloid pipeline
- Contact your Cycloid administrator

## Version History

- **v1.0.0**: Initial release with AWS, Azure, and GCP support 