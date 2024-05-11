variable "route53_cidr_collection_name" {
  type    = string
  default = "collection-1"
}

variable "route53_cidr_location_name" {
  type    = string
  default = "office"
}

variable "route53_cidr_blocks" {
  type    = list(string)
  default = ["200.5.3.0/24", "200.6.3.0/24"]
}

variable "route53_delegation_set_reference_name" {
  type    = string
  default = "DynDNS"
}

variable "route53_zone_name" {
  type    = string
  default = "hashicorp.com"
}

variable "route53_health_check_fqdn" {
  type    = string
  default = "example.com"
}

variable "route53_health_check_tags" {
  type = map(string)
  default = {
    Name = "tf-test-health-check"
  }
}

variable "cloudwatch_metric_alarm_name" {
  type    = string
  default = "terraform-test-foobar5"
}

variable "cloudwatch_metric_alarm_comparison_operator" {
  type    = string
  default = "GreaterThanOrEqualToThreshold"
}

variable "cloudwatch_metric_alarm_evaluation_periods" {
  type    = string
  default = "2"
}

variable "cloudwatch_metric_alarm_metric_name" {
  type    = string
  default = "CPUUtilization"
}

variable "cloudwatch_metric_alarm_namespace" {
  type    = string
  default = "AWS/EC2"
}

variable "cloudwatch_metric_alarm_period" {
  type    = string
  default = "120"
}

variable "cloudwatch_metric_alarm_statistic" {
  type    = string
  default = "Average"
}

variable "cloudwatch_metric_alarm_threshold" {
  type    = string
  default = "80"
}

variable "cloudwatch_metric_alarm_description" {
  type    = string
  default = "This metric monitors ec2 cpu utilization"
}

variable "cloudwatch_health_check_type" {
  type    = string
  default = "CLOUDWATCH_METRIC"
}

variable "cloudwatch_health_check_insufficient_data_health_status" {
  type    = string
  default = "Healthy"
}

variable "route53_key_signing_key_name" {
  type    = string
  default = "example"
}

variable "route53_traffic_policy_name" {
  type    = string
  default = "example"
}

variable "route53_traffic_policy_comment" {
  type    = string
  default = "example comment"
}

variable "route53_traffic_policy_instance_name" {
  type    = string
  default = "test.example.com"
}

variable "route53_traffic_policy_instance_traffic_policy_id" {
  type    = string
  default = "b3gb108f-ea6f-45a5-baab-9d112d8b4037"
}

variable "route53_traffic_policy_instance_traffic_policy_version" {
  type    = number
  default = 1
}

variable "route53_traffic_policy_instance_hosted_zone_id" {
  type    = string
  default = "Z033120931TAQO548OGJC"
}

variable "route53_traffic_policy_instance_ttl" {
  type    = number
  default = 360
}

variable "route53_zone_association_vpc_id" {
  type    = string
  default = aws_vpc.secondary.id
}
