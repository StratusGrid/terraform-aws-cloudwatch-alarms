# File with all the resources related to CloudTrail KMS Key

# Resource to create the KMS key to encrypt the trails
resource "aws_kms_key" "this" {
  count                   = var.create_kms_key ? 1 : 0
  description             = "KMS used to encrypt SNS messages in rest"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  policy = data.aws_iam_policy_document.kms[0].json

  tags = local.tags
}

resource "aws_kms_alias" "this" {
  count         = var.create_kms_key ? 1 : 0
  name          = "alias/${var.name_prefix}-cloudwatch-security-alarms${var.name_suffix}"
  target_key_id = aws_kms_key.this[0].key_id
}

data "aws_iam_policy_document" "kms" {
  count = var.create_kms_key ? 1 : 0
  # Statement to allow to manage the key inside the AWS account
  statement {
    sid = "Enable IAM User Permissions"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions = [
      "kms:*"
    ]

    resources = [
      "*"
    ]
  }

  # Statement to allow access to KMS from SNS
  statement {
    sid = "AWSSNSAccessToKey"
    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }

    actions = [
      "kms:DescribeKey"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "AWSSNSEncryptLogs"
    principals {
      type        = "Service"
      identifiers = ["sns.amazonaws.com"]
    }

    actions = [
      "kms:GenerateDataKey*",
      "kms:Decrypt"
    ]

    resources = [
      "*"
    ]
  }
}