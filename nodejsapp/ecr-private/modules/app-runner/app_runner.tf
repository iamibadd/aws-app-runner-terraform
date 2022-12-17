resource "aws_apprunner_auto_scaling_configuration_version" "backend_auto_scaling" {
  depends_on                      = [time_sleep.waitForAppRole]
  auto_scaling_configuration_name = var.service_name
  max_concurrency                 = 100
  max_size                        = 5
  min_size                        = 1

  tags = {
    Name = var.service_name
  }
}

resource "aws_apprunner_service" "backend" {
  depends_on   = [time_sleep.waitForAppRole]
  service_name = var.service_name
  source_configuration {
    image_repository {
      image_configuration {
        port                          = "80"
        runtime_environment_variables = {
          PORT : 80
        }
      }
      image_identifier      = "${var.ecr_repo_url}:latest"
      image_repository_type = "ECR"
    }
    authentication_configuration {
      access_role_arn = aws_iam_role.app_role.arn
    }
    auto_deployments_enabled = true
  }

  auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration_version.backend_auto_scaling.arn

  health_check_configuration {
    healthy_threshold   = 1
    interval            = 10
    path                = "/"
    protocol            = "TCP"
    timeout             = 5
    unhealthy_threshold = 5
  }

  tags = {
    Name = var.service_name
  }
}

resource "aws_apprunner_custom_domain_association" "backend_domain" {
  depends_on  = [aws_apprunner_service.backend]
  domain_name = var.service_domain
  service_arn = aws_apprunner_service.backend.arn
}
