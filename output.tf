output "instance_ip" {
  description = "Instances public ips"
  value = aws_instance.app_server.public_ip
}
output "instance_dns" {
  description = "Instances public ips"
  value = aws_instance.app_server.public_dns
}
output "instance_id" {
  description = "Instance ids"
  value = aws_instance.app_server.id
}