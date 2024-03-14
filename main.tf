provider "aws" {
  region     = "us-east-1"
    access_key = var.ACCESS_KEY_ID
    secret_key = var.ACCESS_KEY_VALUE
    token      = var.SESSION_TOKEN
}
variable "ACCESS_KEY_ID" {}
variable "ACCESS_KEY_VALUE" {}
variable "SESSION_TOKEN" {}

variable "prefix" {}

resource "aws_sns_topic" "test" {
    name_prefix = var.prefix
}

output "name" {
    value = aws_sns_topic.test.name
}
