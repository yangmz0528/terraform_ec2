resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.instance.name
}

resource "aws_iam_role" "instance" {
  name                = var.iam_role_name
  assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json
  managed_policy_arns = [var.managed_policy_arns]
}