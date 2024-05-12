#GCP Credentials variables
/*
variable "gcp_svc_key" {
  
}
variable "gcp_project" {
  
}
variable "gcp_region" {
  
}
*/
##################################################################################################################################################################
################################################################ Variables for application load balancer  ########################################################
##################################################################################################################################################################
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
##################################################################################################################################################################
################################################################ Variables for Security Group  ###################################################################
##################################################################################################################################################################

variable "security_group_description" {
  description = "The description of the security group."
}

variable "egress_rules" {
  description = "A list of egress rules for the security group."
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    description      = string
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
  }))
}

variable "ingress_rules" {
  description = "A list of ingress rules for the security group."
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
    description      = string
    ipv6_cidr_blocks = list(string)
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    self             = bool
  }))
}

variable "security_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
}

variable "security_group_name" {
  description = "The name of the security group."
}

variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed when managing Security Groups as Terraform will properly manage rules."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "vpc_id" {
  description = "The VPC ID."
}

######################### Variables for Security Group Rules #############################

variable "security_group_rule_type" {
  description = "The type of rule (ingress/egress)."
  default     = "ingress"
}

variable "security_group_rule_from_port" {
  description = "The start port (inclusive) for the rule."
  default     = 0
}

variable "security_group_rule_to_port" {
  description = "The end port (inclusive) for the rule."
  default     = 65535
}

variable "security_group_rule_protocol" {
  description = "The protocol for the rule (tcp, udp, icmp, etc)."
  default     = "tcp"
}

variable "security_group_rule_cidr_blocks" {
  description = "List of CIDR blocks to allow access."
  type        = list(string)
  default     = []
}

variable "security_group_rule_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR blocks to allow access."
  type        = list(string)
  default     = []
}

variable "security_group_rule_security_group_id" {
  description = "The security group ID."
}

variable "security_group_rule_description" {
  description = "The description of the security group rule."
}

variable "security_group_rule_prefix_list_ids" {
  description = "List of prefix list IDs for allowing access to/from VPC endpoints."
  type        = list(string)
  default     = []
}

variable "security_group_rule_self" {
  description = "Whether to allow access from the security group itself."
  type        = bool
  default     = false
}

variable "security_group_rule_source_security_group_id" {
  description = "The security group ID to allow access from."
}

######################### Variables for Security Group association #############################

variable "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint."
}

variable "security_group_id" {
  description = "The ID of the security group."
}

variable "replace_default_association" {
  description = "Whether to replace the default security group association."
  type        = bool
  default     = false
}

######################### Variables for Route Table #############################

variable "vpc_id" {
  description = "The ID of the VPC where the route table resides."
}

variable "cidr_block" {
  description = "The IPv4 CIDR block for the route."
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block for the route."
}

variable "destination_prefix_list_id" {
  description = "The ID of the prefix list for the route."
}

variable "carrier_gateway_id" {
  description = "The ID of the carrier gateway for the route."
}

variable "egress_only_gateway_id" {
  description = "The ID of the egress-only internet gateway for the route."
}

variable "gateway_id" {
  description = "The ID of the internet gateway for the route."
}

variable "local_gateway_id" {
  description = "The ID of the local gateway for the route."
}

variable "nat_gateway_id" {
  description = "The ID of the NAT gateway for the route."
}

variable "network_interface_id" {
  description = "The ID of the network interface for the route."
}

variable "transit_gateway_id" {
  description = "The ID of the transit gateway for the route."
}

variable "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint for the route."
}

variable "vpc_peering_connection_id" {
  description = "The ID of the VPC peering connection for the route."
}

variable "tags" {
  description = "A map of tags to assign to the route table."
  type        = map(string)
}

variable "propagating_vgws" {
  description = "A list of virtual gateways for route propagation."
  type        = list(string)
}

variable "core_network_arn" {
  description = "The Amazon Resource Name (ARN) of the core network."
}

######################### Variables for Route Table Association #############################

variable "subnet_id" {
  description = "The ID of the subnet to associate with the route table."
}

