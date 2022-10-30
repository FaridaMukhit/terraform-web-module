######### VPC #########
resource "aws_vpc" "custom_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "public-subnet-A")
  })
}
  
########### Public Subnets ##########
resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.pub_subnet_cidrA
  availability_zone = var.az_1a
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "public-subnet-A")
  })
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.pub_subnet_cidrB
  availability_zone = var.az_1b
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "public-subnet-B")
  })
}

resource "aws_subnet" "public_subnet3" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.pub_subnet_cidrC
  availability_zone = var.az_1c
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "public-subnet-C")
  })
}

########### Public Route Table ###########
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "public-route-table")
  })
}

########## Public Route Table Association #########
resource "aws_route_table_association" "public_route_table1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table3" {
  subnet_id      = aws_subnet.public_subnet3.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table4" {
  gateway_id     = aws_internet_gateway.internet_gateway.id
  route_table_id = aws_route_table.public_route_table.id
}

######### Internet Gateway ##########
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.custom_vpc.id
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "internet-gateway")
  })
}

######## Private Subnets ##########
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.private_subnet_cidrA
  availability_zone = var.az_1a
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "private-subnet-A")
  })
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.private_subnet_cidrB
  availability_zone = var.az_1b
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "private-subnet-B")
  })
}

resource "aws_subnet" "private_subnet3" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.private_subnet_cidrC
  availability_zone = var.az_1c
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "private-subnet-C")
  })
}

########### Private Route Table ###########
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.custom_vpc.id
  route {
    cidr_block     = var.cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "private-route-table")
  })
}

########## Private Route Table Association #########
resource "aws_route_table_association" "private_route_table1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_route_table2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_route_table3" {
  subnet_id      = aws_subnet.private_subnet3.id
  route_table_id = aws_route_table.private_route_table.id
}

############ NAT Gateaway ##############
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnet1.id
  depends_on    = [aws_internet_gateway.internet_gateway]
  tags = merge(
    local.common_tags,
    {
      Name = replace(local.name, "rtype", "nat-gateway")
  })
}

######### Elastic IP ############
resource "aws_eip" "elastic_ip" {
  vpc = true
  tags = {
    Name = "${var.env}-elastic-ip"
  }
}
