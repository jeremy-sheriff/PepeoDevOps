output "public_a_cidr_block" {
  value = aws_subnet.public_a.cidr_block
}

output "public_b_cidr_block" {
  value = aws_subnet.public_b.cidr_block
}

output "public_a_id" {
  value = aws_subnet.public_a.id
}

output "public_b_id" {
  value = aws_subnet.public_b.id
}