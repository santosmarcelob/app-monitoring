output "sg_id" {
  value = aws_security_group.sg.id
}

output "private_sg_id" {
  description = "ID do Security Group das instâncias privadas"
  value       = aws_security_group.private_sg.id
}
