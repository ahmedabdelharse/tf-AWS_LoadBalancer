output "igw-out" {
  value = aws_internet_gateway.igw
}
output "default-sg" {
  value = aws_default_security_group.default-sg
}