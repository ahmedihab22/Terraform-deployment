######################### Activity stream  #############################

resource "aws_rds_cluster_activity_stream" "default" {
  resource_arn        = var.resource_arn
  mode                = var.mode
  kms_key_id          = var.kms_key_id
  kinesis_stream_name = var.kinesis_stream_name

  depends_on = [aws_rds_cluster_instance.default]
}