resource "aws_vpc" "vpc-dev" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "dev vpc"
  }
}

#Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc-dev.id

  tags = {
    Name = "dev ig"
  }
}
#Subnet Public
resource "aws_subnet" "vpc-dev-subnet-az1" {
  vpc_id     = aws_vpc.vpc-dev.id
  cidr_block = var.pub_sub_az1
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public subnet az1"
  }
}

resource "aws_subnet" "vpc-dev-subnet-az2" {
  vpc_id     = aws_vpc.vpc-dev.id
  cidr_block = var.pub_sub_az2
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public subnet az2"
  }
}

#Route Table

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc-dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
      }

  tags = {
    Name = "IG vpc-dev"
  }
}

###Subnet association

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.vpc-dev-subnet-az1.id
  route_table_id = aws_route_table.rt1.id
}
resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.vpc-dev-subnet-az2.id
  route_table_id = aws_route_table.rt1.id
}

##Private Subnet

resource "aws_subnet" "vpc-pridev-subnet-az1" {
  vpc_id     = aws_vpc.vpc-dev.id
  cidr_block = var.pri_sub_az1
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private subnet az1"
  }
}

resource "aws_subnet" "vpc-pridev-subnet-az2" {
  vpc_id     = aws_vpc.vpc-dev.id
  cidr_block = var.pri_sub_az2
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private subnet az2"
  }
}


##Private Data Subnet

resource "aws_subnet" "vpc-pridatadev-subnet-az1" {
  vpc_id     = aws_vpc.vpc-dev.id
  cidr_block = var.pri_data_sub_az1
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private data subnet az1"
  }
}

resource "aws_subnet" "vpc-pridatadev-subnet-az2" {
  vpc_id     = aws_vpc.vpc-dev.id
  cidr_block = var.pri_data_sub_az2
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Private data subnet az2"
  }
}


