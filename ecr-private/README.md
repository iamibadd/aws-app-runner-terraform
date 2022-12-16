# Deployment to AWS App Runner ECR Private Repository using Terraform

## Steps

1) Create a module for managing terraform state.
2) Make a docker image locally.
3) Create an ECR Private Repo on AWS.
4) Connect AWS CLI with the created AWS ECR repo and push the image to the repository.
5) Create an App Runner Service in AWS and link the AWS ECR repo with it.

## Commands and Usage

Initialize terraform (always used).

```
terraform init
```

Create s3 bucket and dynamo db for state management (one time step).

Should be run before the initial deployment and comment all code inside `config.tf` file.

```
terraform plan -target=module.state
terraform apply -target=module.state -auto-approve
```

Create an aws ecr repo and save the created repo url in a variable.

Make a docker image locally and push to the ecr repo.

These all commands should run at once.

Run the same commands for redeploying an image.

```
terraform plan -target=module.ecr
terraform apply -target=module.ecr -auto-approve
AWS_ECS_REPO=$(terraform output -raw ecr_repo_url)
aws ecr get-login-password | docker login  --username AWS --password-stdin "${AWS_ECS_REPO}"
docker build -t "${AWS_ECS_REPO}:latest" ../.
docker push "${AWS_ECS_REPO}:latest"
docker rmi "$(docker images -q)"
```

Create an aws app runner service.

Run the following commands if:

1) Deploying the application for the first time.
2) Made any changes in app_runner module.
3) An environment variable change is made, first run the below commands and then create an image and push to ECR.
4) Also do not run the below commands when redeploying the image as auto deployment is enabled for App runner.
5) For frontend builds, we do not need to run the below commands after the initial deployment as environment variables
   are set while creating build.

```
terraform plan -target=module.app_runner
terraform apply -target=module.app_runner -auto-approve
```

Destroy the infrastructure.

```
terraform destroy -auto-approve
```

## Deployment

**Initial setup for managing terraform state**

```
terraform init
terraform plan -target=module.state
terraform apply -target=module.state -auto-approve
```

After the commands execution complete, uncomment `config.tf` file.

**Deploying the app for the first time**

```
terraform init
terraform plan -target=module.ecr
terraform apply -target=module.ecr -auto-approve
AWS_ECS_REPO=$(terraform output -raw ecr_repo_url)
aws ecr get-login-password | docker login  --username AWS --password-stdin "${AWS_ECS_REPO}"
docker build -t "${AWS_ECS_REPO}:latest" ../.
docker push "${AWS_ECS_REPO}:latest"
docker rmi "$(docker images -q)"
terraform plan -target=module.app_runner
terraform apply -target=module.app_runner -auto-approve
```

**Redeploying the image**

This step will redeploy the app runner service as well because of `auto deployment` is set to `true` in app runner
service configuration.

```
terraform init
terraform plan -target=module.ecr
terraform apply -target=module.ecr -auto-approve
AWS_ECS_REPO=$(terraform output -raw ecr_repo_url)
aws ecr get-login-password | docker login  --username AWS --password-stdin "${AWS_ECS_REPO}"
docker build -t "${AWS_ECS_REPO}:latest" ../.
docker push "${AWS_ECS_REPO}:latest"
docker rmi "$(docker images -q)"
```

**Redeploying the app runner service**

```
terraform init
terraform plan -target=module.app_runner
terraform apply -target=module.app_runner -auto-approve
```

**Destroying the infrastructure**

```
terraform init
terraform destroy -auto-approve
```

Happy Hacking!
