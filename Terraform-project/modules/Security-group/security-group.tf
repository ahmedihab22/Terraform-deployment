resource "aws_security_group" "example_security_group" {
  description            = var.security_group_description
  egress                 = var.egress_rules
  ingress                = var.ingress_rules
  name_prefix            = var.security_group_name_prefix
  name                   = var.security_group_name
  revoke_rules_on_delete = var.revoke_rules_on_delete
  tags                   = var.tags
  vpc_id                 = var.vpc_id
}
