resource "aws_nat_gateway" "public_nat_gateway" {
  allocation_id                      = var.public_elastic_ip_allocation_id
  subnet_id                          = var.public_subnet_id
  connectivity_type                  = var.public_nat_gateway_connectivity_type
  private_ip                         = var.public_nat_gateway_private_ip
  secondary_allocation_ids           = var.public_nat_gateway_secondary_allocation_ids
  secondary_private_ip_address_count = var.public_nat_gateway_secondary_private_ip_address_count
}

resource "aws_nat_gateway" "private_nat_gateway" {
  allocation_id                      = var.private_elastic_ip_allocation_id
  subnet_id                          = var.private_subnet_id
  connectivity_type                  = var.private_nat_gateway_connectivity_type
  private_ip                         = var.private_nat_gateway_private_ip
  secondary_allocation_ids           = var.private_nat_gateway_secondary_allocation_ids
  secondary_private_ip_address_count = var.private_nat_gateway_secondary_private_ip_address_count
}

output "public_nat_gateway_id" {
  value = aws_nat_gateway.public_nat_gateway.id
}

output "private_nat_gateway_id" {
  value = aws_nat_gateway.private_nat_gateway.id
}
