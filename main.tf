# Resource to create a SNS topic encrypted with KMS
resource "aws_sns_topic" "this" {
  count             = var.rtm_enabled ? 1 : 0
  name              = "${var.name_prefix}-security${var.name_suffix}"
  kms_master_key_id = var.create_kms_key == true ? aws_kms_key.this[0].arn : data.aws_kms_key.this[0].arn

  tags = local.tags
}
