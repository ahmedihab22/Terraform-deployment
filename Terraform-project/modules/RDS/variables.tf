######################### Variavles for RDS  #############################
variable "allocated_storage" {
  description = "The amount of storage to allocate for the DB cluster in gibibytes (GiB)."
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed."
}

variable "apply_immediately" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window."
}

variable "availability_zones" {
  description = "A list of EC2 Availability Zones that instances in the DB cluster can be created in."
  type        = list(string)
}

variable "backtrack_window" {
  description = "The target backtrack window, in seconds. Only available for Aurora MySQL."
}

variable "backup_retention_period" {
  description = "The days to retain backups for."
}

variable "cluster_identifier_prefix" {
  description = "Prefix to use when generating a cluster identifier."
}

variable "cluster_identifier" {
  description = "The cluster identifier."
}

variable "copy_tags_to_snapshot" {
  description = "Specifies whether tags are copied from the DB cluster to snapshots of the DB cluster."
}

variable "database_name" {
  description = "The name for your database of up to 64 alphanumeric characters."
}

variable "db_cluster_instance_class" {
  description = "The compute and memory capacity of the DB cluster."
}

variable "db_cluster_parameter_group_name" {
  description = "The name of the DB cluster parameter group to associate with this DB cluster."
}

variable "db_instance_parameter_group_name" {
  description = "A DB parameter group to associate with this DB instance."
}

variable "db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance."
}

variable "db_system_id" {
  description = "The ID of the DB system that the DB cluster will belong to."
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB cluster is deleted."
}

variable "deletion_protection" {
  description = "Indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled."
}

variable "domain" {
  description = "The Active Directory directory ID to create the DB instance in."
}

variable "domain_iam_role_name" {
  description = "The name of the IAM role to use when making API calls to the Directory Service."
}

variable "enable_global_write_forwarding" {
  description = "Whether to enable the global write forwarder for the Aurora cluster."
}

variable "enable_http_endpoint" {
  description = "Whether to enable the Data API for the Aurora Serverless cluster."
}

variable "enable_local_write_forwarding" {
  description = "Whether to enable the local write forwarder for the Aurora cluster."
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch Logs."
}

variable "engine_mode" {
  description = "The database engine mode."
}

variable "engine_version" {
  description = "The engine version to use."
}

variable "engine" {
  description = "The name of the database engine to be used for this DB cluster."
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB cluster is deleted."
}

variable "global_cluster_identifier" {
  description = "The global cluster identifier."
}

variable "iam_database_authentication_enabled" {
  description = "Whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts."
}

variable "iam_roles" {
  description = "A list of IAM roles that can be associated with the DB cluster."
}

variable "iops" {
  description = "The amount of provisioned IOPS."
}

variable "kms_key_id" {
  description = "The ARN of the AWS Key Management Service (KMS) master key that is used to encrypt the database instances in the DB cluster."
}

variable "manage_master_user_password" {
  description = "Whether to enable the master user password to be managed via the AWS Management Console."
}

variable "master_password" {
  description = "Password for the master DB user."
}

variable "master_user_secret_kms_key_id" {
  description = "The ARN of the AWS Key Management Service (KMS) master key that is used to encrypt the secret for the master DB user."
}

variable "master_username" {
  description = "Username for the master DB user."
}

variable "network_type" {
  description = "The network type to use for the DB cluster."
}

variable "port" {
  description = "The port number on which the DB cluster accepts connections."
}

variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created."
}

variable "preferred_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur, in UTC."
}

variable "replication_source_identifier" {
  description = "The Amazon Resource Name (ARN) of the source DB cluster or DB instance if this DB cluster is a read replica."
}

variable "restore_to_point_in_time" {
  description = "The date and time to restore the DB cluster to."
}

variable "scaling_configuration" {
  description = "Nested attribute specifying scaling properties for an Aurora Serverless DB cluster."
}

variable "serverlessv2_scaling_configuration" {
  description = "Nested attribute specifying scaling properties for an Aurora Serverless v2 DB cluster."
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted."
}

