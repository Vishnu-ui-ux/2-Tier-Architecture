# Public Subnet 1
resource "aws_subnet" "public_1" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "2tier-public-subnet-1"
  }
}

# Public Subnet 2
resource "aws_subnet" "public_2" {

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = "2tier-public-subnet-2"
  }
}

# Private Subnet 1
resource "aws_subnet" "private_1" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.availability_zone_1

  tags = {
    Name = "2tier-private-subnet-1"
  }
}

# Private Subnet 2
resource "aws_subnet" "private_2" {

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.availability_zone_2

  tags = {
    Name = "2tier-private-subnet-2"
  }
}