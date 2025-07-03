provider "aws" {
  region = var.prod_region
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr_block = var.prod_cidr_block
}

module "subnet" {
  source = "../../modules/subnet"
  subnet_cidr_block = var.prod_sub_cidr_block
  vpc_id = module.vpc.vpc_id_for_use
}

module "ec2" {
  source = "../../modules/ec2"
  ami = var.prod_ami_image
  instance_type = var.prod_instance_type
  subnet_id = module.subnet.subnet_id
  depends_on = [module.subnet]
}

# module "s3" {
#   source = "../../modules/s3"
#   bucket_name = var.bucket_name
# }

module "rds-mysql" {
  source = "../../modules/rds-mysql"
  allocated_storage = var.prod_allocated_storage
  db_name = var.prod_db_name
  engine = var.prod_engine
  engine_version = var.prod_engine_version
  instance_class = var.prod_instance_class
  username = var.prod_username
  password = var.prod_password
  parameter_group_name = var.prod_parameter_group_name
  skip_final_snapshot = var.prod_skip_final_snapshot
}