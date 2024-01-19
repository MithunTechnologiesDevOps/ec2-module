output "ec2_instance_id" {
  value = aws_instance.main.id
}

output "security_group_id" {
  value = aws_security_group.main.id
}

output "ec2_instance" {
  value = aws_instance.main
}
output "security_group" {
  value = aws_security_group.main
}