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

