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
