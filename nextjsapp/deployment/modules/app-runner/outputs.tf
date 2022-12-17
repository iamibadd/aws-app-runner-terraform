# Output value definitions
# Runs after the deployment succeed

output "app_runner_url" {
  value = aws_apprunner_service.frontend.service_url
}
