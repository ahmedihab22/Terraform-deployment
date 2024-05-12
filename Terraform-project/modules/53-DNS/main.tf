resource "aws_route53_cidr_collection" "example" {
  name = var.route53_cidr_collection_name
}

resource "aws_route53_cidr_location" "example" {
  cidr_collection_id = aws_route53_cidr_collection.example.id
  name               = var.route53_cidr_location_name
  cidr_blocks        = var.route53_cidr_blocks
}

resource "aws_route53_delegation_set" "main" {
  reference_name = var.route53_delegation_set_reference_name
}

resource "aws_route53_zone" "primary" {
  name              = var.route53_zone_name
  delegation_set_id = aws_route53_delegation_set.main.id
}

resource "aws_route53_health_check" "example" {
  fqdn              = var.route53_health_check_fqdn
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = var.route53_health_check_tags
}

resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name          = var.cloudwatch_metric_alarm_name
  comparison_operator = var.cloudwatch_metric_alarm_comparison_operator
  evaluation_periods  = var.cloudwatch_metric_alarm_evaluation_periods
  metric_name         = var.cloudwatch_metric_alarm_metric_name
  namespace           = var.cloudwatch_metric_alarm_namespace
  period              = var.cloudwatch_metric_alarm_period
  statistic           = var.cloudwatch_metric_alarm_statistic
  threshold           = var.cloudwatch_metric_alarm_threshold
  alarm_description   = var.cloudwatch_metric_alarm_description
}

resource "aws_route53_health_check" "foo" {
  type                            = var.cloudwatch_health_check_type
  cloudwatch_alarm_name           = aws_cloudwatch_metric_alarm.foobar.alarm_name
  cloudwatch_alarm_region         = "us-west-2"
  insufficient_data_health_status = var.cloudwatch_health_check_insufficient_data_health_status
}

resource "aws_route53_key_signing_key" "example" {
  hosted_zone_id             = aws_route53_zone.primary.zone_id
  key_management_service_arn = aws_kms_key.example.arn
  name                       = var.route53_key_signing_key_name
}

resource "aws_route53_hosted_zone_dnssec" "example" {
  depends_on     = [aws_route53_key_signing_key.example]
  hosted_zone_id = aws_route53_key_signing_key.example.hosted_zone_id
}

resource "aws_route53_query_log" "example_com" {
  depends_on               = [aws_cloudwatch_log_resource_policy.route53-query-logging-policy]
  cloudwatch_log_group_arn = aws_cloudwatch_log_group.aws_route53_example_com.arn
  zone_id                  = aws_route53_zone.example_com.zone_id
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "example.com"
  type    = "A"

  alias {
    name                   = aws_elb.main.dns_name
    zone_id                = aws_elb.main.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_traffic_policy" "example" {
  name     = var.route53_traffic_policy_name
  comment  = var.route53_traffic_policy_comment
  document = <<EOF
{
  "AWSPolicyFormatVersion": "2015-10-01",
  "RecordType": "A",
  "Endpoints": {
    "endpoint-start-NkPh": {
      "Type": "value",
      "Value": "10.0.0.2"
    }
  },
  "StartEndpoint": "endpoint-start-NkPh"
}
EOF
}

resource "aws_route53_traffic_policy_instance" "test" {
  name                   = var.route53_traffic_policy_instance_name
  traffic_policy_id      = var.route53_traffic_policy_instance_traffic_policy_id
  traffic_policy_version = var.route53_traffic_policy_instance_traffic_policy_version
  hosted_zone_id         = var.route53_traffic_policy_instance_hosted_zone_id
  ttl                    = var.route53_traffic_policy_instance_ttl
}

resource "aws_route53_vpc_association_authorization" "example" {
  vpc_id  = aws_vpc.alternate.id
  zone_id = aws_route53_zone.example.id
}

resource "aws_route53_zone_association" "secondary" {
  zone_id = aws_route53_zone.example.zone_id
  vpc_id  = var.route53_zone_association_vpc_id
}