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

###################################ALB Listener###################################

resource "aws_lb_listener" "test" {
  load_balancer_arn = var.aws_lb_listener.arn
  port              = var.aws_lb_listener_port
  protocol          = var.aws_lb_listener_protocol
  ssl_policy        = var.aws_lb_listener_ssl_policy
  certificate_arn   = var.aws_lb_listener_certificate.arn

  default_action {
    type             = "forward"
    target_group_arn = var.aws_lb_listener_default_action_target_group.arn
  }
}

###################################ALB listener_rule###################################

resource "aws_lb_listener_rule" "example_rule" {
  listener_arn = var.aws_lb_listener_rule_variable_listener_arn
  priority     = var.aws_lb_listener_rule_variable_priority
  tags         = var.aws_lb_listener_rule_variable_tags

  action {
    type             = var.aws_lb_listener_rule_variable_action_type
    target_group_arn = var.aws_lb_listener_rule_variable_action_target_group_arn
    order            = var.aws_lb_listener_rule_variable_action_order

    authenticate_cognito {
      user_pool_arn       = var.aws_lb_listener_rule_variable_action_authenticate_cognito_user_pool_arn
      user_pool_client_id = var.aws_lb_listener_rule_variable_action_authenticate_cognito_user_pool_client_id
      user_pool_domain    = var.aws_lb_listener_rule_variable_action_authenticate_cognito_user_pool_domain
    }

    authenticate_oidc {
      authorization_endpoint = var.aws_lb_listener_rule_variable_action_authenticate_oidc_authorization_endpoint
      client_id              = var.aws_lb_listener_rule_variable_action_authenticate_oidc_client_id
      client_secret          = var.aws_lb_listener_rule_variable_action_authenticate_oidc_client_secret
      issuer                 = var.aws_lb_listener_rule_variable_action_authenticate_oidc_issuer
      token_endpoint         = var.aws_lb_listener_rule_variable_action_authenticate_oidc_token_endpoint
      user_info_endpoint     = var.aws_lb_listener_rule_variable_action_authenticate_oidc_user_info_endpoint
    }

    fixed_response {
      content_type = var.aws_lb_listener_rule_variable_action_fixed_response_content_type
      message_body = var.aws_lb_listener_rule_variable_action_fixed_response_message_body
      status_code  = var.aws_lb_listener_rule_variable_action_fixed_response_status_code
    }

    forward {
      target_group {
        arn    = var.aws_lb_listener_rule_variable_action_target_group_arn
        weight = 80
      }
    }

    redirect {
      port        = var.aws_lb_listener_rule_variable_action_redirect_port
      protocol    = var.aws_lb_listener_rule_variable_action_redirect_protocol
      status_code = var.aws_lb_listener_rule_variable_action_redirect_status_code
    }
  }

  condition {
    host_header {
      values = var.aws_lb_listener_rule_variable_condition_host_header_values
    }

    http_header {
      http_header_name = var.aws_lb_listener_rule_variable_condition_http_header_name
      values           = var.aws_lb_listener_rule_variable_condition_http_header_values
    }

    http_request_method {
      values = var.aws_lb_listener_rule_variable_condition_http_request_method_values
    }

    path_pattern {
      values = var.aws_lb_listener_rule_variable_condition_path_pattern_values
    }

    source_ip {
      values = var.aws_lb_listener_rule_variable_condition_source_ip_values
    }
  }
}
###################################ALB Listener certificate###################################

resource "aws_lb_listener_certificate" "example" {
  listener_arn    = var.aws_lb_listener.arn
  certificate_arn = var.aws_acm_certificate.arn
}

###################################Target group###################################

resource "aws_lb_target_group" "alb-example" {
  name_prefix = var.name_prefix
  name        = var.name
  port        = var.port
  protocol    = var.protocol
  vpc_id      = var.vpc_id

  connection_termination = var.connection_termination
  deregistration_delay   = var.deregistration_delay

  health_check {
    enabled             = var.health_check.enabled
    healthy_threshold   = var.health_check.healthy_threshold
    interval            = var.health_check.interval
    matcher             = var.health_check.matcher
    path                = var.health_check.path
    port                = var.health_check.port
    protocol            = var.health_check.protocol
    timeout             = var.health_check.timeout
    unhealthy_threshold = var.health_check.unhealthy_threshold
  }

  lambda_multi_value_headers_enabled = var.lambda_multi_value_headers_enabled
  load_balancing_algorithm_type      = var.load_balancing_algorithm_type

  stickiness {
    cookie_duration = var.stickiness.cookie_duration
    cookie_name     = var.stickiness.cookie_name
    enabled         = var.stickiness.enabled
    type            = var.stickiness.type
  }

  target_failover {
    on_deregistration = var.target_failover.on_deregistration
    on_unhealthy      = var.target_failover.on_unhealthy
  }

  target_health_state {
    enable_unhealthy_connection_termination = var.target_health_state.enable_unhealthy_connection_termination
  }

}
###################################ALB Target Group attachment###################################

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn  = var.target_group.arn
  target_id         = var.target_id
  availability_zone = var.availability_zone
  port              = var.port
}


