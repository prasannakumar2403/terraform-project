resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "demo-vpc"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.main_vpc.id
  availability_zone = data.aws_availability_zones.selected.names[0]
  cidr_block = var.public_subnet-1_cidr
  map_public_ip_on_launch = var.public_ip_on_launch
  tags = {
    Name = var.public_subnet_tag
  }
}

resource "aws_internet_gateway" "demo-igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "demo-igw"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-igw.id
  }
  tags = {
    Name = "public route table"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.main_vpc.id
  availability_zone = data.aws_availability_zones.selected.names[1]
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "private subnet"
  }
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-igw.id
  }
  tags = {
    Name = "private route table"
  }
}

resource "aws_nat_gateway" "ngw_1" {
    allocation_id = aws_eip.eip_1.id
    subnet_id = aws_subnet.public-subnet.id

}
