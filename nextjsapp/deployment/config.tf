terraform {
  backend "s3" {
    bucket         = "my_app-tf-state-dev-frontend"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "my_app-terraform-locks-dev-frontend"
    encrypt        = true

  }
}
