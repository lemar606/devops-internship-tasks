resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
}

# resource "aws_db_subnet_group" "wp_db" {
#   name       = "wp-db-subnet-group"
#   subnet_ids = [aws_subnet.public.id, aws_subnet.private.id]
# }

# resource "aws_security_group" "rds_sg" {
#   name        = "rds-sg"
#   description = "Allow MySQL access from EC2"
#   vpc_id      = var.vpc_id

#   ingress {
#     description     = "MySQL"
#     from_port       = 3306
#     to_port         = 3306
#     protocol        = "tcp"
#     security_groups = [module.subnet.wp_ec2_sg_id]
#   }
# }