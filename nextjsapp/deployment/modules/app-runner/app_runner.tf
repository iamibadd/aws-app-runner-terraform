resource "aws_apprunner_auto_scaling_configuration_version" "frontend_auto_scaling" {
  depends_on                      = [time_sleep.waitForAppRole]
  auto_scaling_configuration_name = var.service_name
  max_concurrency                 = 100
  max_size                        = 5
  min_size                        = 1

  tags = {
    Name = var.service_name
  }
}

resource "aws_apprunner_service" "frontend" {
  depends_on   = [time_sleep.waitForAppRole]
  service_name = var.service_name
  source_configuration {
    authentication_configuration {
      connection_arn = var.github_connection_arn
    }
    code_repository {
      code_configuration {
        configuration_source = "REPOSITORY"
      }
      repository_url = var.github_repo
      source_code_version {
        type  = "BRANCH"
        value = var.github_branch
      }
    }
  }
  auto_scaling_configuration_arn = aws_apprunner_auto_scaling_configuration_version.frontend_auto_scaling.arn
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

resource "aws_apprunner_custom_domain_association" "frontend_domain" {
  depends_on  = [aws_apprunner_service.frontend]
  domain_name = var.service_domain
  service_arn = aws_apprunner_service.frontend.arn
}


