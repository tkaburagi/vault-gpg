provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "se_tkabu" {
  name = var.iam_user_name
}

resource "aws_iam_access_key" "user_access_key" {
  user    = aws_iam_user.se_tkabu.name
  pgp_key = var.demo_user_gpg_key
}

output "access_key_id" {
  value = aws_iam_access_key.user_access_key.id
}

output "secret_access_key" {
  value = aws_iam_access_key.user_access_key.encrypted_secret
}

variable "demo_user_gpg_key" {}

variable "iam_user_name" {
  type    = string
  default = "se_tkabu"
}
