provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  state = "available"
}

# VPC
resource "aws_vpc" "bulletin-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.env_prefix}-vpc"
    Environment = var.env_prefix
  }
}

# Internet Gateway
resource "aws_internet_gateway" "bulletin-igw" {
  vpc_id = aws_vpc.bulletin-vpc.id
  tags = {
    Name = "${var.env_prefix}-igw"
    Environment = var.env_prefix
  }
}

# Route Table
resource "aws_route_table" "bulletin-route-table" {
  vpc_id = aws_vpc.bulletin-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bulletin-igw.id
  }

  tags = {
    Name = "${var.env_prefix}-rtb"
    Environment = var.env_prefix
  }
}

# Public Subnets
resource "aws_subnet" "bulletin-sb" {
  count = 2
  vpc_id = aws_vpc.bulletin-vpc.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.env_prefix}-sb"
    Environment = var.env_prefix
  }
}


# Route Table Associations
resource "aws_route_table_association" "rtb-subnet" {
  count = length(aws_subnet.bulletin-sb)
  subnet_id = aws_subnet.bulletin-sb[count.index].id
  route_table_id = aws_route_table.bulletin-route-table.id
}

# Security Group for EC2 Instance
resource "aws_security_group" "bulletin-sg" {
  vpc_id = aws_vpc.bulletin-vpc.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_prefix}-sg"
    Environment = var.env_prefix
  }
}

# EC2 Instance

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "bulletin-server" {
  ami = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = aws_subnet.bulletin-sb[0].id
  vpc_security_group_ids = [aws_security_group.bulletin-sg.id]

  tags = {
    Name = "${var.env_prefix}-server"
    Environment = var.env_prefix
  }

  depends_on = [aws_internet_gateway.bulletin-igw]
}