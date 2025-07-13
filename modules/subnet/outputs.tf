output "subnet_id" {
  value = aws_subnet.public.id
}

output "wp_ec2_sg_id" {
  value = aws_security_group.wp_ec2_sg.id
}