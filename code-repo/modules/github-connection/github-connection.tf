resource "aws_apprunner_connection" "github_connection" {
  connection_name = var.github_connection_name
  provider_type   = "GITHUB"
  tags            = {
    Name = var.github_connection_name
  }
}