variable "route_table_id" {
  description = "The ID of the route table to associate with the subnet."
}

variable "gateway_id" {
  description = "The ID of the gateway associated with the route table."
}
######################### Variables for End Point Route Table Association #############################

variable "route_table_id" {
  description = "The ID of the route table to associate with the VPC endpoint."
}

variable "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint to associate with the route table."
}
##################################################################################################################################################################
######################################################################### Variavles for RDS  #####################################################################
##################################################################################################################################################################


variable "allocated_storage" {
  description = "The amount of storage to allocate for the DB cluster in gibibytes (GiB)."
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed."
}

variable "apply_immediately" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window."
}

variable "availability_zones" {
  description = "A list of EC2 Availability Zones that instances in the DB cluster can be created in."
  type        = list(string)
}

variable "backtrack_window" {
  description = "The target backtrack window, in seconds. Only available for Aurora MySQL."
}

variable "backup_retention_period" {
  description = "The days to retain backups for."
}

variable "cluster_identifier_prefix" {
  description = "Prefix to use when generating a cluster identifier."
}

variable "cluster_identifier" {
  description = "The cluster identifier."
}

variable "copy_tags_to_snapshot" {
  description = "Specifies whether tags are copied from the DB cluster to snapshots of the DB cluster."
}

variable "database_name" {
  description = "The name for your database of up to 64 alphanumeric characters."
}

variable "db_cluster_instance_class" {
  description = "The compute and memory capacity of the DB cluster."
}

variable "db_cluster_parameter_group_name" {
  description = "The name of the DB cluster parameter group to associate with this DB cluster."
}

variable "db_instance_parameter_group_name" {
  description = "A DB parameter group to associate with this DB instance."
}

variable "db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance."
}

variable "db_system_id" {
  description = "The ID of the DB system that the DB cluster will belong to."
}

variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB cluster is deleted."
}

variable "deletion_protection" {
  description = "Indicates whether the DB cluster has deletion protection enabled. The database can't be deleted when deletion protection is enabled."
}

variable "domain" {
  description = "The Active Directory directory ID to create the DB instance in."
}

variable "domain_iam_role_name" {
  description = "The name of the IAM role to use when making API calls to the Directory Service."
}

variable "enable_global_write_forwarding" {
  description = "Whether to enable the global write forwarder for the Aurora cluster."
}

variable "enable_http_endpoint" {
  description = "Whether to enable the Data API for the Aurora Serverless cluster."
}

variable "enable_local_write_forwarding" {
  description = "Whether to enable the local write forwarder for the Aurora cluster."
}

variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to export to CloudWatch Logs."
}

variable "engine_mode" {
  description = "The database engine mode."
}

variable "engine_version" {
  description = "The engine version to use."
}

variable "engine" {
  description = "The name of the database engine to be used for this DB cluster."
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB cluster is deleted."
}

variable "global_cluster_identifier" {
  description = "The global cluster identifier."
}

variable "iam_database_authentication_enabled" {
  description = "Whether to enable mapping of AWS Identity and Access Management (IAM) accounts to database accounts."
}

variable "iam_roles" {
  description = "A list of IAM roles that can be associated with the DB cluster."
}

variable "iops" {
  description = "The amount of provisioned IOPS."
}

variable "kms_key_id" {
  description = "The ARN of the AWS Key Management Service (KMS) master key that is used to encrypt the database instances in the DB cluster."
}

variable "manage_master_user_password" {
  description = "Whether to enable the master user password to be managed via the AWS Management Console."
}

variable "master_password" {
  description = "Password for the master DB user."
}

variable "master_user_secret_kms_key_id" {
  description = "The ARN of the AWS Key Management Service (KMS) master key that is used to encrypt the secret for the master DB user."
}

variable "master_username" {
  description = "Username for the master DB user."
}

variable "network_type" {
  description = "The network type to use for the DB cluster."
}

variable "port" {
  description = "The port number on which the DB cluster accepts connections."
}

variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created."
}

variable "preferred_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur, in UTC."
}

