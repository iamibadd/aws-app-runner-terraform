# Output value definitions
# Runs after the deployment succeed

output "app_runner_url" {
  value = aws_apprunner_service.backend.service_url
}
