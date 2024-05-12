output "public_nat_gateway_id" {
  value = aws_nat_gateway.public_nat_gateway.id
}

output "private_nat_gateway_id" {
  value = aws_nat_gateway.private_nat_gateway.id
}
