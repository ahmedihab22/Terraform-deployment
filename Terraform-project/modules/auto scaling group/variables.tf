variable "launch_configuration_name" {
  description = "Name of the launch configuration to use for the Auto Scaling Group"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling Group"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "health_check_type" {
  description = "Type of health check to use for the instances in the Auto Scaling Group"
  type        = string
  default     = "EC2"
}

variable "health_check_grace_period" {
  description = "Time (in seconds) that Auto Scaling waits before checking the health status of an instance"
  type        = number
  default     = 300
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs to launch instances into"
  type        = list(string)
}
