resource "aws_subnet" "public_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_a
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-A"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block_b
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet-B"
  }
}
