variable "region" {}
variable "access_key" {}
variable "secret_key" {}

variable "assume_role_arn" {}
# variable "assume_role_session_name" {}
# variable "assume_role_external_id" {}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  assume_role {
    role_arn = var.assume_role_arn
    # session_name = var.assume_role_session_name
    # external_id  = var.assume_role_external_id
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

variable "prefix" {}

resource "aws_sns_topic" "test" {
    name_prefix = var.prefix
}

output "name" {
    value = aws_sns_topic.test.name
}
