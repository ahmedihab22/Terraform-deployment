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
