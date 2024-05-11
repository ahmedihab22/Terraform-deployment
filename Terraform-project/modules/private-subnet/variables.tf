variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "assign_ipv6_address_on_creation" {
  description = "Whether to assign IPv6 addresses to instances launched in this subnet."
  type        = bool
  default     = false
}

variable "availability_zone_id" {
  description = "The ID of the Availability Zone for the subnet."
  type        = string
}

variable "customer_owned_ipv4_pool" {
  description = "The ID of the customer-owned IPv4 address pool."
  type        = string
}

variable "enable_dns64" {
  description = "Whether to enable DNS64 support."
  type        = bool
  default     = false
}

variable "enable_lni_at_device_index" {
  description = "Whether to enable Local Network Interface at Device Index."
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_aaaa_record_on_launch" {
  description = "Whether to enable DNS AAAA resource name for launch."
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_a_record_on_launch" {
  description = "Whether to enable DNS A resource name for launch."
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block."
  type        = string
}

variable "ipv6_native" {
  description = "Whether the IPv6 CIDR block is for an IPv6 VPC."
  type        = bool
  default     = false
}

variable "map_customer_owned_ip_on_launch" {
  description = "Whether to map customer-owned IP on launch."
  type        = bool
  default     = false
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IP on launch."
  type        = bool
  default     = false
}

variable "outpost_arn" {
  description = "The ARN of the Outpost."
  type        = string
}

variable "private_dns_hostname_type_on_launch" {
  description = "The private DNS hostname type."
  type        = string
  default     = "IpHostname" // Options: "Dns", "IpHostname"
}
variable "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  type        = string
}

variable "private_route_cidr_block" {
  description = "CIDR block for the private route"
  type        = string
  default     = "0.0.0.0/0"
}