variable "replication_source_identifier" {
  description = "The Amazon Resource Name (ARN) of the source DB cluster or DB instance if this DB cluster is a read replica."
}

variable "restore_to_point_in_time" {
  description = "The date and time to restore the DB cluster to."
}

variable "scaling_configuration" {
  description = "Nested attribute specifying scaling properties for an Aurora Serverless DB cluster."
}

variable "serverlessv2_scaling_configuration" {
  description = "Nested attribute specifying scaling properties for an Aurora Serverless v2 DB cluster."
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted."
}

variable "snapshot_identifier" {
  description = "The name of the DB snapshot to restore from."
}

variable "source_region" {
  description = "The source region for an encrypted DB cluster."
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted."
}

variable "storage_type" {
  description = "The storage type associated with the DB cluster."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security groups associated with the DB cluster."
  type        = list(string)
}
######################### Variables for activity stream  #############################

variable "resource_arn" {
  description = "The Amazon Resource Name (ARN) of the RDS cluster."
}

variable "mode" {
  description = "The mode of the activity stream."
}

variable "kms_key_id" {
  description = "The ARN for the KMS key to encrypt the stream."
}

variable "kinesis_stream_name" {
  description = "The name of the Kinesis data stream to be used for the database activity stream."
}
######################### Variables for endpoint  #############################

variable "cluster_identifier" {
  description = "The identifier of the RDS cluster."
}

variable "cluster_endpoint_identifier" {
  description = "The identifier to use for the new endpoint."
}

variable "custom_endpoint_type" {
  description = "The type of the endpoint."
}

variable "excluded_members" {
  description = "List of DB instance identifiers that aren't part of the custom endpoint group."
  type        = list(string)
}

variable "static_members" {
  description = "List of DB instance identifiers that are part of the custom endpoint group."
  type        = list(string)
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}

######################### Variables for endpoint  #############################


variable "count" {
  description = "The number of RDS cluster instances to create."
}

variable "apply_immediately" {
  description = "Determines whether or not any DB modifications are applied immediately, or during the maintenance window."
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades are applied automatically to the DB instance during the maintenance window."
}

variable "availability_zone" {
  description = "The Availability Zone where the DB instance will be created."
}

variable "ca_cert_identifier" {
  description = "The identifier of the CA certificate for the DB instance."
}

variable "cluster_identifier" {
  description = "The identifier of the RDS cluster."
}

variable "copy_tags_to_snapshot" {
  description = "Determines whether tags are copied from the DB instance to snapshots of the DB instance."
}

variable "custom_iam_instance_profile" {
  description = "The name of the IAM role to associate with the DB instance."
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group to associate with this DB instance."
}

variable "db_subnet_group_name" {
  description = "The name of a DB subnet group to associate with this DB instance."
}

variable "engine_version" {
  description = "The version number of the database engine to use."
}

variable "engine" {
  description = "The name of the database engine to be used for this DB instance."
}

variable "identifier_prefix" {
  description = "Prefix to use when generating an identifier for the DB instance."
}

variable "identifier" {
  description = "The name of the RDS instance."
}

variable "instance_class" {
  description = "The class of the instance."
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance."
}

variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
}

variable "performance_insights_enabled" {
  description = "Indicates whether Performance Insights is enabled."
}

variable "performance_insights_kms_key_id" {
  description = "The ARN of the KMS key used to encrypt Performance Insights data."
}

variable "performance_insights_retention_period" {
  description = "The amount of time, in days, to retain Performance Insights data."
}

variable "preferred_backup_window" {
  description = "The daily time range during which automated backups are created."
}

variable "preferred_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur, in UTC."
}

variable "promotion_tier" {
  description = "A value that specifies the order in which an Aurora Replica is promoted to the primary instance after a failure of the existing primary instance."
}

variable "publicly_accessible" {
  description = "Determines if the DB instance can be publicly accessed from the internet."
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}


######################### Variables for parameter group  #############################
variable "name" {
  description = "The name of the DB cluster parameter group."
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix."
}

