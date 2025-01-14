resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "pepeo-igw"
  }
}

output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}
