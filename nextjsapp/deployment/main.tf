provider "aws" {}

module "state" {
  source = "./modules/state"
}

module "github_connection" {
  source = "./modules/github-connection"
}

module "app_runner" {
  source                 = "./modules/app-runner"
  github_connection_name = module.github_connection.github_connection_name
  github_connection_arn  = module.github_connection.github_connection_arn
}
