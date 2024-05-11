resource "aws_lb" "test" {
  name               = var.name
  name_prefix        = var.name_prefix
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = var.enable_deletion_protection

  access_logs {
    bucket  = var.access_logs_bucket
    prefix  = var.access_logs_prefix
    enabled = var.access_logs_enabled
  }

  connection_logs {
    bucket  = var.connection_logs_bucket
    prefix  = var.connection_logs_prefix
    enabled = var.connection_logs_enabled
  }

  subnet_mapping {
    subnet_id            = var.subnet_mapping_subnet_id
    allocation_id        = var.subnet_mapping_allocation_id
    ipv6_address         = var.subnet_mapping_ipv6_address
    private_ipv4_address = var.subnet_mapping_private_ipv4_address
  }

  client_keep_alive                                            = var.client_keep_alive
  customer_owned_ipv4_pool                                     = var.customer_owned_ipv4_pool
  desync_mitigation_mode                                       = var.desync_mitigation_mode
  dns_record_client_routing_policy                             = var.dns_record_client_routing_policy
  drop_invalid_header_fields                                   = var.drop_invalid_header_fields
  enable_cross_zone_load_balancing                             = var.enable_cross_zone_load_balancing
  enable_http2                                                 = var.enable_http2
  enable_tls_version_and_cipher_suite_headers                  = var.enable_tls_version_and_cipher_suite_headers
  enable_xff_client_port                                       = var.enable_xff_client_port
  enable_waf_fail_open                                         = var.enable_waf_fail_open
  enforce_security_group_inbound_rules_on_private_link_traffic = var.enforce_security_group_inbound_rules_on_private_link_traffic
  idle_timeout                                                 = var.idle_timeout
  ip_address_type                                              = var.ip_address_type
  preserve_host_header                                         = var.preserve_host_header
  tags                                                         = var.tags
  xff_header_processing_mode                                   = var.xff_header_processing_mode
}

