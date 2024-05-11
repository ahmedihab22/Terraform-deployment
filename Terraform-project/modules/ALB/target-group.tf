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

