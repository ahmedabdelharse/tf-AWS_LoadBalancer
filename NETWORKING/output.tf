output "igw-out" {
  value = aws_internet_gateway.igw
}
output "default-sg-out" {
  value = aws_default_security_group.default-sg
}
# output "default-sg-out-id" {
#   value = aws_default_security_group.default-sg.id
# }