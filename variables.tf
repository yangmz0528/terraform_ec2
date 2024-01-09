variable "iam_role_name" {
  default = "ec2instance_ssm_role"
}

variable "managed_policy_arns" {
  default = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

variable "ec2_count" {
  default = 2
}

variable "environment_prod" {
  type    = string
  default = "prod"
}

variable "environment_dev" {
  type    = string
  default = "dev"
}

variable "prefix" {
  type    = string
  default = "mingzi"
}