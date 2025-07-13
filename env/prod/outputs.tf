output "aws_instance_public_ip" {
  value = module.ec2.aws_instance_public_ip
}

output "rds_endpoint" {
  value = module.rds-mysql.rds_endpoint
}

output "wp_ec2_sg_id" {
  value = module.subnet.wp_ec2_sg_id
}

output "aws_instance_availability_zone" {
  value = module.ec2.aws_instance_availability_zone
}