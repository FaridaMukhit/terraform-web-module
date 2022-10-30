resource "aws_instance" "ec2" {
  ami                    = "ami-026b57f3c383c2eec"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet1.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = "Terraform"
  user_data              = data.template_file.user_data.rendered
  tags = {
    Name = replace(local.name, "rtype", "ec2")
  }
} 