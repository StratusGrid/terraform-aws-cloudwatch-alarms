# Resource to create a SNS topic encrypted with KMS
resource "aws_sns_topic" "this" {
  name              = "${var.name_prefix}-security${var.name_suffix}"
  kms_master_key_id = var.create_kms_key == true ? aws_kms_key.this[0].arn : data.aws_kms_key.this[0].arn

  tags = local.tags
}

resource "aws_sns_topic_subscription" "this" {
  topic_arn = aws_sns_topic.this.arn
  protocol  = "email"
  endpoint  = var.notifications_email
}

# Resource to create a SNS topic encrypted with KMS for RTM
resource "aws_sns_topic" "rtm" {
  count             = var.rtm_enabled ? 1 : 0
  name              = "${var.name_prefix}-security-rtm${var.name_suffix}"
  kms_master_key_id = var.create_kms_key == true ? aws_kms_key.this[0].arn : data.aws_kms_key.this[0].arn

  tags = local.tags
}
