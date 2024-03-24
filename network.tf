resource "aws_vpc" "variable-vpc" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "variable-vpc"
  }

}

resource "aws_subnet" "variable-aws_subnet" {
  vpc_id                  = aws_vpc.variable-vpc.id
  cidr_block              = var.subnet-cidr
  availability_zone       = var.avzone
  map_public_ip_on_launch = true
  tags = {
    Name = "variable-sbn"
  }

}

resource "aws_internet_gateway" "variable-igw" {
  vpc_id = aws_vpc.variable-vpc.id

  tags = {
    Name = "variable-igw"
  }

}

resource "aws_route_table" "variable-rt" {
  vpc_id = aws_vpc.variable-vpc.id

  tags = {
    Name = "variable-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.variable-igw.id
  }
}

resource "aws_route_table_association" "variable-table" {
  subnet_id      = aws_subnet.variable-aws_subnet.id
  route_table_id = aws_route_table.variable-rt.id
}
