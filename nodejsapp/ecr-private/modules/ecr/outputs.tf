# Output value definitions
# Runs after the deployment succeed

output "ecr_repo_url" {
  description = "Url of the ecr repository on AWS for uploading docker images."
  value       = aws_ecr_repository.my_app_backend.repository_url
}
