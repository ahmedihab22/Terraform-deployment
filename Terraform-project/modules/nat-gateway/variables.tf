variable "public_subnet_id" {
  description = "ID of the public subnet where the public NAT Gateway will be created"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet where the private NAT Gateway will be created"
  type        = string
}

variable "public_elastic_ip_allocation_id" {
  description = "ID of the Elastic IP address to associate with the public NAT Gateway"
  type        = string
}

variable "private_elastic_ip_allocation_id" {
  description = "ID of the Elastic IP address to associate with the private NAT Gateway"
  type        = string
}

variable "public_nat_gateway_connectivity_type" {
  description = "The type of NAT connectivity for the public NAT Gateway. Value must be either 'internet' or 'vpc'"
  type        = string
  default     = "internet"
}

variable "private_nat_gateway_connectivity_type" {
  description = "The type of NAT connectivity for the private NAT Gateway. Value must be either 'internet' or 'vpc'"
  type        = string
  default     = "vpc"
}

variable "public_nat_gateway_private_ip" {
  description = "The private IP address of the public NAT Gateway"
  type        = string
}

variable "public_nat_gateway_secondary_allocation_ids" {
  description = "The IDs of secondary Elastic IP addresses associated with the public NAT Gateway"
  type        = list(string)
}

variable "public_nat_gateway_secondary_private_ip_address_count" {
  description = "The number of secondary private IP addresses for the public NAT Gateway"
  type        = number
}

variable "private_nat_gateway_private_ip" {
  description = "The private IP address of the private NAT Gateway"
  type        = string
}

variable "private_nat_gateway_secondary_allocation_ids" {
  description = "The IDs of secondary Elastic IP addresses associated with the private NAT Gateway"
  type        = list(string)
}

variable "private_nat_gateway_secondary_private_ip_address_count" {
  description = "The number of secondary private IP addresses for the private NAT Gateway"
  type        = number
}