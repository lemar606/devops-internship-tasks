provider "aws" {
  region = var.prod_region
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr_block = var.prod_cidr_block
  wordpress_prefix = var.wordpress_prefix
}

module "subnet" {
  source = "../../modules/subnet"
  subnet_cidr_block = var.prod_sub_cidr_block
  wordpress_prefix = var.wordpress_prefix
  vpc_id = module.vpc.vpc_id_for_use
  availability_zone = "${var.prod_region}a"
  key_name = var.key_name
  }

module "ec2" {
  source = "../../modules/ec2"
  ami = var.prod_ami_image
  instance_type = var.prod_instance_type
  availability_zone = "${var.prod_region}a"
  wordpress_prefix = var.wordpress_prefix
  subnet_id = module.subnet.subnet_id
  vpc_security_group_ids = [module.subnet.wp_ec2_sg_id]
  key_name = var.key_name
  depends_on = [module.subnet]
}

resource "null_resource" "ansible" {
  triggers = {
    trigger = module.ec2.aws_instance_public_ip
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${module.ec2.aws_instance_public_ip}, -u ec2-user --private-key wordpress-key.pem ./ansible/nginx.yaml"
  }
  depends_on = [module.ec2, module.rds-mysql]
}

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