variable "snapshot_identifier" {
  description = "The name of the DB snapshot to restore from."
}

variable "source_region" {
  description = "The source region for an encrypted DB cluster."
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted."
}

variable "storage_type" {
  description = "The storage type associated with the DB cluster."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security groups associated with the DB cluster."
  type        = list(string)
}
######################### Variables for activity stream  #############################

variable "resource_arn" {
  description = "The Amazon Resource Name (ARN) of the RDS cluster."
}

variable "mode" {
  description = "The mode of the activity stream."
}

variable "kms_key_id" {
  description = "The ARN for the KMS key to encrypt the stream."
}

variable "kinesis_stream_name" {
  description = "The name of the Kinesis data stream to be used for the database activity stream."
}
######################### Variables for endpoint  #############################

variable "cluster_identifier" {
  description = "The identifier of the RDS cluster."
}

variable "cluster_endpoint_identifier" {
  description = "The identifier to use for the new endpoint."
}

variable "custom_endpoint_type" {
  description = "The type of the endpoint."
}

variable "excluded_members" {
  description = "List of DB instance identifiers that aren't part of the custom endpoint group."
  type        = list(string)
}

variable "static_members" {
  description = "List of DB instance identifiers that are part of the custom endpoint group."
  type        = list(string)
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

######################### Variables for endpoint  #############################


variable "count" {
  description = "The number of RDS cluster instances to create."
}

variable "apply_immediately" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window."
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades are applied automatically to the DB instance during the maintenance window."
}

variable "availability_zone" {
  description = "The Availability Zone where the DB instance will be created."
}

variable "ca_cert_identifier" {
  description = "The identifier of the CA certificate for the DB instance."
}

variable "cluster_identifier" {
  description = "The identifier of the RDS cluster."
}

variable "copy_tags_to_snapshot" {
  description = "Determines whether tags are copied from the DB instance to snapshots of the DB instance."
}

variable "custom_iam_instance_profile" {
  description = "The name of the IAM role to associate with the DB instance."
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group to associate with this DB instance."
}

variable "db_subnet_group_name" {
  description = "The name of a DB subnet group to associate with this DB instance."
}

variable "engine_version" {
  description = "The version number of the database engine to use."
}

variable "engine" {
  description = "The name of the database engine to be used for this DB instance."
}

variable "identifier_prefix" {
  description = "Prefix to use when generating an identifier for the DB instance."
}

variable "identifier" {
  description = "The name of the RDS instance."
}

variable "instance_class" {
  description = "The class of the instance."
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance."
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
}

variable "performance_insights_enabled" {
  description = "Indicates whether Performance Insights is enabled."
}

variable "performance_insights_kms_key_id" {
  description = "The ARN of the KMS key used to encrypt Performance Insights data."
}

variable "performance_insights_retention_period" {
  description = "The amount of time, in days, to retain Performance Insights data."
}

variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created."
}

variable "preferred_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur, in UTC."
}

variable "promotion_tier" {
  description = "A value that specifies the order in which an Aurora Replica is promoted to the primary instance after a failure of the existing primary instance."
}

variable "publicly_accessible" {
  description = "Determines if the DB instance can be publicly accessed from the internet."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}


######################### Variables for parameter group  #############################
variable "name" {
  description = "The name of the DB cluster parameter group."
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
}

variable "family" {
  description = "The family of the DB cluster parameter group."
}

variable "description" {
  description = "The description of the DB cluster parameter group."
}

variable "parameters" {
  description = "A list of DB cluster parameters to apply."
  type = list(object({
    name  = string
    value = string
  }))

}
variable "tags" {
  description = "A mapping of tags to assign to the resource."
}
######################### Variables for role association  #############################

variable "db_cluster_identifier" {
  description = "The identifier of the RDS cluster."
}

variable "feature_name" {
  description = "The name of the feature associated with the IAM role."
}

variable "role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role to associate with the RDS cluster."
}
