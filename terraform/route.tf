# Public Route Table
resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {
    Name = "2tier-public-route-table"
  }

}

# Association - Public Subnet 1
resource "aws_route_table_association" "public_1" {

  subnet_id = aws_subnet.public_1.id

  route_table_id = aws_route_table.public.id

}

# Association - Public Subnet 2
resource "aws_route_table_association" "public_2" {

  subnet_id = aws_subnet.public_2.id

  route_table_id = aws_route_table.public.id

}