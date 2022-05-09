# General variables
variable "name_prefix" {
  description = "Name to prepend to all resource names within module"
  type        = string
}

variable "name_suffix" {
  description = "Name to append to all resource names within module"
  default     = ""
  type        = string
}

variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default = {
    ModuleDeveloper = "StratusGrid"
    Provisioner     = "Terraform"
  }
}

# Variables related to Cloudwatch
variable "log_group_name" {
  description = "Name of the CloudWatch Log Group where the events are being recorded"
  type        = string
}

# Variables related to KMS
variable "create_kms_key" {
  description = "Boolean to define if KMS key should be created or not"
  default     = true
  type        = bool
}

variable "kms_key_id" {
  description = "ID of the key to be used by Cloud Trail to encrypt the logs"
  default     = ""
  type        = string
}

# Variables related to alerting
variable "notifications_email" {
  description = "Email to send notifications from alerts"
  type        = string
}

# Variables related to RTM lambda integration
variable "rtm_enabled" {
  description = "Variable to enable Real Time Monitoring"
  default     = true
  type        = bool
}

variable "integration_service" {
  description = "Integration service for RTM system"
  default     = "SLACK"
  type        = string
}

variable "webhook_id" {
  description = "Webhook ID for RTM system"
  default     = "changeme"
  type        = string
}
