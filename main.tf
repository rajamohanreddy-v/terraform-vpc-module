resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true

  tags = {
    Name = "main"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id #vpc association

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public" { 
  count = length(var.public_sub_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_sub_cidr[count.index]
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "private" {             
  count = length(var.private_sub_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_sub_cidr[count.index]
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]

  tags = {
    Name = "private"
  }
}

resource "aws_subnet" "database" {
  count = length(var.database_sub_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_sub_cidr[count.index]
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]

  tags = {
    Name = "database"
  }
}