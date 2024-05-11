
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
