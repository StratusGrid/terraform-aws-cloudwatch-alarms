data "archive_file" "rtm_lambda" {
  count       = var.rtm_enabled ? 1 : 0
  output_path = "${path.module}/lambda.zip"
  type        = "zip"

  source_dir = "${path.module}/function"
}

resource "aws_lambda_alias" "rtm_lambda" {
  count            = var.rtm_enabled ? 1 : 0
  function_name    = module.rtm_lambda[0].function_name
  function_version = module.rtm_lambda[0].version
  name             = module.rtm_lambda[0].function_name
}

module "rtm_lambda" {
  count            = var.rtm_enabled ? 1 : 0
  source           = "moritzzimmer/lambda/aws"
  description      = "Lambda to send messages in Real Time to a webhook."
  filename         = data.archive_file.rtm_lambda[0].output_path
  function_name    = "${var.name_prefix}-rtm-monitoring${var.name_suffix}"
  handler          = "main.lambda_handler"
  runtime          = "python3.7"
  source_code_hash = data.archive_file.rtm_lambda[0].output_base64sha256

  environment = {
    variables = {
      INTEGRATION_SERVICE = var.integration_service
      WEBHOOK_ID          = var.webhook_id
    }
  }

  sns_subscriptions = {
    topic_1 = {
      topic_arn = aws_sns_topic.rtm[0].arn

      // optionally overwrite `endpoint` in case an alias should be used for the SNS subscription
      endpoint = aws_lambda_alias.rtm_lambda[0].arn
    }
  }
}