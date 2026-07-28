output "ec2_public_ip" {
  description = "Public IP of EC2"
  value       = aws_instance.web_server.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of EC2"
  value       = aws_instance.web_server.public_dns
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.mysql.endpoint
}