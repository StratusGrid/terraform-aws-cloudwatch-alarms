# General data sources

# Data source to get data from the caller identity like the AWS account
data "aws_caller_identity" "current" {}

# Data source to get data from the current region caller
data "aws_region" "current" {}

# Data source to get the KMS ARM
# It will be only used if we decide to use one existing key
data "aws_kms_key" "this" {
  count  = var.create_kms_key ? 0 : 1
  key_id = var.kms_key_id
}
