output "lamp_server_public_ip" {
  value = aws_instance.lamp_server.public_ip
}

output "prometheus_server_public_ip" {
  value = aws_instance.prometheus_server.public_ip
}