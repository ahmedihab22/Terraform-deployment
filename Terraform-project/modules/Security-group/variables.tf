######################### Variables for Security Group #############################

variable "security_group_description" {
  description = "The description of the security group."
}

variable "egress_rules" {
  description = "A list of egress rules for the security group."
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    description      = string
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
  }))
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group."
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    description      = string
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
  }))
}

variable "security_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
}

variable "security_group_name" {
  description = "The name of the security group."
}

variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed when managing Security Groups as Terraform will properly manage rules."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "vpc_id" {
  description = "The VPC ID."
}

######################### Variables for Security Group Rules #############################

variable "security_group_rule_type" {
  description = "The type of rule (ingress/egress)."
  default     = "ingress"
}

variable "security_group_rule_from_port" {
  description = "The start port (inclusive) for the rule."
  default     = 0
}

variable "security_group_rule_to_port" {
  description = "The end port (inclusive) for the rule."
  default     = 65535
}

variable "security_group_rule_protocol" {
  description = "The protocol for the rule (tcp, udp, icmp, etc)."
  default     = "tcp"
}

variable "security_group_rule_cidr_blocks" {
  description = "List of CIDR blocks to allow access."
  type        = list(string)
  default     = []
}

variable "security_group_rule_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR blocks to allow access."
  type        = list(string)
  default     = []
}

variable "security_group_rule_security_group_id" {
  description = "The security group ID."
}

variable "security_group_rule_description" {
  description = "The description of the security group rule."
}

variable "security_group_rule_prefix_list_ids" {
  description = "List of prefix list IDs for allowing access to/from VPC endpoints."
  type        = list(string)
  default     = []
}

variable "security_group_rule_self" {
  description = "Whether to allow access from the security group itself."
  type        = bool
  default     = false
}

variable "security_group_rule_source_security_group_id" {
  description = "The security group ID to allow access from."
}

######################### Variables for Security Group association #############################

variable "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint."
}

variable "security_group_id" {
  description = "The ID of the security group."
}

variable "replace_default_association" {
  description = "Whether to replace the default security group association."
  type        = bool
  default     = false
}

######################### Variables for Route Table #############################

variable "vpc_id" {
  description = "The ID of the VPC where the route table resides."
}

variable "cidr_block" {
  description = "The IPv4 CIDR block for the route."
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block for the route."
}

variable "destination_prefix_list_id" {
  description = "The ID of the prefix list for the route."
}

variable "carrier_gateway_id" {
  description = "The ID of the carrier gateway for the route."
}

variable "egress_only_gateway_id" {
  description = "The ID of the egress-only internet gateway for the route."
}

variable "gateway_id" {
  description = "The ID of the internet gateway for the route."
}

variable "local_gateway_id" {
  description = "The ID of the local gateway for the route."
}

variable "nat_gateway_id" {
  description = "The ID of the NAT gateway for the route."
}

variable "network_interface_id" {
  description = "The ID of the network interface for the route."
}

variable "transit_gateway_id" {
  description = "The ID of the transit gateway for the route."
}

variable "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint for the route."
}

variable "vpc_peering_connection_id" {
  description = "The ID of the VPC peering connection for the route."
}

variable "tags" {
  description = "A map of tags to assign to the route table."
  type        = map(string)
}

variable "propagating_vgws" {
  description = "A list of virtual gateways for route propagation."
  type        = list(string)
}

variable "core_network_arn" {
  description = "The Amazon Resource Name (ARN) of the core network."
}

######################### Variables for Route Table Association #############################

variable "subnet_id" {
  description = "The ID of the subnet to associate with the route table."
}

variable "route_table_id" {
  description = "The ID of the route table to associate with the subnet."
}

variable "gateway_id" {
  description = "The ID of the gateway associated with the route table."
}
######################### Variables for End Point Route Table Association #############################

variable "route_table_id" {
  description = "The ID of the route table to associate with the VPC endpoint."
}

variable "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint to associate with the route table."
}
