resource "aws_launch_configuration" "example" {
  name          = var.launch_configuration_name
  image_id      = "ami-12345678" // Change this to the desired AMI ID
  instance_type = "t2.micro"     // Change this to the desired instance type

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "auto_scaling_group" {
  name                          = "example-autoscaling-group"
  launch_configuration          = aws_launch_configuration.example.name
  min_size                      = var.min_size
  max_size                      = var.max_size
  desired_capacity              = var.desired_capacity
  vpc_zone_identifier           = var.vpc_zone_identifier
  health_check_type             = var.health_check_type
  health_check_grace_period     = var.health_check_grace_period

  tag {
    key                 = "Name"
    value               = "AutoScalingGroup"
    propagate_at_launch = true
  }
}