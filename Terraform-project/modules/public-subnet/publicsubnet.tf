resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.public_route_cidr_block
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.availability_zones)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "public_subnets" {
  count                                          = length(var.availability_zones)
  vpc_id                                         = var.vpc_id
  cidr_block                                     = var.subnet_cidr_blocks[count.index]
  availability_zone                              = var.availability_zones[count.index]
  assign_ipv6_address_on_creation                = var.assign_ipv6_address_on_creation
  availability_zone_id                           = var.availability_zone_id
  customer_owned_ipv4_pool                       = var.customer_owned_ipv4_pool
  enable_dns64                                   = var.enable_dns64
  enable_resource_name_dns_aaaa_record_on_launch = var.enable_resource_name_dns_aaaa_record_on_launch
  enable_resource_name_dns_a_record_on_launch    = var.enable_resource_name_dns_a_record_on_launch
  ipv6_cidr_block                                = var.ipv6_cidr_block
  ipv6_native                                    = var.ipv6_native
  map_customer_owned_ip_on_launch                = var.map_customer_owned_ip_on_launch
  map_public_ip_on_launch                        = var.map_public_ip_on_launch
  outpost_arn                                    = var.outpost_arn
  private_dns_hostname_type_on_launch            = var.private_dns_hostname_type_on_launch

  tags = {
    Name = "PublicSubnet-${count.index + 1}"
  }
}

output "subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

