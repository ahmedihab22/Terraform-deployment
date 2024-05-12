###################################Variables for application load balancer###################################
variable "name" {
  description = "Name of the LB. This name must be unique within your AWS account."
  type        = string
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
  type        = string
}

variable "internal" {
  description = "If true, the LB will be internal."
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "Type of load balancer to create."
  type        = string
  default     = "application"
}

variable "security_groups" {
  description = "List of security group IDs to assign to the LB."
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs to attach to the LB."
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "If true, deletion of the load balancer will be disabled via the AWS API."
  type        = bool
  default     = false
}

variable "access_logs_bucket" {
  description = "S3 bucket name to store the logs in."
  type        = string
}

variable "access_logs_enabled" {
  description = "Boolean to enable/disable access_logs."
  type        = bool
  default     = false
}

variable "access_logs_prefix" {
  description = "S3 bucket prefix for access logs."
  type        = string
}

variable "connection_logs_bucket" {
  description = "S3 bucket name to store the connection logs in."
  type        = string
}

variable "connection_logs_enabled" {
  description = "Boolean to enable/disable connection_logs."
  type        = bool
  default     = false
}

variable "connection_logs_prefix" {
  description = "S3 bucket prefix for connection logs."
  type        = string
}

variable "subnet_mapping_subnet_id" {
  description = "ID of the subnet to attach to the load balancer."
  type        = string
}

variable "subnet_mapping_allocation_id" {
  description = "Allocation ID of the Elastic IP address for an internet-facing load balancer."
  type        = string
  default     = null
}

variable "subnet_mapping_ipv6_address" {
  description = "IPv6 address associated with the load balancer."
  type        = string
  default     = null
}

variable "subnet_mapping_private_ipv4_address" {
  description = "Private IPv4 address for an internal load balancer."
  type        = string
  default     = null
}

variable "client_keep_alive" {
  description = "Client keep alive value in seconds."
  type        = number
  default     = 3600
}

variable "customer_owned_ipv4_pool" {
  description = "ID of the customer owned ipv4 pool to use for this load balancer."
  type        = string
  default     = null
}

variable "desync_mitigation_mode" {
  description = "How the load balancer handles requests that might pose a security risk due to HTTP desync."
  type        = string
  default     = "defensive"
}

variable "dns_record_client_routing_policy" {
  description = "How traffic is distributed among the load balancer Availability Zones."
  type        = string
  default     = "any_availability_zone"
}

variable "drop_invalid_header_fields" {
  description = "Whether HTTP headers with invalid header fields are removed by the load balancer."
  type        = bool
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  description = "If true, cross-zone load balancing of the load balancer will be enabled."
  type        = bool
  default     = false
}

variable "enable_http2" {
  description = "Whether HTTP/2 is enabled in application load balancers."
  type        = bool
  default     = true
}

variable "enable_tls_version_and_cipher_suite_headers" {
  description = "Whether TLS version and cipher suite headers are added to the client request."
  type        = bool
  default     = false
}

variable "enable_xff_client_port" {
  description = "Whether the X-Forwarded-For header should preserve the source port."
  type        = bool
  default     = false
}

variable "enable_waf_fail_open" {
  description = "Whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to AWS WAF."
  type        = bool
  default     = false
}

variable "enforce_security_group_inbound_rules_on_private_link_traffic" {
  description = "Whether inbound security group rules are enforced for traffic originating from a PrivateLink."
  type        = string
  default     = "off"
}

variable "idle_timeout" {
  description = "Time in seconds that the connection is allowed to be idle."
  type        = number
  default     = 60
}

variable "ip_address_type" {
  description = "Type of IP addresses used by the subnets for your load balancer."
  type        = string
  default     = "ipv4"
}

