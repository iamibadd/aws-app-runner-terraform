# Deployment to AWS App Runner ECR Private Repository using Terraform

## Steps

1) Create a module for managing terraform state.
2) Create a GitHub connection service in AWS App Runner.
3) Handshake between App Runner and AWS. (Manual process from AWS App Runner console)
4) Create an App Runner Service in AWS and link the GitHub repo with it.

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

Create a GitHub connection service in AWS App Runner (one time step).

```
terraform plan -target=module.github_connection
terraform apply -target=module.github_connection -auto-approve
```

Once the execution is completed, go to AWS App Runner -> GitHub connections from the console and complete the handshake.

Create an aws app runner service.

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

**Initial setup for creating a GitHub connection service**

```
terraform init
terraform plan -target=module.github_connection
terraform apply -target=module.github_connection -auto-approve
```

**Deploying the app for the first time or redeploying app runner in case environment variables are changed or made a
change in the infrastructure**

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
