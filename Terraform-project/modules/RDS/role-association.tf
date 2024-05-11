######################### role association  #############################

resource "aws_rds_cluster_role_association" "example" {
  db_cluster_identifier = var.db_cluster_identifier
  feature_name          = var.feature_name
  role_arn              = var.role_arn
}