variable "family" {
  description = "The family of the DB cluster parameter group."
}

variable "description" {
  description = "The description of the DB cluster parameter group."
}

variable "parameters" {
  description = "A list of DB cluster parameters to apply."
  type = list(object({
    name  = string
    value = string
  }))

}
variable "tags" {
  description = "A mapping of tags to assign to the resource."
}
######################### Variables for role association  #############################

variable "db_cluster_identifier" {
  description = "The identifier of the RDS cluster."
}

variable "feature_name" {
  description = "The name of the feature associated with the IAM role."
}

variable "role_arn" {
  description = "The Amazon Resource Name (ARN) of the IAM role to associate with the RDS cluster."
}

##################################################################################################################################################################
######################################################################### Variavles for 53  #####################################################################
##################################################################################################################################################################

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
##################################################################################################################################################################
################################################################ Variables for auto scaling group  ###############################################################
##################################################################################################################################################################
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
##################################################################################################################################################################
################################################################ Variables for ec2  ##############################################################################
##################################################################################################################################################################
variable "subnet_id" {
  description = "ID of the subnet where the EC2 instance will be launched"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable "user_data" {
  description = "User data script to run when launching the EC2 instance"
  type        = string
  default     = ""
}
##################################################################################################################################################################
################################################################ Variables for nat gateway  ######################################################################
##################################################################################################################################################################
variable "public_subnet_id" {
  description = "ID of the public subnet where the public NAT Gateway will be created"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet where the private NAT Gateway will be created"
  type        = string
}

variable "public_elastic_ip_allocation_id" {
  description = "ID of the Elastic IP address to associate with the public NAT Gateway"
  type        = string
}

variable "private_elastic_ip_allocation_id" {
  description = "ID of the Elastic IP address to associate with the private NAT Gateway"
  type        = string
}

variable "public_nat_gateway_connectivity_type" {
  description = "The type of NAT connectivity for the public NAT Gateway. Value must be either 'internet' or 'vpc'"
  type        = string
  default     = "internet"
}

variable "private_nat_gateway_connectivity_type" {
  description = "The type of NAT connectivity for the private NAT Gateway. Value must be either 'internet' or 'vpc'"
  type        = string
  default     = "vpc"
}

variable "public_nat_gateway_private_ip" {
  description = "The private IP address of the public NAT Gateway"
  type        = string
}

variable "public_nat_gateway_secondary_allocation_ids" {
  description = "The IDs of secondary Elastic IP addresses associated with the public NAT Gateway"
  type        = list(string)
}

variable "public_nat_gateway_secondary_private_ip_address_count" {
  description = "The number of secondary private IP addresses for the public NAT Gateway"
  type        = number
}

variable "private_nat_gateway_private_ip" {
  description = "The private IP address of the private NAT Gateway"
  type        = string
}

variable "private_nat_gateway_secondary_allocation_ids" {
  description = "The IDs of secondary Elastic IP addresses associated with the private NAT Gateway"
  type        = list(string)
}

variable "private_nat_gateway_secondary_private_ip_address_count" {
  description = "The number of secondary private IP addresses for the private NAT Gateway"
  type        = number
}
##################################################################################################################################################################
################################################################ Variables for private subnet  ###################################################################
##################################################################################################################################################################
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "assign_ipv6_address_on_creation" {
  description = "Whether to assign IPv6 addresses to instances launched in this subnet."
  type        = bool
  default     = false
}

variable "availability_zone_id" {
  description = "The ID of the Availability Zone for the subnet."
  type        = string
}

variable "customer_owned_ipv4_pool" {
  description = "The ID of the customer-owned IPv4 address pool."
  type        = string
}

variable "enable_dns64" {
  description = "Whether to enable DNS64 support."
  type        = bool
  default     = false
}

variable "enable_lni_at_device_index" {
  description = "Whether to enable Local Network Interface at Device Index."
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_aaaa_record_on_launch" {
  description = "Whether to enable DNS AAAA resource name for launch."
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_a_record_on_launch" {
  description = "Whether to enable DNS A resource name for launch."
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block."
  type        = string
}

variable "ipv6_native" {
  description = "Whether the IPv6 CIDR block is for an IPv6 VPC."
  type        = bool
  default     = false
}

variable "map_customer_owned_ip_on_launch" {
  description = "Whether to map customer-owned IP on launch."
  type        = bool
  default     = false
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IP on launch."
  type        = bool
  default     = false
}

variable "outpost_arn" {
  description = "The ARN of the Outpost."
  type        = string
}

variable "private_dns_hostname_type_on_launch" {
  description = "The private DNS hostname type."
  type        = string
  default     = "IpHostname" // Options: "Dns", "IpHostname"
}
variable "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  type        = string
}

