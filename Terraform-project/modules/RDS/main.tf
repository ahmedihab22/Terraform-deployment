######################### RDS  #############################
resource "aws_rds_cluster" "default" {
  allocated_storage                   = var.allocated_storage
  allow_major_version_upgrade         = var.allow_major_version_upgrade
  apply_immediately                   = var.apply_immediately
  availability_zones                  = var.availability_zones
  backtrack_window                    = var.backtrack_window
  backup_retention_period             = var.backup_retention_period
  cluster_identifier_prefix           = var.cluster_identifier_prefix
  cluster_identifier                  = var.cluster_identifier
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  database_name                       = var.database_name
  db_cluster_instance_class           = var.db_cluster_instance_class
  db_cluster_parameter_group_name     = var.db_cluster_parameter_group_name
  db_instance_parameter_group_name    = var.db_instance_parameter_group_name
  db_subnet_group_name                = var.db_subnet_group_name
  db_system_id                        = var.db_system_id
  delete_automated_backups            = var.delete_automated_backups
  deletion_protection                 = var.deletion_protection
  domain                              = var.domain
  domain_iam_role_name                = var.domain_iam_role_name
  enable_global_write_forwarding      = var.enable_global_write_forwarding
  enable_http_endpoint                = var.enable_http_endpoint
  enable_local_write_forwarding       = var.enable_local_write_forwarding
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  engine_mode                         = var.engine_mode
  engine_version                      = var.engine_version
  engine                              = var.engine
  final_snapshot_identifier           = var.final_snapshot_identifier
  global_cluster_identifier           = var.global_cluster_identifier
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  iam_roles                           = var.iam_roles
  iops                                = var.iops
  kms_key_id                          = var.kms_key_id
  manage_master_user_password         = var.manage_master_user_password
  master_password                     = var.master_password
  master_user_secret_kms_key_id       = var.master_user_secret_kms_key_id
  master_username                     = var.master_username
  network_type                        = var.network_type
  port                                = var.port
  preferred_backup_window             = var.preferred_backup_window
  preferred_maintenance_window        = var.preferred_maintenance_window
  replication_source_identifier       = var.replication_source_identifier
  skip_final_snapshot                 = var.skip_final_snapshot
  snapshot_identifier                 = var.snapshot_identifier
  source_region                       = var.source_region
  storage_encrypted                   = var.storage_encrypted
  storage_type                        = var.storage_type
  tags                                = var.tags
  vpc_security_group_ids              = var.vpc_security_group_ids
}
######################### cluster instances  #############################

resource "aws_rds_cluster_instance" "cluster_instances" {
  count                                 = var.count
  apply_immediately                     = var.apply_immediately
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  availability_zone                     = var.availability_zone
  ca_cert_identifier                    = var.ca_cert_identifier
  cluster_identifier                    = var.cluster_identifier
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot
  custom_iam_instance_profile           = var.custom_iam_instance_profile
  db_parameter_group_name               = var.db_parameter_group_name
  db_subnet_group_name                  = var.db_subnet_group_name
  engine_version                        = var.engine_version
  engine                                = var.engine
  identifier_prefix                     = var.identifier_prefix
  identifier                            = var.identifier
  instance_class                        = var.instance_class
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = var.monitoring_role_arn
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period
  preferred_backup_window               = var.preferred_backup_window
  preferred_maintenance_window          = var.preferred_maintenance_window
  promotion_tier                        = var.promotion_tier
  publicly_accessible                   = var.publicly_accessible
  tags                                  = var.tags
}
######################### endpoint  #############################
resource "aws_rds_cluster_endpoint" "eligible" {
  cluster_identifier          = var.cluster_identifier
  cluster_endpoint_identifier = var.cluster_endpoint_identifier
  custom_endpoint_type        = var.custom_endpoint_type
  excluded_members            = var.excluded_members
  tags                        = var.tags
}

resource "aws_rds_cluster_endpoint" "static" {
  cluster_identifier          = var.cluster_identifier
  cluster_endpoint_identifier = var.cluster_endpoint_identifier
  custom_endpoint_type        = var.custom_endpoint_type
  static_members              = var.static_members
  tags                        = var.tags
}
######################### parameter group  #############################

resource "aws_rds_cluster_parameter_group" "default" {
  name        = var.name
  name_prefix = var.name_prefix
  family      = var.family
  description = var.description
  parameter {
    name  = var.parameters[0]["name"]
    value = var.parameters[0]["value"]
  }

  parameter {
    name  = var.parameters[1]["name"]
    value = var.parameters[1]["value"]
  }
  tags = var.tags
}
######################### role association  #############################

resource "aws_rds_cluster_role_association" "example" {
  db_cluster_identifier = var.db_cluster_identifier
  feature_name          = var.feature_name
  role_arn              = var.role_arn
}
######################### Activity stream  #############################

resource "aws_rds_cluster_activity_stream" "default" {
  resource_arn        = var.resource_arn
  mode                = var.mode
  kms_key_id          = var.kms_key_id
  kinesis_stream_name = var.kinesis_stream_name

  depends_on = [aws_rds_cluster_instance.default]
}