variable "preserve_host_header" {
  description = "Whether the Application Load Balancer should preserve the Host header in the HTTP request."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "xff_header_processing_mode" {
  description = "Determines how the load balancer modifies the X-Forwarded-For header in the HTTP request."
  type        = string
  default     = "append"
}

###################################Variables for target group###################################

variable "port" {
  type    = number
  default = 80
}

variable "vpc_id" {
  type = string
}

variable "protocol" {
  type    = string
  default = "TCP"
}
variable "connection_termination" {
  type    = bool
  default = true
}

variable "deregistration_delay" {
  type    = number
  default = 300
}

variable "health_check" {
  type = object({
    enabled             = bool
    healthy_threshold   = number
    interval            = number
    matcher             = string
    path                = string
    port                = number
    protocol            = string
    timeout             = number
    unhealthy_threshold = number
  })
  default = {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

variable "lambda_multi_value_headers_enabled" {
  type    = bool
  default = false
}

variable "load_balancing_algorithm_type" {
  type    = string
  default = "round_robin"
}

###################################Variables for target group attachment###################################
variable "target_group_arn" {
  description = "The ARN of the target group."
}

variable "target_id" {
  description = "The ID of the target."
}

variable "port" {
  description = "The port the target is listening on."
}
variable "availability_zone" {
  description = "The Availability Zone where the IP address of the target is to be registered."
}

#########################Variables ALB Listener###################################
variable "aws_lb_listener_arn" {
  description = "The ARN of the load balancer."
}

variable "aws_lb_listener_port" {
  description = "The port on which the load balancer is listening."
}

variable "aws_lb_listener_protocol" {
  description = "The protocol for connections from clients to the load balancer."
}

variable "aws_lb_listener_ssl_policy" {
  description = "The SSL policy name."
}

variable "aws_lb_listener_certificate_arn" {
  description = "The ARN of the SSL certificate."
}

variable "aws_lb_listener_default_action_target_group_arn" {
  description = "The ARN of the default target group."
}

###################################Variable for Lestener certificate###################################

variable "aws_lb_listener_arn" {
  description = "The ARN of the listener to which to attach the certificate."
}
variable "aws_acm_certificate_arn" {
  description = " The ARN of the certificate to attach to the listener."
}

###################################Variable for Listener rule###################################

variable "aws_lb_listener_rule_variable_listener_arn" {
  description = "The ARN of the listener to which the rule should be attached."
}

variable "aws_lb_listener_rule_variable_priority" {
  description = "The priority for the rule. A listener can't have multiple rules with the same priority."
}

variable "aws_lb_listener_rule_variable_tags" {
  description = "A map of tags to assign to the rule."
  type        = map(string)
}

variable "aws_lb_listener_rule_variable_action_type" {
  description = "The type of action."
}

variable "aws_lb_listener_rule_variable_action_target_group_arn" {
  description = "The ARN of the target group for the action."
}

variable "aws_lb_listener_rule_variable_action_order" {
  description = "The order for the action."
}

variable "aws_lb_listener_rule_variable_action_redirect_port" {
  description = "The port for the redirect action."
}

variable "aws_lb_listener_rule_variable_action_redirect_protocol" {
  description = "The protocol for the redirect action."
}

variable "aws_lb_listener_rule_variable_action_redirect_status_code" {
  description = "The status code for the redirect action."
}

variable "aws_lb_listener_rule_variable_action_fixed_response_content_type" {
  description = "The content type for the fixed-response action."
}

variable "aws_lb_listener_rule_variable_action_fixed_response_message_body" {
  description = "The message body for the fixed-response action."
}

variable "aws_lb_listener_rule_variable_action_fixed_response_status_code" {
  description = "The status code for the fixed-response action."
}

variable "aws_lb_listener_rule_variable_action_authenticate_cognito_user_pool_arn" {
  description = "The ARN of the Cognito user pool."
}

variable "aws_lb_listener_rule_variable_action_authenticate_cognito_user_pool_client_id" {
  description = "The client ID of the Cognito user pool."
}

variable "aws_lb_listener_rule_variable_action_authenticate_cognito_user_pool_domain" {
  description = "The domain of the Cognito user pool."
}

variable "aws_lb_listener_rule_variable_action_authenticate_oidc_authorization_endpoint" {
  description = "The authorization endpoint for the OIDC action."
}

variable "aws_lb_listener_rule_variable_action_authenticate_oidc_client_id" {
  description = "The client ID for the OIDC action."
}

variable "aws_lb_listener_rule_variable_action_authenticate_oidc_client_secret" {
  description = "The client secret for the OIDC action."
}

variable "aws_lb_listener_rule_variable_action_authenticate_oidc_issuer" {
  description = "The issuer for the OIDC action."
}

variable "aws_lb_listener_rule_variable_action_authenticate_oidc_token_endpoint" {
  description = "The token endpoint for the OIDC action."
}

variable "aws_lb_listener_rule_variable_action_authenticate_oidc_user_info_endpoint" {
  description = "The user info endpoint for the OIDC action."
}

variable "aws_lb_listener_rule_variable_condition_host_header_values" {
  description = "A list of host names to match."
  type        = list(string)
}

variable "aws_lb_listener_rule_variable_condition_http_header_name" {
  description = "The name of the HTTP header."
}

variable "aws_lb_listener_rule_variable_condition_http_header_values" {
  description = "A list of HTTP header values to match."
  type        = list(string)
}

variable "aws_lb_listener_rule_variable_condition_http_request_method_values" {
  description = "A list of HTTP request methods to match."
  type        = list(string)
}

variable "aws_lb_listener_rule_variable_condition_path_pattern_values" {
  description = "A list of path patterns to match."
  type        = list(string)
}

variable "aws_lb_listener_rule_variable_condition_query_string_key" {
  description = "The key for the query string condition."
}

variable "aws_lb_listener_rule_variable_condition_query_string_values" {
  description = "A list of query string values to match."
  type        = list(string)
}

variable "aws_lb_listener_rule_variable_condition_source_ip_values" {
  description = "A list of source IP addresses to match."
  type        = list(string)
}