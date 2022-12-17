variable "ecr_repo_url" {
  type        = string
  description = "ECR Image URL"
}

variable "service_name" {
  type        = string
  default     = "dev_my_app_backend"
  description = "Identifier used for service name and scaling of AWS App Runner"
}

variable "service_domain" {
  type        = string
  default     = "test1.my_app.co"
  description = "URL to use the deployed service"
}

variable "app_role_name" {
  type        = string
  default     = "DevBackendAppRole"
  description = "IAM role name for app runner"
}
