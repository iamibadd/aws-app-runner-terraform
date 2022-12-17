variable "service_name" {
  type        = string
  default     = "dev_my_app_backend"
  description = "Identifier used for service name and scaling of AWS App Runner"
}

variable "service_domain" {
  type        = string
  default     = "dev-api.my_app.co"
  description = "URL to use the deployed service"
}

variable "app_role_name" {
  type        = string
  default     = "DevBackendAppRole"
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
  default     = "https://github.com/iamibadd/my_app-backend.git"
  description = "Github repo"
}

variable "github_branch" {
  type        = string
  default     = "dev"
  description = "Github branch"
}

variable "nodejs_version" {
  type        = string
  default     = "NODEJS_16"
  description = "Nodejs run time version"
}

variable "build_command" {
  type        = string
  default     = "npm install"
  description = "Build command"
}

variable "start_command" {
  type        = string
  default     = "npm start"
  description = "Start command"
}

