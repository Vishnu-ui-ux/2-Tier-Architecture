resource "aws_instance" "jenkins_server" {

  ami           = "ami-08d4f419a8b4a011f"
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_1.id

  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id
  ]

  key_name = "2tier-key"

  associate_public_ip_address = true

  tags = {
    Name = "jenkins-server"
  }
}
