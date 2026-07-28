# Security Group for EC2
resource "aws_security_group" "web_sg" {

  name        = "web-security-group"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    description = "HTTP"

    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "2tier-web-sg"
  }

}

# Security Group for RDS

resource "aws_security_group" "rds_sg" {

  name   = "rds-security-group"
  vpc_id = aws_vpc.main.id

  ingress {

    from_port = 3306
    to_port   = 3306

    protocol = "tcp"

    security_groups = [
      aws_security_group.web_sg.id
    ]

  }

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "2tier-rds-sg"
  }

}