variable "private_route_cidr_block" {
  description = "CIDR block for the private route"
  type        = string
  default     = "0.0.0.0/0"
}
##################################################################################################################################################################
################################################################ Variables for public subnet  ####################################################################
##################################################################################################################################################################
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "assign_ipv6_address_on_creation" {
  description = "Whether to assign IPv6 addresses to instances launched in this subnet."
  type        = bool
  default     = false
}

variable "availability_zone_id" {
  description = "The ID of the Availability Zone for the subnet."
  type        = string
}

variable "customer_owned_ipv4_pool" {
  description = "The ID of the customer-owned IPv4 address pool."
  type        = string
}

variable "enable_dns64" {
  description = "Whether to enable DNS64 support."
  type        = bool
  default     = false
}

variable "enable_lni_at_device_index" {
  description = "Whether to enable Local Network Interface at Device Index."
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_aaaa_record_on_launch" {
  description = "Whether to enable DNS AAAA resource name for launch."
  type        = bool
  default     = false
}

variable "enable_resource_name_dns_a_record_on_launch" {
  description = "Whether to enable DNS A resource name for launch."
  type        = bool
  default     = false
}

variable "ipv6_cidr_block" {
  description = "The IPv6 CIDR block."
  type        = string
}

variable "ipv6_native" {
  description = "Whether the IPv6 CIDR block is for an IPv6 VPC."
  type        = bool
  default     = false
}

variable "map_customer_owned_ip_on_launch" {
  description = "Whether to map customer-owned IP on launch."
  type        = bool
  default     = false
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IP on launch."
  type        = bool
  default     = false
}

variable "outpost_arn" {
  description = "The ARN of the Outpost."
  type        = string
}

variable "private_dns_hostname_type_on_launch" {
  description = "The private DNS hostname type."
  type        = string
  default     = "IpHostname" // Options: "Dns", "IpHostname"
}
variable "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  type        = string
}

variable "public_route_cidr_block" {
  description = "CIDR block for the public route"
  type        = string
  default     = "0.0.0.0/0"
}
##################################################################################################################################################################
################################################################ Variables for vpc  ##############################################################################
##################################################################################################################################################################
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support for the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "The allowed tenancy of instances launched into the VPC"
  type        = string
  default     = "default" // Options: "default", "dedicated"
}
variable "ipv4_ipam_pool_id" {
  description = "ID of the IPv4 IP Address Management (IPAM) pool"
  type        = string
}

variable "ipv4_netmask_length" {
  description = "Netmask length for the IPv4 CIDR block"
  type        = number
}

variable "ipv6_cidr_block" {
  description = "CIDR block for the IPv6 VPC"
  type        = string
}

variable "ipv6_ipam_pool_id" {
  description = "ID of the IPv6 IP Address Management (IPAM) pool"
  type        = string
}

variable "ipv6_netmask_length" {
  description = "Netmask length for the IPv6 CIDR block"
  type        = number
}

variable "ipv6_cidr_block_network_border_group" {
  description = "The network border group for the IPv6 CIDR block"
  type        = string
}

variable "enable_network_address_usage_metrics" {
  description = "Enable network address usage metrics for the VPC"
  type        = bool
  default     = false
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Assign a generated IPv6 CIDR block for the VPC"
  type        = bool
  default     = false
}
