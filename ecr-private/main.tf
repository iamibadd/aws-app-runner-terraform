provider "aws" {}

module "state" {
  source = "./modules/state"
}

module "ecr" {
  source = "./modules/ecr"
}

module "app_runner" {
  source       = "./modules/app-runner"
  ecr_repo_url = module.ecr.ecr_repo_url
}
