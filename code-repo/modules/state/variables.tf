variable "bucket_name" {
  default     = "my_app-tf-state-dev-backend"
  description = "Terraform state file"
  type        = string
}

variable "dynamo_db" {
  default     = "my_app-terraform-locks-dev-backend"
  description = "Dynamo db for tf state"
  type        = string
}
