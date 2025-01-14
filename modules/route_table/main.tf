resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}


resource "aws_route_table_association" "public_route_association_a" {
subnet_id      = var.subnet_a
route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_route_association_b" {
subnet_id      = var.subnet_b
route_table_id = aws_route_table.public.id
}
