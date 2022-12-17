variable "service_name" {
  type        = string
  default     = "dev_my_app_frontend"
  description = "Identifier used for service name and scaling of AWS App Runner"
}

variable "service_domain" {
  type        = string
  default     = "dev.my_app.co"
  description = "URL to use the deployed service"
}

variable "app_role_name" {
  type        = string
  default     = "DevFrontendAppRole"
  description = "IAM role name for app runner"
}

variable "github_connection_name" {
  type        = string
  description = "Github connection name for AWS App Runner"
}

variable "github_connection_arn" {
  type        = string
  description = "Github connection arn for AWS App Runner"
}

variable "github_repo" {
  type        = string
  default     = "https://github.com/iamibadd/my_app-frontend-nextjs.git"
  description = "Github repo"
}

variable "github_branch" {
  type        = string
  default     = "dev"
  description = "Github branch"
}


