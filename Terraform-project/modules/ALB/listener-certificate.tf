###################################ALB Listener certificate###################################

resource "aws_lb_listener_certificate" "example" {
  listener_arn    = var.aws_lb_listener.arn
  certificate_arn = var.aws_acm_certificate.arn
}

