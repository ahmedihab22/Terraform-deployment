
######################### Security Group Rules #############################

resource "aws_security_group_rule" "example" {
  type                     = var.security_group_rule_type
  from_port                = var.security_group_rule_from_port
  to_port                  = var.security_group_rule_to_port
  protocol                 = var.security_group_rule_protocol
  cidr_blocks              = var.security_group_rule_cidr_blocks
  ipv6_cidr_blocks         = var.security_group_rule_ipv6_cidr_blocks
  security_group_id        = var.security_group_rule_security_group_id
  description              = var.security_group_rule_description
  prefix_list_ids          = var.security_group_rule_prefix_list_ids
  self                     = var.security_group_rule_self
  source_security_group_id = var.security_group_rule_source_security_group_id
}
