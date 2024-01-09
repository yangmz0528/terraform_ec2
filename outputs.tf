output "ec2_arn_dev" {
    value = aws_instance.dev.arn
}

output "ec2_arn_prod" {
    value = aws_instance.public[*].arn
}