# DB Subnet Group
resource "aws_db_subnet_group" "db_subnet_group" {

  name = "twotier-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = "twotier-db-subnet-group"
  }

}

# RDS MySQL Instance
resource "aws_db_instance" "mysql" {

  identifier = "twotier-mysql"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  db_name = "mydb"

  username = "admin"

  password = "Admin12345!"

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  publicly_accessible = false

  skip_final_snapshot = true

  tags = {
    Name = "2tier-mysql"
  }

}