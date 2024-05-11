variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support for the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "The allowed tenancy of instances launched into the VPC"
  type        = string
  default     = "default" // Options: "default", "dedicated"
}
variable "ipv4_ipam_pool_id" {
  description = "ID of the IPv4 IP Address Management (IPAM) pool"
  type        = string
}

variable "ipv4_netmask_length" {
  description = "Netmask length for the IPv4 CIDR block"
  type        = number
}

variable "ipv6_cidr_block" {
  description = "CIDR block for the IPv6 VPC"
  type        = string
}

variable "ipv6_ipam_pool_id" {
  description = "ID of the IPv6 IP Address Management (IPAM) pool"
  type        = string
}

variable "ipv6_netmask_length" {
  description = "Netmask length for the IPv6 CIDR block"
  type        = number
}

variable "ipv6_cidr_block_network_border_group" {
  description = "The network border group for the IPv6 CIDR block"
  type        = string
}

variable "enable_network_address_usage_metrics" {
  description = "Enable network address usage metrics for the VPC"
  type        = bool
  default     = false
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Assign a generated IPv6 CIDR block for the VPC"
  type        = bool
  default     = false
}
