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