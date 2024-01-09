resource "aws_instance" "public" {
  count                       = var.ec2_count
  provider                    = aws.prod
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnets.public.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  user_data = <<EOF
  #!/bin/bash
  yum install -y httpd
  systemctl enable httpd
  systemctl start httpd
  EOF

  user_data_replace_on_change = true # this forces instance to be recreated upon update of user data contents

  tags = {
    Name        = "${var.prefix}-instance-${count.index}"
    Environment = var.environment_prod
  }
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name        = "${var.prefix}-instance"
    Environment = var.environment_dev
  }
}
