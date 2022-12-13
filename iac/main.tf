terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#terraform {
# backend "s3" {
#   bucket         = local.tf_state_bucket_name
#   key            = "state/terraform.tfstate"
#   region         = "us-east-1"
#   encrypt        = true
#   kms_key_id     = "alias/terraform-bucket-key"
#   dynamodb_table = "terraform-state"
# }
#}

locals {
  tf_state_bucket_name = "terraform_state"
}