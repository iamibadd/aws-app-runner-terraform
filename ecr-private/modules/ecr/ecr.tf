resource "aws_ecr_repository" "my_app_backend" {
  name         = var.repo_name
  force_delete = true
}
