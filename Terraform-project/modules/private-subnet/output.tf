output "subnet_ids" {
  value = aws_subnet.private_subnets[*].id
}
