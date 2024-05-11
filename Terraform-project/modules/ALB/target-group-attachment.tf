###################################ALB Target Group attachment###################################

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn  = var.target_group.arn
  target_id         = var.target_id
  availability_zone = var.availability_zone
  port              = var.port
}

