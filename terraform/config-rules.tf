locals {
  managed = [
    "CLOUD_TRAIL_ENABLED",
    "S3_BUCKET_VERSIONING_ENABLED",
    "INCOMING_SSH_DISABLED",
    "VPC_FLOW_LOGS_ENABLED",
    "RDS_BACKUP_ENABLED",
    "EBS_VOLUME_TYPE_CHECK",
    "CLOUDWATCH_LOG_GROUP_RETENTION_PERIOD_CHECK",
    "OPENSEARCH_ENCRYPTION_AT_REST_ENABLED"
  ]
}

resource "aws_config_config_rule" "managed" {
  for_each = toset(local.managed)
  name = each.value
  source {
    owner = "AWS"
    source_identifier = each.value
  }
}
