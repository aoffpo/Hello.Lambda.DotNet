# AWS Lambda with Terraform and LocalStack

This repository has examples for  

* creating an AWS lambda using terraform
* creating a secure, locked terraform backend in s3
* *TODO*: CodeBuild pipeline for the project
* *TODO*: multiple environment support with artifact-based deployment for "production"

## Terraform

Install Terraform: https://developer.hashicorp.com/terraform/downloads  

Initialize environment, plan and apply:  
`terraform init`  

`./build-apply.sh` will create the lambda zip used by terraform to deploy the dotnet core lambda function.

Intro to Terraform: https://developer.hashicorp.com/terraform/intro

## LocalStack

https://localstack.cloud/  
Feature guide: https://docs.localstack.cloud/user-guide/aws/feature-coverage/

### Setup

NOTE: LocalStack requires docker or [podman](https://docs.localstack.cloud/references/podman/) as the LocalStack runtime runs in Docker container. The localstack configuration is managed by docker-compose in this example.

> If you are running colima, You may need to set the DOCKER_HOST environment variable to colima's docker endpoint. Run `docker context list` to get the endpoint

#### Install LocalStack

`pip install localstack`  
`localstack start -d`  

#### OR Run LocalStack in a container

`docker run --rm -it -p 4566:4566 -p 4510-4559:4510-4559 localstack/localstack`
  
#### Install awslocal  

`pip install awscli-local`

Then use `awslocal` as you would with regular `aws` cli commands.
More info: https://github.com/localstack/awscli-local
Run `localstack status services` to see what services are available.

#### Install dotnet lambda templates

`dotnet new -i Amazon.Lambda.Templates`

### Create Lambda Locally

To run this lambda, build  the netcore lambda, then generate the lambda zip file run `build-zip.sh`  
  
Then run `./create-lambda.sh` which invokes the following:
`awslocal lambda create-function \`  
`--function-name hello-lambda \`  
`--runtime netcore6`   
`--zip-file fileb://iac/lambda.zip \`  
`--handler index.handler \`  
`--role cool-stacklifter`  
  
To invoke the function locally: `awslocal lambda invoke --function-name hello-lambda --cli-binary-format raw-in-base64-out --payload "\"Hello World\"" /dev/stdout`
To delete the function: `awslocal lambda delete-function --function-name hello-lambda`

### Debug Lambda

...todo...
