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

######################### Security Group association #############################

resource "aws_vpc_endpoint_security_group_association" "sg_ec2" {
  vpc_endpoint_id             = var.vpc_endpoint_id
  security_group_id           = var.security_group_id
  replace_default_association = var.replace_default_association
}

######################### Route Table #############################
resource "aws_route_table" "example" {
  vpc_id = var.vpc_id

  route {
    cidr_block                 = var.cidr_block
    ipv6_cidr_block            = var.ipv6_cidr_block
    destination_prefix_list_id = var.destination_prefix_list_id
    carrier_gateway_id         = var.carrier_gateway_id
    egress_only_gateway_id     = var.egress_only_gateway_id
    gateway_id                 = var.gateway_id
    local_gateway_id           = var.local_gateway_id
    nat_gateway_id             = var.nat_gateway_id
    network_interface_id       = var.network_interface_id
    transit_gateway_id         = var.transit_gateway_id
    vpc_endpoint_id            = var.vpc_endpoint_id
    vpc_peering_connection_id  = var.vpc_peering_connection_id
    core_network_arn           = var.core_network_arn
  }

  tags = var.tags

  propagating_vgws = var.propagating_vgws
}

######################### Route Table Association #############################


resource "aws_route_table_association" "a" {
  subnet_id      = var.subnet_id
  route_table_id = var.route_table_id
  gateway_id     = var.gateway_id
}

######################### End point Route Table Association #############################

resource "aws_vpc_endpoint_route_table_association" "example" {
  route_table_id  = var.route_table_id
  vpc_endpoint_id = var.vpc_endpoint_id
}
