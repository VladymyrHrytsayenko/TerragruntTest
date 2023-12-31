locals {
  source_url        = "git::https://gitlab.com/bakavets/terraform-modules.git"
  source_version    = "v0.2.1"
  deployment_prefix = "main-dev"
  aws_region        = "eu-west-1"
  esc_cluster_name  = "${local.deployment_prefix}-esc-cluster"
  default_tags = {
    "TerminationDate"  = "Permanent",
    "Environment"      = "Development",
    "Team"             = "DevOps",
    "DeployedBy"       = "Terraform",
    "OwnerEmail"       = "3q3q18@gmail.com"
    "DeploymentPrefix" = local.deployment_prefix
  }
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket              = "${local.deployment_prefix}-terraform-states-backend-terragruntapplication"
    key                 = "${path_relative_to_include()}/terraform.tfstate"
    region              = local.aws_region
    encrypt             = true
    dynamodb_table      = "${local.deployment_prefix}-terraform-states-backend-terragruntapplication"
    s3_bucket_tags      = local.default_tags
    dynamodb_table_tags = local.default_tags
  }
}

# Generate an AWS provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}

variable "aws_region" {
  description = "AWS Region."
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags for AWS that will be attached to each resource."
}
EOF
}

retryable_errors = [
  "(?s).*Error.*Required plugins are not installed.*"
]

inputs = {
  aws_region        = local.aws_region
  deployment_prefix = local.deployment_prefix
  default_tags      = local.default_tags
}
