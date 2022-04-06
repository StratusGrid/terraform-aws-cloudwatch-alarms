# Metrics related to authentication and IAM

# Metric to detect Root account usage
resource "aws_cloudwatch_log_metric_filter" "root_account_usage" {
  name           = "RootAccountUsage"
  pattern        = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "RootAccountUsageEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect if any AWS console has been accessed by users without mfa
resource "aws_cloudwatch_log_metric_filter" "console_sign_in_without_mfa" {
  name           = "ConsoleSignInWithoutMfa"
  pattern        = "{ $.eventName = \"ConsoleLogin\" && $.additionalEventData.MFAUsed = \"No\" }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "ConsoleSignInWithoutMfaCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect if any AWS account is having authorization failures
resource "aws_cloudwatch_log_metric_filter" "aws_authorization_failures" {
  name           = "AWSAuthorizationFailures"
  pattern        = "{ ($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\") }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "AuthorizationFailureCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect any AWS with console sign in failures
resource "aws_cloudwatch_log_metric_filter" "aws_console_sign_in_failures" {
  name           = "AWSConsoleSignInFailures"
  pattern        = "{ ($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\") }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "ConsoleSigninFailureCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect IAM auth config changes in your AWS accounts
resource "aws_cloudwatch_log_metric_filter" "iam_auth_config_changes" {
  name           = "IAMAuthConfigChanges"
  pattern        = "{ ($.eventName = DeleteGroupPolicy) || ($.eventName = DeleteRolePolicy) || ($.eventName = DeleteUserPolicy) || ($.eventName = PutGroupPolicy) || ($.eventName = PutRolePolicy) || ($.eventName = PutUserPolicy) || ($.eventName = CreatePolicy) || ($.eventName = DeletePolicy) || ($.eventName = CreatePolicyVersion) || ($.eventName = DeletePolicyVersion) || ($.eventName = AttachRolePolicy) || ($.eventName = DetachRolePolicy) || ($.eventName = AttachUserPolicy) || ($.eventName = DetachUserPolicy) || ($.eventName = AttachGroupPolicy) || ($.eventName = DetachGroupPolicy) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "IAMPolicyEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect changes in AWS Organizations
resource "aws_cloudwatch_log_metric_filter" "organizations_changes" {
  name           = "OrganizationsChanges"
  pattern        = "{ ($.eventSource = organizations.amazonaws.com) && ($.eventName = AcceptHandshake) || ($.eventName = AttachPolicy) || ($.eventName = CancelHandshake) || ($.eventName = CreateAccount) || ($.eventName = CreateOrganization) || ($.eventName = CreateOrganizationalUnit) || ($.eventName = CreatePolicy) || ($.eventName = DeclineHandshake) || ($.eventName = DeleteOrganization) || ($.eventName = DeleteOrganizationalUnit) || ($.eventName = DeletePolicy) || ($.eventName = EnableAllFeatures) || ($.eventName = EnablePolicyType) || ($.eventName = InviteAccountToOrganization) || ($.eventName = LeaveOrganization) || ($.eventName = DetachPolicy) || ($.eventName = DisablePolicyType) || ($.eventName = MoveAccount) || ($.eventName = RemoveAccountFromOrganization) || ($.eventName = UpdateOrganizationalUnit) || ($.eventName = UpdatePolicy) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "OrganizationsEvents"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metrics related to VCPs and networking

# Metric to detect any AWS with console sign in failures
resource "aws_cloudwatch_log_metric_filter" "vpc_gateway_config_changes" {
  name           = "VPCGatewayConfigChanges"
  pattern        = "{ ($.eventName = CreateCustomerGateway) || ($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) || ($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) || ($.eventName = DetachInternetGateway) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "GatewayEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect changes in Security Groups
resource "aws_cloudwatch_log_metric_filter" "security_group_config_changes" {
  name           = "SecurityGroupConfigChanges"
  pattern        = "{ ($.eventName = AuthorizeSecurityGroupIngress) || ($.eventName = AuthorizeSecurityGroupEgress) || ($.eventName = RevokeSecurityGroupIngress) || ($.eventName = RevokeSecurityGroupEgress) || ($.eventName = CreateSecurityGroup) || ($.eventName = DeleteSecurityGroup) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "SecurityGroupEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect changes in VPCs
resource "aws_cloudwatch_log_metric_filter" "vpc_network_config_changes" {
  name           = "VPCNetworkConfigChanges"
  pattern        = "{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) || ($.eventName = ModifyVpcAttribute) || ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) || ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) || ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) || ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "VpcEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect changes in Route tables
resource "aws_cloudwatch_log_metric_filter" "route_table_config_changes" {
  name           = "RouteTableConfigChanges"
  pattern        = "{ ($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) || ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation) || ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) || ($.eventName = DisassociateRouteTable) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "RouteTableEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}



# Metrics related to other services

# Metric to detect any change in AWS Cloudtrail
resource "aws_cloudwatch_log_metric_filter" "aws_cloudtrail_changes" {
  name           = "AWSCloudTrailChanges"
  pattern        = "{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "CloudTrailEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect any change in EC2 Instances
resource "aws_cloudwatch_log_metric_filter" "ec2_instance_status_changes" {
  name           = "EC2InstanceStatusChanges"
  pattern        = "{ ($.eventName = RunInstances) || ($.eventName = RebootInstances) || ($.eventName = StartInstances) || ($.eventName = StopInstances) || ($.eventName = TerminateInstances) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "EC2InstanceEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect if large EC2 instances have been launched
resource "aws_cloudwatch_log_metric_filter" "launch_ec2_large_instances" {
  name           = "LaunchEC2LargeInstances"
  pattern        = "{ ($.eventName = RunInstances) && (($.requestParameters.instanceType = *.8xlarge) || ($.requestParameters.instanceType = *.4xlarge)) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "EC2LargeInstanceEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect config changes in S3 buckets
resource "aws_cloudwatch_log_metric_filter" "s3_bucket_config_changes" {
  name           = "S3BucketConfigChanges"
  pattern        = "{ ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) || ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) || ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) || ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) || ($.eventName = DeleteBucketLifecycle) || ($.eventName = DeleteBucketReplication)) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "S3BucketEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

# Metric to detect if there are changes in Customer Managed Keys
resource "aws_cloudwatch_log_metric_filter" "aws_cmk_changes" {
  name           = "AWSCMKChanges"
  pattern        = "{ ($.eventSource = kms.amazonaws.com) && (($.eventName = DisableKey) || ($.eventName = ScheduleKeyDeletion)) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "CMKEventCount"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

