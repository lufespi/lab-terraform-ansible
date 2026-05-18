resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "devops-igw"
  }
}

resource "aws_route_table" "devops_public_rt" {
  vpc_id = aws_vpc.devops_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_igw.id
  }
  

  tags = {
    Name = "devops-public-rt"
  }
}

resource "aws_route_table_association" "devops_public_subnet_1a_assoc" {
  subnet_id      = aws_subnet.devops_public_subnet_1a.id
  route_table_id = aws_route_table.devops_public_rt.id
}