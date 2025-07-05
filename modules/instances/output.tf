output "application_server" {
    value = aws_instance.application_server
}

output "application_server_private_ip" {
    value = aws_instance.application_server.public_ip
}

output "db_server_private_ip" {
    value = aws_instance.db_server.private_ip   
}

output "monitoring_server_private_ip" {
    value = aws_instance.monitoring_server.private_ip
}

output "key" {
  value = tls_private_key.key.public_key_openssh
}