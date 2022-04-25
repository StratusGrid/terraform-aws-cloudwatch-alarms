# Alarm to detect Root account usage
resource "aws_cloudwatch_metric_alarm" "root_account_usage" {
  alarm_name          = "${var.name_prefix}-root-account-usage-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.root_account_usage.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.root_account_usage.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if the Root account has logged in the AWS Accounts"
}

# Alarm to detect AWS Console sign-ins without MFA
resource "aws_cloudwatch_metric_alarm" "console_sign_in_without_mfa" {
  alarm_name          = "${var.name_prefix}-console-sign-in-without-mfa-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.console_sign_in_without_mfa.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.console_sign_in_without_mfa.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if someone has logged in the AWS Console without MFA"
}

# Alarm to detect AWS authorization failures
resource "aws_cloudwatch_metric_alarm" "aws_authorization_failures" {
  alarm_name          = "${var.name_prefix}-aws-authorization-failures-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.aws_authorization_failures.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.aws_authorization_failures.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are authorization failures in AWS"
}

# Alarm to detect AWS console sign in failures
resource "aws_cloudwatch_metric_alarm" "aws_console_sign_in_failures" {
  alarm_name          = "${var.name_prefix}-aws_console-sign-in-failures-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.aws_console_sign_in_failures.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.aws_console_sign_in_failures.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are AWS Console sign in failures"
}

# Alarm to detect IAM auth changes in AWS
resource "aws_cloudwatch_metric_alarm" "iam_auth_config_changes" {
  alarm_name          = "${var.name_prefix}-iam-auth-config-changes-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.iam_auth_config_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.iam_auth_config_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are IAM Auth changes"
}

# Alarm to detect changes in AWS Organization
resource "aws_cloudwatch_metric_alarm" "organizations_changes" {
  alarm_name          = "${var.name_prefix}-organizations-changes-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.organizations_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.organizations_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are changes in AWS Organizations"
}

# Alarm to detect changes in VPC Gateway configuration
resource "aws_cloudwatch_metric_alarm" "vpc_gateway_config_changes" {
  alarm_name          = "${var.name_prefix}-vpc-gw-config-changes-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.vpc_gateway_config_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.vpc_gateway_config_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are changes in VPC Gateway configuration"
}

# Alarm to detect changes in Security groups
resource "aws_cloudwatch_metric_alarm" "security_group_config_changes" {
  alarm_name          = "${var.name_prefix}-sg-config-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.security_group_config_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.security_group_config_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are changes in Security groups"
}

# Alarm to detect changes in VPCs
resource "aws_cloudwatch_metric_alarm" "vpc_network_config_changes" {
  alarm_name          = "${var.name_prefix}-vpc-config-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.vpc_network_config_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.vpc_network_config_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are changes in VPC"
}

# Alarm to detect changes in Route tables
resource "aws_cloudwatch_metric_alarm" "route_table_config_changes" {
  alarm_name          = "${var.name_prefix}-route-table-config-changes-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.route_table_config_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.route_table_config_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are changes in the route tables of any VPC"
}

# Alarm to detect changes in Cloudtrail
resource "aws_cloudwatch_metric_alarm" "aws_cloudtrail_changes" {
  alarm_name          = "${var.name_prefix}-aws-cloudtrail-changes-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.aws_cloudtrail_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.aws_cloudtrail_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are changes in the AWS Cloudtrail configuration"
}

# Alarm to detect changes in EC2 instance status
resource "aws_cloudwatch_metric_alarm" "ec2_instance_status_changes" {
  alarm_name          = "${var.name_prefix}-ec2-instance-status-changes-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.ec2_instance_status_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.ec2_instance_status_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are changes in the status of EC2 instances"
}

# Alarm to detect Large EC2 instance launched
resource "aws_cloudwatch_metric_alarm" "launch_ec2_large_instances" {
  alarm_name          = "${var.name_prefix}-launch-ec2-large-instance-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.launch_ec2_large_instances.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.launch_ec2_large_instances.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are any large EC2 instances launched recently"
}

# Alarm to detect S3 bucket config changes
resource "aws_cloudwatch_metric_alarm" "s3_bucket_config_changes" {
  alarm_name          = "${var.name_prefix}-s3-bucket-config-changes-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.s3_bucket_config_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.s3_bucket_config_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are any configuration changes in any S3 bucket"
}

# Alarm to detect KMS CMK (Customer Managed Keys) configuration changes
resource "aws_cloudwatch_metric_alarm" "aws_cmk_changes" {
  alarm_name          = "${var.name_prefix}-aws-cmk-changes-alarm${var.name_suffix}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = aws_cloudwatch_log_metric_filter.aws_cmk_changes.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.aws_cmk_changes.metric_transformation[0].namespace
  period              = "60"
  statistic           = "Sum"
  threshold           = "1"
  alarm_description   = "This Alarm monitors if there are any configuration changes in AWS KMS Customer Managed keys"
}
