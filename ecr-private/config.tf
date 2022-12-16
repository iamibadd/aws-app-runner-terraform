terraform {
  backend "s3" {
    bucket         = "my_app-tf-state-dev-backend"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "my_app-terraform-locks-dev-backend"
    encrypt        = true

  }
}
