output "aws_instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "aws_instance_availability_zone" {
  value = aws_instance.web.availability_zone
}